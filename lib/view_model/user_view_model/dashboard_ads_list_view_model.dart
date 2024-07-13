import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';
import 'package:radigone_v3/repositories/user/home_repository.dart';

import '../../models/user_models/dashboard_ads_list_user.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class DashboardUserProvider with ChangeNotifier {
  String? _username;
  String? _password;
  String? _token;
  bool _isLoading = true;

  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
  }

  setPassword() async {
    _password = await SecureStorage().readSecureData('password');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
  }


  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  DashboardUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();

    _navigationServices = getIt.get<NavigationServices>();
  }

  bool get isLoading => _isLoading;

  final _myRepo = UserHomeRepository();

  ApiResponse<UserDashboard> adsList = ApiResponse.loading();

  setAdsList(ApiResponse<UserDashboard> response) {
    adsList = response;
    notifyListeners();
  }

  loginUserDashboard(BuildContext context) async {
    await setUsername();
    await setPassword();
    await setToken();

    setAdsList(ApiResponse.loading());

    Map headers = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    if (_username != null && _password != null) {
      _myRepo.userDashboardAdsListApi(headers: headers).then((value) {
        setAdsList(ApiResponse.completed(value));
        // _alertServices.flushBarErrorMessages("Fresh Data Fetched", context);
      }).onError((error, stackTrace) {
        setAdsList(ApiResponse.error(error.toString()));
        _alertServices.flushBarErrorMessages(error.toString(), context);
      });
    }
  }
}
