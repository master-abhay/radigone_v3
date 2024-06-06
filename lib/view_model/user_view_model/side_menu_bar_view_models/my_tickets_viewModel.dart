import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/UserMyTicketsModel.dart';

import '../../../data/response/ApiResponse.dart';
import '../../../repositories/user/sideBar_repository.dart';
import '../../services/alert_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';

class MyTicketsViewModel with ChangeNotifier{


  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  MyTicketsViewModel(){
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  String? _token;


  Future<void> setToken() async {
    _token = await SecureStorage().readSecureData('token');
    if (kDebugMode) {
      print('Printing the Token from Transaction viewModel: $_token');
    }
  }

  final _myRepo = userSidebarRepository();

  ApiResponse<UserMyTicketsModel> myTickets = ApiResponse.loading();

  setMyTickets(ApiResponse<UserMyTicketsModel> response) {
    myTickets = response;
    notifyListeners();
  }


  Future<void> fetchMyTickets(BuildContext context) async {

    await setToken();

    setMyTickets(ApiResponse.loading());
    Map headers = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo.userMyTicketsApi(header: headers).then((value) {
      setMyTickets(ApiResponse.completed(value));
      if (kDebugMode) {
        print("Api hit");
        log(value.data![0].ticket.toString());
      }
    }).onError((error, stackTrace) {
      setMyTickets(ApiResponse.error(error.toString()));
      _alertServices.flushBarErrorMessages(error.toString(), context);
      if (kDebugMode) {
        print('Error Occurred: ${error.toString()}');
      }
    });
  }



  }