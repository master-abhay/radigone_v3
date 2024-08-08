import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../repositories/user/auth_repository.dart';
import '../../services/alert_services.dart';
import '../../services/auth_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';
import '../dashboard_ads_list_view_model.dart';
import '../profile_view_model.dart';
import '../radigonePoint_view_model.dart';
import '../user_points_view_model.dart';

class LoginUserProvider with ChangeNotifier {
  String? _countryCode;
  String? _mobile;
  String? _password;

  set setCountryCode(String? countryCode) {
    if (countryCode != null && countryCode.isNotEmpty) {
      _countryCode = countryCode;
      if (kDebugMode) {
        print("countryCode set..");
      }
      notifyListeners();
    }
  }

  set setMobile(String? mobile) {
    if (mobile != null && mobile.isNotEmpty) {
      _mobile = mobile;
      if (kDebugMode) {
        print("Mobile set..");
      }
      notifyListeners();
    }
  }

  set setPassword(String? password){
    if (password != null && password.isNotEmpty) {
      _password = password;
      if (kDebugMode) {
        print("Password set..");
      }
      notifyListeners();
    }
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  late AlertServices _alertServices;
  late NavigationServices _navigationServices;
  late AuthService _authService;

  final UserAuthRepository _authRepository = UserAuthRepository();

  LoginUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _authService = getIt.get<AuthService>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  Future<bool> loginUser({
    required BuildContext context,
    required String countryCode,
    required String mobile,
    required String password,
  }) async {
    setLoading(true);
    setCountryCode = countryCode;
    setMobile = mobile;
    setPassword = password;

    final Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final Map<String, String?> body = {
      "country_code": _countryCode,
      "mobile": _mobile,
      "password": _password,
    };

    try {
      final response = await _authRepository.userLoginApi(
        headers: headers,
        body: jsonEncode(body),
      );

      await _handleLoginResponse(response, context);

      setLoading(false);
      return true;
    } catch (error) {
      setLoading(false);
      _alertServices.flushBarErrorMessages(error.toString(), context);
      if (kDebugMode) {
        print("Login error: $error");
      }
      return false;
    }
  }

  Future<void> _handleLoginResponse(Map<String, dynamic> response, BuildContext context) async {
    await SecureStorage().writeSecureData('username', response['data']['username']);
    await SecureStorage().writeSecureData('password', _password!);
    await SecureStorage().writeSecureData('token', '${response['token_type']} ${response['token']}');
    await SecureStorage().writeSecureData('mobile', '${response['data']['mobile']}');
    await SecureStorage().writeSecureData('id', '${response['data']['id']}');

    await _authService.saveUserToken('${response['token_type']} ${response['token']}');
    await _authService.saveUserName('${response['data']['firstname']} ${response['data']['lastname']}');
    await _authService.saveUserEmail('${response['data']['email']}');
    await _authService.saveUserImageLink('${response['data']['image']}');

    if (response['data']['sv'] != 1) {
      // Redirect to SMS verification
    }

    if (response['data']['rv'] != 1) {
      // Redirect to registration payment
    }

    // Initialize data
    await Provider.of<DashboardUserProvider>(context, listen: false).loginUserDashboard(context);
    await Provider.of<UserRadigonePointViewModel>(context, listen: false).fetchUserRadigonePoint(context);
    await Provider.of<UserPointsViewModel>(context, listen: false).fetchUserPoints(context);
    await Provider.of<UserProfileInformationProvider>(context, listen: false).profileInformation(context);

    _navigationServices.pushReplacementNamed('/userMainView');
  }
}
