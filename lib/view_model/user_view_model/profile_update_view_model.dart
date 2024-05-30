import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';

import '../../models/user_models/profile_user.dart';
import '../../repositories/user/profile_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';

class UserprofileUpdateProvider with ChangeNotifier {
  late final AlertServices _alertServices;

  UserprofileUpdateProvider() {
    final GetIt _getIt = GetIt.instance;
    _alertServices = _getIt.get<AlertServices>();
  }

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
      _status;

  void setFirstName(element) {
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
    if(kDebugMode){
      print(_profession);
    }

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

  void setDob(element) {
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

  //Don't need:
  // String? get firstName => _firstName;
  // String? get lastName => _lastName;
  // String? get phoneNumber => _phoneNumber;
  // String? get whatsappNumber => _whatsappNumber;
  // String? get email => _email;
  // String? get gender => _gender;
  // String? get marital => _marital;
  // String? get anniversaryDate => _anniversaryDate;
  // String? get profession => _profession;
  // String? get address => _address;
  // String? get state => _state;
  // String? get country => _country;
  // String? get pinCode => _pinCode;
  // String? get city => _city;
  // String? get dob => _dob;
  // String? get occupation => _occupation;
  // String? get annualIncome => _annualIncome;
  // String? get panCardNumber => _panCardNumber;
  // String? get accountNumber => _accountNumber;
  // String? get reAccountNumber => _reAccountNumber;
  // String? get bankIfsc => _bankIfsc;
  // String? get balance => _balance;
  // String? get status => _status;

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
  }

  bool _isLoading = true;
  bool _isUpdating = false;

  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setUpdating(val) {
    _isUpdating = val;
    notifyListeners();
  }

  profileUpdate(BuildContext context) async {
    setUpdating(true);

    await setUsername();
    await setPassword();
    await setToken();

    var uri = Uri.parse('http://radigone.com/api/v1/user/profile-update');

    // Ensure required fields are not null
    if (_firstName == null || _firstName!.isEmpty) {
      setUpdating(false);
      _alertServices.showToast(message: "First Name is Required");
      if(kDebugMode){
        print("First Name is required");
      }

      return;
    }
    if (_lastName == null || _lastName!.isEmpty) {
      setUpdating(false);
      _alertServices.showToast(message: "Last Name is Required");
      if(kDebugMode){
        print("Last Name is required");
      }

      return;
    }
    if (_accountNumber == null || _accountNumber!.isEmpty) {
      setUpdating(false);
      _alertServices.showToast(message: "Account Number is Required");
      if(kDebugMode){
        print("Account Number is required");
      }

      return;
    }
    if (_reAccountNumber == null || _reAccountNumber!.isEmpty) {
      setUpdating(false);
      _alertServices.showToast(message: "Re-Account Number is Required");
      if(kDebugMode){
        print("Re-Account Number is required");
      }

      return;
    }
    if (_accountNumber != _reAccountNumber) {
      setUpdating(false);
      _alertServices.showToast(
          message: "Account Number and Re-Account Number do not match");
      if(kDebugMode){
        print("Account Number and Re-Account Number do not match");
      }

      return;
    }

    // Handle null values by using empty strings for headers
    var body = jsonEncode({
      'firstname': _firstName ?? '',
      'lastname': _lastName ?? '',
      'mobile': _phoneNumber ?? '',
      'whatsaap': _whatsappNumber ?? '',
      'email': _email ?? '',
      'gander': _gender ?? '',
      'marital': _marital ?? '',
      'anniversary_date': _anniversaryDate ?? '',
      'profession': _profession ?? '',
      'address': _address ?? '',
      'state': _state ?? '',
      'zip': _pinCode ?? '',
      'city': _city ?? '',
      'country': _country ?? '',
      'dob': _dob ?? '',
      'occupation': _occupation ?? '',
      'annual_income': _annualIncome ?? '',
      'pan': _panCardNumber ?? '',
      'account_number': _accountNumber ?? '',
      're_account_number': _reAccountNumber ?? '',
      'bank_ifsc': _bankIfsc ?? '',
    });

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    final _myRepo = UserProfileRepository();

    if (_username != null && _password != null) {
      _myRepo.userProfileUpdateApi(headers, body).then((value) {
        setUpdating(false);
        _alertServices.flushBarErrorMessages("Profile Updated", context);
      }).onError((error, stackTrace) {
        setUpdating(false);
        _alertServices.flushBarErrorMessages(error.toString(), context);
      });
    }
  }
}
