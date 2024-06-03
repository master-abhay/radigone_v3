// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class SponsorLocalDataSaverSharedPreferences {
// //   // initializing the keys to get rid of the typo mistakes:
// //   static const String loginToken = 'loginToken';
// //
// //   late SharedPreferences _sharedPreferences;
// //
// //   SponsorLocalDataSaverSharedPreferences() {
// //     //Calling initialization method of the SponsorSharedPreferences:
// //     initializeSponsorSharedPreferences();
// //   }
// //
// //   Future<void> initializeSponsorSharedPreferences() async {
// //     _sharedPreferences = await SharedPreferences.getInstance();
// //   }
// //
// //
// //   //Function to save the SponsorToken:
// //   Future<bool> setSponsorToken(String token) async {
// //     await initializeSponsorSharedPreferences();
// //     return await _sharedPreferences.setString(loginToken, token);
// //   }
// //
// //   // Function to share the loginToken:
// //
// //   Future<String?> getSponsorToken() async {
// //     await initializeSponsorSharedPreferences();
// //     return _sharedPreferences.getString(loginToken);
// //   }
// //
// //   Future<bool?> removeSponsorToken() async {
// //     await initializeSponsorSharedPreferences();
// //     return _sharedPreferences.remove(loginToken);
// //   }
// //
// // }
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SponsorLocalDataSaverSharedPreferences {
//   // initializing the keys to get rid of the typo mistakes:
//   // static const String isUserLoggedInKey = 'isUserLoggedInKey';
//   static const String token = 'loginToken';
//
//   late SharedPreferences _sharedPreferences;
//
//   SponsorLocalDataSaverSharedPreferences() {
//     //Calling initialization method of the userSharedPreferences:
//     initializeUserSharedPreferences();
//   }
//
//   Future<void> initializeUserSharedPreferences() async {
//     print("--------------initializing the user Shared Preferences");
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   //Function to save the userToken:
//   Future<bool> setSponsorToken(String element) async {
//     await initializeUserSharedPreferences();
//     print(
//         "----saving the userLogin state in UserLocalDataSaverSharedPreferences");
//     return await _sharedPreferences.setString(token, element);
//   }
//
//   // Function to share the loginToken:
//
//   Future<String?> getSponsorToken() async {
//     await initializeUserSharedPreferences();
//     return _sharedPreferences.getString(token);
//   }
//
//   Future<bool?> removeSponsorToken() async {
//     //verify instance is created:
//     await initializeUserSharedPreferences();
//     return _sharedPreferences.remove(token);
//   }
//
// }
//
