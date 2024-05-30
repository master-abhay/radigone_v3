import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/user_repository.dart';
import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';

import '../services/alert_services.dart';
import '../services/navigation_services.dart';
import '../services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';

class LogoutUserProvider with ChangeNotifier {
  late AlertServices _alertServices;
  late UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences;
  late NavigationServices _navigationServices;

  LogoutUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _userLocalDataSaverSharedPreferences =
        getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }



  Future<void> deleteUserDetails()async{
    await _userLocalDataSaverSharedPreferences.removeUserToken();
    await SecureStorage().deleteSecureData('username');
    await SecureStorage().deleteSecureData('password');
    await SecureStorage().deleteSecureData('token');

  }

  final _myRepo = UserRepository();

  Future<bool> logOutUser(BuildContext context) async {
    final String? logoutToken =
        await _userLocalDataSaverSharedPreferences.getUserToken();
    Map data = <String, String>{"Authorization": logoutToken!};

    _myRepo.userLogoutApi(data).then((value) {
      deleteUserDetails();
      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/loginRegistration');
      _alertServices.flushBarErrorMessages("Logout Successfully", context);
    }).onError((error, stackTrace) {

      if(kDebugMode){
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
