import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/user_all_ads_preferences_model.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/user_selected_adsPreferences_model.dart';

import '../../../data/response/ApiResponse.dart';
import '../../../repositories/user/sideBar_repository.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';

class UserAdsPreferencesViewModel with ChangeNotifier {
  bool _isLoading = false;
  String? _token;

  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> setToken() async {
    _token = await SecureStorage().readSecureData('token');
    if (kDebugMode) {
      print('Printing the Token from Transaction viewModel: $_token');
    }
    notifyListeners();
  }

  List<dynamic> _allAdsState = [];
  List<dynamic> get allAdsState => _allAdsState;
  Future<void> customAdsList() async {
    if (allAdsPreferences.data!.data != null) {
      for (var element in allAdsPreferences.data!.data!) {
        _allAdsState.add({
          'id': element.id.toString(),
          'isChecked': false,
          'name': element.name.toString()
        });
        notifyListeners();
      }
    }
  }

  void updateAdState(int index) {
    if (index >= 0 && index < _allAdsState.length) {
      _allAdsState[index]['isChecked'] = !_allAdsState[index]['isChecked'];
      notifyListeners(); // Notify listeners about the change (optional)
    }
  }

  Future<void> checkInitialStates() async {
    for (var element in _selectedNames) {
      for (var item in _allAdsState) {
        if (element.toString() == item['name']) {
          item['isChecked'] = true;
          notifyListeners();
        }
      }
    }
  }

  List<dynamic> submissionList = [];

  Future<void> submitData() async {
    submissionList.clear();
    for (var element in _allAdsState) {
      if (element['isChecked']) {
        submissionList.add(element['name'].toString());
        notifyListeners();
      }
    }
    if (kDebugMode) {
      print(submissionList.toString());
    }
  }

  final _myRepo = userSidebarRepository();
  ApiResponse<UserAllAdsPreferencesModel> allAdsPreferences =
      ApiResponse.loading();

  setAllAdsPreferences(ApiResponse<UserAllAdsPreferencesModel> response) {
    allAdsPreferences = response;
    notifyListeners();
  }

  Future<bool> fetchAllAdsPreferences({required BuildContext context}) async {
    setAllAdsPreferences(ApiResponse.loading());
    setLoading(true);
    await setToken();
    Map header = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo.userAllAdsPreferencesApi(header: header).then((value) {
      _allAdsState.clear();
      setAllAdsPreferences(ApiResponse.completed(value));
      customAdsList();

      setLoading(false);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);

      setAllAdsPreferences(ApiResponse.error(error.toString()));
    });

    return true;
  }

  ApiResponse<UserSelectedAdsPreferencesModel> selectedAdsPreferences =
      ApiResponse.loading();

  setSelectedAdsPreferences(
      ApiResponse<UserSelectedAdsPreferencesModel> response) {
    selectedAdsPreferences = response;
    notifyListeners();
  }

  List<dynamic> _selectedNames = [];

  List<dynamic> get selectedNamed => _selectedNames;


  Future<bool> addNamesToSelectedNamesList()async{
    if (selectedAdsPreferences.data?.data != null) {
      for (var element in selectedAdsPreferences.data!.data!) {
        _selectedNames.add(element.name.toString());
        notifyListeners();
      }
      checkInitialStates();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> fetchSelectedAdsPreferences(
      {required BuildContext context}) async {
    setAllAdsPreferences(ApiResponse.loading());
    setLoading(true);
    await setToken();
    Map header = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo.userSelectedAdsPreferencesApi(header: header).then((value) {
      if(kDebugMode){
        print('UserSelectedAdsPreferences APi Hit Successful');
      }
      _selectedNames.clear();
      setSelectedAdsPreferences(ApiResponse.completed(value));

      addNamesToSelectedNamesList();

      setLoading(false);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);

      setSelectedAdsPreferences(ApiResponse.error(error.toString()));
    });

    return true;
  }
}
