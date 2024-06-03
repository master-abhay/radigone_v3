import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';

import '../../models/user_models/profile_user.dart';
import '../../repositories/user/auth_repository.dart';
import '../../repositories/user/profile_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class UserProfileInformationProvider with ChangeNotifier {
  String? _firstName,
      _lastName,
      _phoneNumber,
      _whatsappNumber,
      _email,
      _gender,
      _marital,
      _anniversaryDate,
      _profession,
      _address,
      _state,
      _country,
      _pinCode,
      _city,
      _dob,
      _occupation,
      _annualIncome,
      _panCardNumber,
      _accountNumber,
      _reAccountNumber,
      _bankIfsc,
      _balance,
      _status,
  _image;

  void setFirstName(String? element) {
    _firstName = element;
    notifyListeners();
  }

  void setLastName(element) {
    _lastName = element;
    notifyListeners();
  }

  void setPhoneNumber(element) {
    _phoneNumber = element;
    notifyListeners();
  }

  void setWhatsappNumber(element) {
    _whatsappNumber = element;
    notifyListeners();
  }

  void setEmail(element) {
    _email = element;
    notifyListeners();
  }

  void setGender(element) {
    _gender = element;
    notifyListeners();
  }

  void setMarital(element) {
    _marital = element;
    notifyListeners();
  }

  void setAnniversaryDate(element) {
    _anniversaryDate = element;
    notifyListeners();
  }

  void setProfession(element) {
    _profession = element;
    notifyListeners();
  }

  void setAddress(element) {
    _address = element;
    notifyListeners();
  }

  void setState(element) {
    _state = element;
    notifyListeners();
  }

  void setCountry(element) {
    _country = element;
    notifyListeners();
  }

  void setPinCode(element) {
    _pinCode = element;
    notifyListeners();
  }

  void setCity(element) {
    _city = element;
    notifyListeners();
  }

  void setDob(String? element) {
    _dob = element;
    notifyListeners();
  }

  void setOccupation(element) {
    _occupation = element;
    notifyListeners();
  }

  void setAnnualIncome(element) {
    _annualIncome = element;
    notifyListeners();
  }

  void setPanCardNumber(element) {
    _panCardNumber = element;
    notifyListeners();
  }

  void setAccountNumber(element) {
    _accountNumber = element;
    notifyListeners();
  }

  void setReAccountNumber(element) {
    _reAccountNumber = element;
    notifyListeners();
  }

  void setBankIfsc(element) {
    _bankIfsc = element;
    notifyListeners();
  }

  void setBalance(element) {
    _balance = element;
    notifyListeners();
  }

  void setStatus(element) {
    _status = element;
    notifyListeners();
  }
  void setImage(element) {
    _image = element;
    notifyListeners();
  }

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  String? get whatsappNumber => _whatsappNumber;
  String? get email => _email;
  String? get gender => _gender;
  String? get marital => _marital;
  String? get anniversaryDate => _anniversaryDate;
  String? get profession => _profession;
  String? get address => _address;
  String? get state => _state;
  String? get country => _country;
  String? get pinCode => _pinCode;
  String? get city => _city;
  String? get dob => _dob;
  String? get occupation => _occupation;
  String? get annualIncome => _annualIncome;
  String? get panCardNumber => _panCardNumber;
  String? get accountNumber => _accountNumber;
  String? get reAccountNumber => _reAccountNumber;
  String? get bankIfsc => _bankIfsc;
  String? get balance => _balance;
  String? get status => _status;
  String? get image => _status;


  // Needed to hit api:
  String? _username;
  String? _password;
  String? _token;
  UserProfileInformation _userProfileInformation = UserProfileInformation();

  UserProfileInformation? get userProfileInformation => _userProfileInformation;

  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
    // print('Username value fetched in Dashboard Provoder: $_username');
  }

  setPassword() async {
    _password = await SecureStorage().readSecureData('password');
    // print('Password value fetched in Dashboard Provoder: $_password');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
    // print('Token value fetched in Dashboard Provoder: $_token');
  }

  setUserProfileInformation(var element) {
    _userProfileInformation = element;
    if (_userProfileInformation != null) {
      setFirstName(_userProfileInformation?.firstname);
      setLastName(_userProfileInformation?.lastname);
      setPhoneNumber(_userProfileInformation?.mobile);
      setWhatsappNumber(_userProfileInformation?.whatsaap);
      setEmail(_userProfileInformation?.email);
      setGender(_userProfileInformation?.gander);
      setMarital(_userProfileInformation?.marital);
      setAnniversaryDate(_userProfileInformation?.anniversaryDate);
      setProfession(_userProfileInformation?.profession);
      setAddress(_userProfileInformation?.address?.address);
      setState(_userProfileInformation?.address?.state);
      setCountry(_userProfileInformation?.address?.country);
      setPinCode(_userProfileInformation?.address?.zip);
      setCity(_userProfileInformation?.address?.city);
      setDob(_userProfileInformation?.dob);
      setOccupation(_userProfileInformation?.occupation);
      setAnnualIncome(_userProfileInformation?.annualIncome);
      setPanCardNumber(_userProfileInformation?.pan);
      setAccountNumber(_userProfileInformation?.accountNumber);
      setReAccountNumber(_userProfileInformation?.reAccountNumber);
      setBankIfsc(_userProfileInformation?.bankIfsc);
      setBalance(_userProfileInformation?.balance);
      setStatus(_userProfileInformation?.status.toString());
      setImage(_userProfileInformation.image.toString());
    }
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

  UserProfileInformationProvider(){

    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    // _userLocalDataSaverSharedPreferences =
    //     getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }
  final _myRepo = UserProfileRepository();

   ApiResponse<UserProfileInformation> profileInfo = ApiResponse.loading();

  setUserProfileInfo(ApiResponse<UserProfileInformation> response){
    profileInfo = response;
    notifyListeners();
  }

  profileInformation(BuildContext context) async {
    Map headers = <String, String>{
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    if (_username != null && _password != null) {
      _myRepo.userProfileApi(headers: headers).then((value) {
        setUserProfileInfo(ApiResponse.completed(value));
        setUserProfileInformation(value);
        setLoading(false);
        // _alertServices.flushBarErrorMessages("Profile Fetched", context);

      }).onError((error, stackTrace) {
        if(kDebugMode){
          print(error.toString());
        }
        setLoading(false);

        setUserProfileInfo(ApiResponse.error(error.toString()));

        // _alertServices.flushBarErrorMessages(error.toString(), context);

      });
    }
  }

  // profileInformation(BuildContext context) async {
  //
  //   setLoading(true);
  //
  //   Map headers = <String, String>{
  //     "Authorization": _token!,
  //     'username': _username!,
  //     'password': _password!,
  //   };
  //   if (_username != null && _password != null) {
  //     _myRepo.userProfileApi(headers).then((responseBody) {
  //       var data = UserProfileInformation.fromJson(responseBody['data']);
  //       setUserProfileInformation(data);
  //       setLoading(false);
  //       _alertServices.flushBarErrorMessages("Profile Fetched", context);
  //
  //     }).onError((error, stackTrace) {
  //       if(kDebugMode){
  //         print(error.toString());
  //       }
  //       setLoading(false);
  //       _alertServices.flushBarErrorMessages(error.toString(), context);
  //
  //     });
  //   }
  //
  // }
}
