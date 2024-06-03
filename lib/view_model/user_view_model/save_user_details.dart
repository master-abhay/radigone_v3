// import 'package:flutter/cupertino.dart';
// import 'package:get_it/get_it.dart';
//
// import '../../models/user_models/login_user.dart';
// import '../services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';
//
// class SaveUserDetails with ChangeNotifier {
//   Future<bool> saveUser(LoginUserModel loginUserModel) async {
//     final GetIt _getIt = GetIt.instance;
//
//     UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences =
//         _getIt.get<UserLocalDataSaverSharedPreferences>();
//     _userLocalDataSaverSharedPreferences.setUserToken(
//         '${loginUserModel.tokenType.toString()} ${loginUserModel.token.toString()}');
//     notifyListeners();
//     return true;
//   }
//
//   Future<LoginUserModel> getUser() async {
//     final GetIt _getIt = GetIt.instance;
//
//     UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences =
//         _getIt.get<UserLocalDataSaverSharedPreferences>();
//
//     final String? token =
//         await _userLocalDataSaverSharedPreferences.getUserToken();
//
//     return LoginUserModel(token: token);
//   }
//
//   Future<bool> removeUser() async {
//     final GetIt _getIt = GetIt.instance;
//
//     UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences =
//         _getIt.get<UserLocalDataSaverSharedPreferences>();
//
//     bool? result = await _userLocalDataSaverSharedPreferences.removeUserToken();
//     if (result!) {
//       return true;
//     }
//     return false;
//   }
//
//
// }
