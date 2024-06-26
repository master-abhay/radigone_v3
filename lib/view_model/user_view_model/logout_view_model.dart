import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';

import '../services/alert_services.dart';
import '../services/auth_services.dart';
import '../services/navigation_services.dart';

class LogoutUserProvider with ChangeNotifier {
  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  late AuthService _authService;

  LogoutUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _authService = getIt.get<AuthService>();

    _navigationServices = getIt.get<NavigationServices>();
  }

  Future<void> deleteUserDetails() async {
    if (kDebugMode) {
      print("Deleting the user Details by loggin out");
    }
    await _authService.clearAllUserData();

    //Deleting full data from SecureStorage
    await SecureStorage().deleteAllSecureData();
    await SecureStorage().deleteSecureData('username');
    await SecureStorage().deleteSecureData('password');
    await SecureStorage().deleteSecureData('token');
    await SecureStorage().deleteSecureData('id');
    // LoginUserModel() = LoginUserModel();
  }

  final _myRepo = UserAuthRepository();

  Future<bool> logOutUser(BuildContext context) async {
    String? logoutToken = await _authService.getUserToken();

    Map header = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": logoutToken ?? ''};

    // _myRepo.userLogoutApi(header).then((value) {
    //   deleteUserDetails();
    //   _navigationServices.goBack();
    //   _navigationServices.pushReplacementNamed('/loginRegistration');
    //   _alertServices.flushBarErrorMessages("Logout Successfully", context);
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error.toString());
    //   }
    //   _alertServices.flushBarErrorMessages(error.toString(), context);
    // });

    _myRepo.userLogoutApi(headers: header,body: null).then((value) {
      deleteUserDetails();
      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/loginRegistration');
      _alertServices.flushBarErrorMessages("Logout Successfully", context);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      _alertServices.flushBarErrorMessages(error.toString(), context);
    });

    return true;
  }

// Future<bool> logOutUser() async {
//   try {
//     String url = "http://radigone.com/api/v1/logout";
//
//     // final String logoutToken =
//     //     '${UserAuthenticationModelsObjects.loggedUserObject.tokenType} ${UserAuthenticationModelsObjects.loggedUserObject.token}';
//
//
//     final String? logoutToken = await  _userLocalDataSaverSharedPreferences.getUserToken();
//     print(logoutToken);
//
//     Response response = await post(Uri.parse(url),
//         headers: <String, String>{"Authorization": logoutToken!});
//
//     if (response.statusCode == 200) {
//       print(
//           "--------------------------------->>>>>>>>>>>>>>>>>>User logout Successful");
//
//       //Setting the Login State of the user to the logout:
//       await _userLocalDataSaverSharedPreferences.setUserState(false);
//       _navigationServices.pushReplacementNamed("/loginRegistration");
//       _alertServices.showToast(message: "Logout Successful 😊");
//
//       return true;
//     }
//     if (response.statusCode == 401) {
//       print(
//           "--------------------------------->>>>>>>>>>>>>>>>>>User logout failed");
//       _alertServices.showToast(message: "Authentication failed Kindly contact admin 😊");
//
//
//       return false;
//     }
//
//     return false;
//   } catch (e) {
//     print(
//         "---------------------------->>>>>>>>>>>>>>>>>>Error while making request to the api ${e.toString()}");
//     _alertServices.showToast(
//         message: "Something went wrong while logging Out");
//
//     return false;
//   }
// }
}
