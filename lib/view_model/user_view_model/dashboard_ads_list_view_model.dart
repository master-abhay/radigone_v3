import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';
import 'package:radigone_v3/repositories/user/home_repository.dart';

import '../../models/user_models/dashboard_ads_list_user.dart';
import '../../repositories/user/auth_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';
import '../services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';

class DashboardUserProvider with ChangeNotifier {
  String? _username;
  String? _password;
  String? _token;
  // UserDashboard _userDashboard = UserDashboard();
  bool _isLoading = true;

  // UserDashboard get userDashboard => _userDashboard;

  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
    // print('Username value fetched in Dashboard Provoder: $_username');
  }

  setPassword() async {
    _password = await SecureStorage().readSecureData('password');
    // print('Password value fetched in Dashboard Provoder: $_password');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
    // print('Token value fetched in Dashboard Provoder: $_token');
  }

  // void setUserDashboard(var responseBody) {
  //   _userDashboard = UserDashboard.fromJson(responseBody);
  //   notifyListeners();
  // }

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  late AlertServices _alertServices;
  late UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences;
  late NavigationServices _navigationServices;

  DashboardUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _userLocalDataSaverSharedPreferences =
        getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  bool get isLoading => _isLoading;


  final _myRepo = UserHomeRepository();

  ApiResponse<UserDashboard> adsList = ApiResponse.loading();

  setAdsList(ApiResponse<UserDashboard> response){

    adsList = response;
    notifyListeners();
  }

  loginUserDashboard(BuildContext context) async{
    setAdsList(ApiResponse.loading());

    Map headers = <String, String>{
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    if (_username != null && _password != null) {
      _myRepo.userDashboardAdsListApi(headers: headers).then((value){
        setAdsList(ApiResponse.completed(value));
        // _alertServices.flushBarErrorMessages("Fresh Data Fetched", context);

      }).onError((error,stackTrace){

      setAdsList(ApiResponse.error(error.toString()));
        _alertServices.flushBarErrorMessages(error.toString(), context);
      });

    }
  }


  // loginUserDashboard(BuildContext context) async {
  //   setIsLoading(true);
  //
  //   Map headers = <String, String>{
  //     "Authorization": _token!,
  //     'username': _username!,
  //     'password': _password!,
  //   };
  //   if (_username != null && _password != null) {
  //     _myRepo.userDashboardAdsListApi(headers).then((value) {
  //
  //       _alertServices.flushBarErrorMessages("Fresh Data Fetched", context);
  //
  //       setIsLoading(false);
  //     }).onError((error, stackTrace) {
  //       _alertServices.flushBarErrorMessages(error.toString(), context);
  //
  //       print(error.toString());
  //       setIsLoading(false);
  //     });
  //   }
  // }
}

//Note: I had Created the functions in such a way so that response body is returned when api hit.
