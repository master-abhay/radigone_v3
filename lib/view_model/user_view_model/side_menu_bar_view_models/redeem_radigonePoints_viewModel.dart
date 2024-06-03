

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/redeem_radigone_points.dart';
import 'package:radigone_v3/resources/app_urls.dart';
import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';

import '../../../repositories/user/sideBar_repository.dart';
import '../../services/alert_services.dart';
import '../../services/navigation_services.dart';

class RedeemRadigonePointsViewModel with ChangeNotifier{


   bool _isLoading = false;
   String? _user_id,_points_redeemed,_desc;

    setUserId()async{
     _user_id =await SecureStorage().readSecureData('id');
     notifyListeners();
   }
   setPointsRedeemed(element){
     _points_redeemed = element;
     notifyListeners();
   }
   setDescription(element){
     _desc = element;
     notifyListeners();
   }

   late AlertServices _alertServices;
   late NavigationServices _navigationServices;

   RedeemRadigonePointsViewModel(){
     final GetIt getIt = GetIt.instance;
     _alertServices = getIt.get<AlertServices>();
     _navigationServices = getIt.get<NavigationServices>();
   }


  bool get isLoading => _isLoading;

  setIsLoading(bool element){
    _isLoading = element;
    notifyListeners();
  }

  final _myRepo = userSidebarRepository();
  redeemRadigonePoints(BuildContext context)async{

    setIsLoading(true);
    await setUserId();
    print(await SecureStorage().readSecureData('id'));

    dynamic body = {
      'user_id':_user_id ?? '',
      'points_redeemed': _points_redeemed ?? '',
      'desc': _desc ?? ''
    };

    _myRepo.userRedeemRadigonePointsApi(body: body).then((value){

      setIsLoading(false);
      _alertServices.flushBarErrorMessages(value.message.toString(), context);


    }).onError((error,stackTrace){
      setIsLoading(false);
      _alertServices.flushBarErrorMessages(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
        print('Api hitting Unsuccessful');
      }

    });



  }




}