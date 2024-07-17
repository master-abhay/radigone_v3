import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';

import '../../models/user_models/profile_user.dart';
import '../../repositories/user/profile_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class UserProfileInformationProvider with ChangeNotifier {
  // Needed to hit api:
  String? _username;
  String? _password;
  String? _token;


  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
  }

  setPassword() async {
    _password = await SecureStorage().readSecureData('password');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
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

  UserProfileInformationProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    // _userLocalDataSaverSharedPreferences =
    //     getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  final _myRepo = UserProfileRepository();

  ApiResponse<UserProfileInformation> profileInfo = ApiResponse.loading();

  setUserProfileInfo(ApiResponse<UserProfileInformation> response) {
    profileInfo = response;
    notifyListeners();
  }

  profileInformation(BuildContext context) async {
    await setUsername();
    await setPassword();
    await setToken();

    Map headers = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    if (_username != null && _password != null) {
      _myRepo.userProfileApi(headers: headers).then((value) {
        setUserProfileInfo(ApiResponse.completed(value));
        // setUserProfileInformation(value);
        setLoading(false);
        // _alertServices.flushBarErrorMessages("Profile Fetched", context);
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
        }
        setLoading(false);

        setUserProfileInfo(ApiResponse.error(error.toString()));

        // _alertServices.flushBarErrorMessages(error.toString(), context);
      });
    }
  }
}
