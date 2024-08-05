import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:radigone_v3/models/user_models/auth_models/viewer_registration_model.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';

import '../../../data/response/ApiResponse.dart';
import '../../services/alert_services.dart';

class ViewerRegistrationViewmodel with ChangeNotifier {
  late AlertServices _alertServices;

  ViewerRegistrationViewmodel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  String? _firstname;
  String? _lastname;
  String? _username;
  String? _mobile;
  String? _whatsapp; // Using 'whatsapp' to match API
  String? _address;
  String? _gender;
  String? _marital;
  String? _state;
  String? _city;
  String? _pincode;
  String? _email;
  String? _password;
  String? _country_code; // Using 'country_code' to match API
  String? _pan;
  String? _password_confirmation; // Using 'password_confirmation' to match API
  String? _country;
  String? _country_code_wp; // Using 'country_code_wp' to match API

  // Getters
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get username => _username;
  String? get mobile => _mobile;
  String? get whatsapp => _whatsapp;
  String? get address => _address;
  String? get gender => _gender;
  String? get marital => _marital;
  String? get state => _state;
  String? get city => _city;
  String? get pincode => _pincode;
  String? get email => _email;
  String? get password => _password;
  String? get country_code => _country_code; // Getter for 'country_code'
  String? get pan => _pan;
  String? get password_confirmation =>
      _password_confirmation; // Getter for 'password_confirmation'
  String? get country => _country;
  String? get country_code_wp =>
      _country_code_wp; // Getter for 'country_code_wp'

  File? _addressProof, _panCardProof;

  // Setters
  set firstname(String? value) {
    _firstname = value;
    notifyListeners();
  }

  set lastname(String? value) {
    _lastname = value;
    notifyListeners();
  }

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  set mobile(String? value) {
    _mobile = value;
    notifyListeners();
  }

  set whatsapp(String? value) {
    _whatsapp = value;
    notifyListeners();
  }

  set address(String? value) {
    _address = value;
    notifyListeners();
  }

  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  set marital(String? value) {
    _marital = value;
    notifyListeners();
  }

  set state(String? value) {
    _state = value;
    notifyListeners();
  }

  set city(String? value) {
    _city = value;
    notifyListeners();
  }

  set pincode(String? value) {
    _pincode = value;
    notifyListeners();
  }

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  set country_code(String? value) {
    _country_code = value;
    notifyListeners();
  }

  set pan(String? value) {
    _pan = value;
    notifyListeners();
  }

  set password_confirmation(String? value) {
    _password_confirmation = value;
    notifyListeners();
  }

  set country(String? value) {
    _country = value;
    notifyListeners();
  }

  set country_code_wp(String? value) {
    _country_code_wp = value;
    notifyListeners();
  }

  set addressProof(File? file) {
    _addressProof = file;
    notifyListeners();
  }

  set panCardProof(File? file) {
    _panCardProof = file;
    notifyListeners();
  }

  //*------Accessing Api Services------*
  final UserAuthRepository _authenticationRepository = UserAuthRepository();
  ApiResponse<ViewerRegistrationModel> _apiResponse = ApiResponse.none();

  ApiResponse<ViewerRegistrationModel> get apiResponse => _apiResponse;

  set setResponse(ApiResponse<ViewerRegistrationModel> response) {
    _apiResponse = response;
    notifyListeners();
  }

  //*------Submitting Registration Form------*

  Future<bool> signup(BuildContext context) async {
    try {
      setResponse = ApiResponse.loading();

      var addressProofStream = http.ByteStream(_addressProof!.openRead());
      var panCardStream = http.ByteStream(_panCardProof!.openRead());
      var addressProofLength = await _addressProof!.length();
      var panCardLength = await _panCardProof!.length();

      var panMultipartFile = http.MultipartFile(
          'pan_card', panCardStream, panCardLength,
          filename: _panCardProof!.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'));

      var addressMultipartFile = http.MultipartFile(
          'address_proof', addressProofStream, addressProofLength,
          filename: _addressProof!.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'));

      var files = <http.MultipartFile>[panMultipartFile, addressMultipartFile];

      //*-----Create Headers Start-----*
      var headers = {
        'Content-Type': 'application/json',
      };
      //*-----Create Headers End-----*

      //*-----Create Fields Start----*

      // Create fields
      var fields = {
        'firstname': _firstname!,
        'lastname': _lastname!,
        'username': _username!,
        'mobile': _mobile!,
        'whatsapp': _whatsapp!,
        'address': _address!,
        'gender': _gender!,
        'marital': _marital!,
        'state': _state!,
        'city': _city!,
        'pincode': _pincode!,
        'email': _email!,
        'password': _password!,
        'country_code': _country_code!,
        'pan': _pan!,
        'password_confirmation': _password_confirmation!,
        'country': _country!,
        'country_code_wp': _country_code_wp!,
      }; // *-----Create Fields End-----*

      //*-----Calling Api Start-----*

      var response = await _authenticationRepository.viewerRegistration(
          fields: fields, headers: headers, files: files);

      //*-----Calling Api End-----*

      setResponse = ApiResponse.completed(response);

      //*---------Navigating to Otp Verification View---------*
      return true;
    } catch (error) {
      setResponse = ApiResponse.error(error.toString());
      _alertServices.flushBarErrorMessages(error.toString(), context);
      return false;
    }
  }
}
