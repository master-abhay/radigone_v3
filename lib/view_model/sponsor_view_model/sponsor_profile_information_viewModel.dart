import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/sponsor_models/sponsor_profile_information_model.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_profile_update_viewModel.dart';

import '../../data/response/ApiResponse.dart';
import '../../repositories/sponsor/profile_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class SponsorProfileInformationViewModel with ChangeNotifier {
  String? _token;
  setToken() async {
    _token = await SecureStorage().readSecureData('token');
    // print('Token value fetched in Dashboard Provoder: $_token');
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  late AlertServices _alertServices;

  // late UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences;
  late NavigationServices _navigationServices;

  SponsorProfileInformationViewModel() {
    final GetIt getIt = GetIt.instance;

    _alertServices = getIt.get<AlertServices>();
    // _userLocalDataSaverSharedPreferences =
    //     getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  final _myRepo = SponsorProfileRepository();

  ApiResponse<SponsorProfileInformationModel> profileInfo =
      ApiResponse.loading();

  setSponsorProfileInfo(ApiResponse<SponsorProfileInformationModel> response) {
    profileInfo = response;
    notifyListeners();
  }

  fetchProfileInformation(BuildContext context) async {
    await setToken();
    if (kDebugMode) {
      print(_token);
    }

    Map headers = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo.sponsorProfileApi(headers: headers).then((value) async {

      _setProfileUpdateParameters(context:context,value: value);
      setSponsorProfileInfo(ApiResponse.completed(value));
      setLoading(false);
      // _alertServices.flushBarErrorMessages("Profile Fetched", context);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);

      setSponsorProfileInfo(ApiResponse.error(error.toString()));

      // _alertServices.flushBarErrorMessages(error.toString(), context);
    });
  }
}


_setProfileUpdateParameters(
    {required BuildContext context,required SponsorProfileInformationModel value})async{
  final provider =
  Provider.of<SponsorProfileUpdateViewModel>(context, listen: false);


}
