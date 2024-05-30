import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSaverSharedPreferences {
  // initializing the keys to get rid of the typo mistakes:
  // static const String isUserLoggedInKey = 'isUserLoggedInKey';
  static const String token = 'loginToken';

  late SharedPreferences _sharedPreferences;

  UserLocalDataSaverSharedPreferences() {
    //Calling initialization method of the userSharedPreferences:
    initializeUserSharedPreferences();
  }

  Future<void> initializeUserSharedPreferences() async {
    print("--------------initializing the user Shared Preferences");
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Function to save the userState:
  // Future<bool> setUserState(bool userLogin) async {
  //   await initializeUserSharedPreferences();
  //   print(
  //       "----saving the userLogin state in UserLocalDataSaverSharedPreferences");
  //   return await _sharedPreferences.setBool(isUserLoggedInKey, userLogin);
  // }

  //Function to save the userToken:
  Future<bool> setUserToken(String element) async {
    await initializeUserSharedPreferences();
    print(
        "----saving the userLogin state in UserLocalDataSaverSharedPreferences");
    return await _sharedPreferences.setString(token, element);
  }

  // Function to share the userState:
  //
  // Future<bool?> getUserState() async {
  //   await initializeUserSharedPreferences();
  //   return _sharedPreferences.getBool(isUserLoggedInKey);
  // }

  // Function to share the loginToken:

  Future<String?> getUserToken() async {
    await initializeUserSharedPreferences();
    return _sharedPreferences.getString(token);
  }

  Future<bool?> removeUserToken() async {
    //verify instance is created:
    await initializeUserSharedPreferences();
    return _sharedPreferences.remove(token);
  }

// Future<bool?> removeUserState() async {
//   //verify instance is created:
//   await initializeUserSharedPreferences();
//   return _sharedPreferences.remove(isUserLoggedInKey);
// }
}
