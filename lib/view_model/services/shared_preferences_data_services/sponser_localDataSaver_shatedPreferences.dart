import 'package:shared_preferences/shared_preferences.dart';

class SponserLocalDataSaverSharedPreferences {
  // initializing the keys to get rid of the typo mistakes:
  static const String isSponserLoggedInKey = 'issponserLoggedInKey';
  static const String loginToken = 'loginToken';

  late SharedPreferences _sharedPreferences;

  SponserLocalDataSaverSharedPreferences() {
    //Calling initialization method of the sponserSharedPreferences:
    initializesponserSharedPreferences();
  }

  Future<void> initializesponserSharedPreferences() async {
    print("--------------initializing the sponser Shared Preferences");
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Function to save the sponserState:
  Future<bool> setsponserState(bool sponserLogin) async {
    await initializesponserSharedPreferences();
    print(
        "----saving the sponserLogin state in sponserLocalDataSaverSharedPreferences");
    return await _sharedPreferences.setBool(isSponserLoggedInKey, sponserLogin);
  }

  //Function to save the sponserToken:
  Future<bool> setsponserToken(String token) async {
    await initializesponserSharedPreferences();
    print(
        "----saving the sponserLogin state in sponserLocalDataSaverSharedPreferences");
    return await _sharedPreferences.setString(loginToken, token);
  }

  // Function to share the sponserState:

  Future<bool?> getsponserState() async {
    await initializesponserSharedPreferences();
    return _sharedPreferences.getBool(isSponserLoggedInKey);
  }


  // Function to share the loginToken:

  Future<String?> getsponserToken() async {
    await initializesponserSharedPreferences();
    return _sharedPreferences.getString(loginToken);
  }

  Future<bool?> removesponserState() async {
    //verify instance is created:
    await initializesponserSharedPreferences();
    return _sharedPreferences.remove(isSponserLoggedInKey);
  }
}
