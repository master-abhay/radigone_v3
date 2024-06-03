// import 'package:flutter/cupertino.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
// import 'package:radigone_v3/view_model/services/shared_preferences_data_services/sponser_localDataSaver_shatedPreferences.dart';
//
// class SaveSponsorDetails with ChangeNotifier {
//   Future<bool> saveSponsor(LoginSponsorModel loginSponsorModel) async {
//     final GetIt _getIt = GetIt.instance;
//
//      SponsorLocalDataSaverSharedPreferences _sponsorLocalDataSaverSharedPreferences =
//     _getIt.get<SponsorLocalDataSaverSharedPreferences>();
//     _sponsorLocalDataSaverSharedPreferences.setSponsorToken(
//         '${loginSponsorModel.tokenType.toString()} ${loginSponsorModel.token.toString()}');
//     notifyListeners();
//     return true;
//   }
//
//   Future<LoginSponsorModel> getSponsor() async {
//     final GetIt _getIt = GetIt.instance;
//
//     SponsorLocalDataSaverSharedPreferences _sponsorLocalDataSaverSharedPreferences =
//     _getIt.get<SponsorLocalDataSaverSharedPreferences>();
//
//     final String? token =
//     await _sponsorLocalDataSaverSharedPreferences.getSponsorToken();
//
//     return LoginSponsorModel(token: token);
//   }
//
//   Future<bool> removeSponsor() async {
//     final GetIt _getIt = GetIt.instance;
//
//     SponsorLocalDataSaverSharedPreferences _sponsorLocalDataSaverSharedPreferences =
//     _getIt.get<SponsorLocalDataSaverSharedPreferences>();
//
//    bool? result =  await _sponsorLocalDataSaverSharedPreferences.removeSponsorToken();
//     if (result!) {
//       return true;
//     }
//     return false;
//   }
//
//
// }
