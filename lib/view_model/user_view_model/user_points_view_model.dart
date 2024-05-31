import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/user_models/user_points.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';

import '../../data/response/ApiResponse.dart';
import '../../repositories/user/home_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';

class UserPointsViewModel with ChangeNotifier{
  String? _username,_mobile;


  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
    if(kDebugMode){
      print(_username);
    }
  }

  setMobile() async {
     _mobile = await SecureStorage().readSecureData('mobile');

    if(kDebugMode){
      print(_mobile);
    }
  }



  late AlertServices _alertServices;

  UserPointsViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  final _myRepo = UserHomeRepository();
  ApiResponse<UserPointsModel> userPointsViewModel = ApiResponse.loading();

  setUserPointsViewModel(ApiResponse<UserPointsModel> response){
    userPointsViewModel = response;
    notifyListeners();
  }


  fetchUserPoints(BuildContext context)async{
    setUserPointsViewModel(ApiResponse.loading());


    var body = jsonEncode({
      'username':_username!,
      'mobile' : _mobile!
    });

    var header =
      {'Content-Type': 'application/json'};



    if (_username != null && _mobile != null) {
      _myRepo.userUserPointsApi(header,body).then((value) {
        setUserPointsViewModel(ApiResponse.completed(value));
        if(kDebugMode){
          print("Api hit");
        }
        _alertServices.flushBarErrorMessages("User Points Fetched", context);
      }).onError((error, stackTrace) {
        if(kDebugMode){
          print(error.toString());
        }
        setUserPointsViewModel(ApiResponse.error(error.toString()));

        _alertServices.flushBarErrorMessages(error.toString(), context);
      });
    }
  }


}