// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:radigone_v3/repositories/sponsor/auth_repository.dart';
//
// import '../services/alert_services.dart';
//
//
// class RegisterSponsorProvider with ChangeNotifier {
//   late AlertServices _alertServices;
//   RegisterSponsorProvider() {
//     final GetIt getIt = GetIt.instance;
//     _alertServices = getIt.get<AlertServices>();
//   }
//
//   String? _firmName,
//       _firmType,
//       _gstNumber,
//       _designation,
//       _firstName,
//       _lastName,
//       _userName,
//       _phoneNumber,
//       _registrationFees,
//       _postpaidArrangementRequired,
//       _address,
//       _city,
//       _state,
//       _pinCode,
//       _country,
//       _countryCode,
//       _email,
//       _panNumber,
//       _password,
//       _confirmPassword;
//   String _businessCategory = "Not Selected";
//   String _businessSubCategory = "Not Selected";
//   String _multipleLoginRequired = "Not Selected";
//   String _numberOfLoginRequired = "Not Selected";
//
//   // String? _businessCategory,_businessSubCategory;
//
//   File? _addressProof, _panCard;
//
//   bool _isLoading = false;
//
//   void isLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   void firmName(String? element) {
//     _firmName = element;
//     notifyListeners();
//   }
//
//   void firmType(String? element) {
//     _firmType = element;
//     notifyListeners();
//   }
//
//   void gstNumber(String? element) {
//     _gstNumber = element;
//     notifyListeners();
//   }
//
//   void designation(String? element) {
//     _designation = element;
//     notifyListeners();
//   }
//
//   void firstName(String? element) {
//     _firstName = element;
//     notifyListeners();
//   }
//
//   void lastName(String? element) {
//     _lastName = element;
//     notifyListeners();
//   }
//
//   void userName(String? element) {
//     _userName = element;
//     notifyListeners();
//   }
//
//   void phoneNumber(String? element) {
//     _phoneNumber = element;
//     notifyListeners();
//   }
//
//   void businessCategory(String? element) {
//     _businessCategory = element ?? "Others";
//     notifyListeners();
//   }
//
//   void businessSubCategory(String? element) {
//     _businessSubCategory = element ?? "Others";
//     notifyListeners();
//   }
//
//   void registrationFees(String? element) {
//     _registrationFees = element;
//     notifyListeners();
//   }
//
//   void multipleLoginRequired(String? element) {
//     _multipleLoginRequired = element ?? '';
//     notifyListeners();
//   }
//
//   void numberOfLoginRequired(String? element) {
//     _numberOfLoginRequired = element ?? '';
//     notifyListeners();
//   }
//
//   void postPaidArrangementRequired(String? element) {
//     _postpaidArrangementRequired = element;
//     notifyListeners();
//   }
//
//   void address(String? element) {
//     _address = element;
//     notifyListeners();
//   }
//
//   void pinCode(String? element) {
//     _pinCode = element;
//     notifyListeners();
//   }
//
//   void city(String? element) {
//     _city = element;
//     notifyListeners();
//   }
//
//   void state(String? element) {
//     _state = element;
//     notifyListeners();
//   }
//
//   void country(String? element) {
//     _country = element;
//     notifyListeners();
//   }
//
//   void countryCode(String? element) {
//     _countryCode = element;
//     notifyListeners();
//   }
//
//   void email(String? element) {
//     _email = element;
//     notifyListeners();
//   }
//
//   void panNumber(String? element) {
//     _panNumber = element;
//     notifyListeners();
//   }
//
//   void panCard(File? element) {
//     _panCard = element;
//     notifyListeners();
//   }
//
//   void addressProof(File? element) {
//     _addressProof = element;
//     notifyListeners();
//   }
//
//   void password(String? element) {
//     _password = element;
//     notifyListeners();
//   }
//
//   void confirmPassword(String? element) {
//     _confirmPassword = element;
//     notifyListeners();
//   }
//
//
//   final _myRepo = SponsorAuthRepository();
//
//
//   Future<void> SignUpSponsor() async {
//     // print("Firm Name: $_firmName");
//     // print("Firm Type: $_firmType");
//     // print("GST Number: $_gstNumber");
//     // print("Designation: $_designation");
//     // print("First Name: $_firstName");
//     // print("Last Name: $_lastName");
//     // print("Username: $_userName");
//     // print("Phone Number: $_phoneNumber");
//     // print("business Category: $_businessCategory");
//     // print("BusinessSubCategory: $_businessSubCategory");
//     // print("Registration Fees: $_registrationFees");
//     // print("Multiple Login Required:  $_multipleLoginRequired");
//     // print("Number of Login Required: $_numberOfLoginRequired");
//     // print("Postpaid Arrangement Required: $_postpaidArrangementRequired");
//     // print("Address: $_address");
//     // print("City: $_city");
//     // print("State: $_state");
//     // print("PinCode: $_pinCode");
//     // print("Country: $_country");
//     // print("Country Code: $_countryCode");
//     // print("Email: $_email");
//     // print("Password: $_password");
//     // print("Confirm Password: $_confirmPassword");
//     // print("Address Proof: $_addressProof");
//     // print("Pan Card: $_panCard");
//
//     _phoneNumber == null
//         ? _alertServices.showToast(
//         message: "Select Country first then enter 10 digit phone Number")
//         : null;
//
//     _countryCode == null
//         ? _alertServices.showToast(
//         message:
//         "Select Country Code from Phone Number Field first then enter 10 digit phone Number")
//         : null;
//
//     _addressProof == null
//         ? _alertServices.showToast(message: "Upload Address Proof")
//         : null;
//     _panCard == null
//         ? _alertServices.showToast(message: "Upload pan card")
//         : null;
//
//     try {
//       isLoading(true);
//
//       var addressProofStream = http.ByteStream(_addressProof!.openRead());
//       var panCardStream = http.ByteStream(_panCard!.openRead());
//       var addressProofLength = await _addressProof!.length();
//       var panCardLength = await _panCard!.length();
//       var uri = Uri.parse("http://radigone.com/api/v1/surveys/register");
//       var request = http.MultipartRequest('POST', uri);
//
//       request.fields['firstname'] = _firstName ?? "Not Selected";
//       request.fields['lastname'] = _lastName ?? "Not Selected";
//       request.fields['firm_name'] = _firmName ?? "Not Selected";
//       request.fields['firm_type'] = _firmType ?? "Not Selected";
//       request.fields['email'] = _email ?? "Not Selected";
//       request.fields['username'] = _userName ?? "Not Selected";
//       request.fields['mobile'] = _phoneNumber ?? "Not Selected";
//       request.fields['address'] = _address ?? "Not Selected";
//       request.fields['state'] = _state ?? "Not Selected";
//       request.fields['zip'] = _pinCode ?? "Not Selected";
//       request.fields['country_code'] = _countryCode ?? "Not Selected";
//       request.fields['country'] = _country ?? "Not Selected";
//       request.fields['city'] = _city ?? "Not Selected";
//       request.fields['business_cat'] = _businessCategory ?? "Not Selected";
//       request.fields['business_subcat'] = _businessSubCategory ?? "Not Selected";
//       request.fields['multi_login'] = _multipleLoginRequired ?? "Not Selected";
//       request.fields['num_login'] = _numberOfLoginRequired ?? "Not Selected";
//       request.fields['designation'] = _designation ?? "Not Selected";
//       request.fields['pan'] = _panNumber ?? "Not Selected";
//       request.fields['password'] = _password ?? "Not Selected";
//
//
//       // print("Pan Card Path: ${_panCard!.path}");
//       // print("Address Proof Path: ${_addressProof!.path}");
//
//       var panMultipartFile = http.MultipartFile(
//           'pan_card', panCardStream, panCardLength,
//           filename: _panCard!.path.split('/').last,
//           contentType: MediaType('application', 'octet-stream'));
//
//
//       var addressMultipartFile = http.MultipartFile(
//           'address_proof', addressProofStream, addressProofLength,
//           filename: _addressProof!.path.split('/').last,
//           contentType: MediaType('application', 'octet-stream'));
//
//
//       request.files.add(panMultipartFile);
//       request.files.add(addressMultipartFile);
//
//       var header = {
//         'Content-Type': 'application/json',
//       };
//
//
//
//
//
//       var response;
//
//       if(_password == _confirmPassword){
//         var response0 = await request.send();
//         response = response0;
//       }else{
//         _alertServices.showToast(message: "Password Doesn't match");
//       }
//
//       if (response.statusCode ==
//           200) {
//         isLoading(false);
//         print("Sponsor Registered Successfully");
//
//
//       }
//       else{
//         isLoading(false);
//         var responseBody = await response.stream.bytesToString();
//         var decodedResponse = jsonDecode(responseBody.toString());
//         print(
//             "Sponsor not registered ${response.statusCode}");
//         print("Response Body: $decodedResponse");
//
//         if (decodedResponse['errors'] != null) {
//           print('Error: ${decodedResponse['errors']}');
//           _alertServices.showToast(message: decodedResponse['errors'].toString());
//         }
//
//       }
//
//
//     } catch (e) {
//       print("Error: $e");
//       isLoading(false);
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:radigone_v3/repositories/sponsor/auth_repository.dart';

import '../services/alert_services.dart';


class RegisterSponsorProvider with ChangeNotifier {
  late AlertServices _alertServices;
  RegisterSponsorProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  String? _firmName,
      _firmType,
      _gstNumber,
      _designation,
      _firstName,
      _lastName,
      _userName,
      _phoneNumber,
      _registrationFees,
      _postpaidArrangementRequired,
      _address,
      _city,
      _state,
      _pinCode,
      _country,
      _countryCode,
      _email,
      _panNumber,
      _password,
      _confirmPassword;
  String _businessCategory = "Not Selected";
  String _businessSubCategory = "Not Selected";
  String _multipleLoginRequired = "Not Selected";
  String _numberOfLoginRequired = "Not Selected";

  // String? _businessCategory,_businessSubCategory;

  File? _addressProof, _panCard;

  bool _isLoading = false;

  bool get loading => _isLoading;

  void isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void firmName(String? element) {
    _firmName = element;
    notifyListeners();
  }

  void firmType(String? element) {
    _firmType = element;
    notifyListeners();
  }

  void gstNumber(String? element) {
    _gstNumber = element;
    notifyListeners();
  }

  void designation(String? element) {
    _designation = element;
    notifyListeners();
  }

  void firstName(String? element) {
    _firstName = element;
    notifyListeners();
  }

  void lastName(String? element) {
    _lastName = element;
    notifyListeners();
  }

  void userName(String? element) {
    _userName = element;
    notifyListeners();
  }

  void phoneNumber(String? element) {
    _phoneNumber = element;
    notifyListeners();
  }

  void businessCategory(String? element) {
    _businessCategory = element ?? "Others";
    notifyListeners();
  }

  void businessSubCategory(String? element) {
    _businessSubCategory = element ?? "Others";
    notifyListeners();
  }

  void registrationFees(String? element) {
    _registrationFees = element;
    notifyListeners();
  }

  void multipleLoginRequired(String? element) {
    _multipleLoginRequired = element ?? '';
    notifyListeners();
  }

  void numberOfLoginRequired(String? element) {
    _numberOfLoginRequired = element ?? '';
    notifyListeners();
  }

  void postPaidArrangementRequired(String? element) {
    _postpaidArrangementRequired = element;
    notifyListeners();
  }

  void address(String? element) {
    _address = element;
    notifyListeners();
  }

  void pinCode(String? element) {
    _pinCode = element;
    notifyListeners();
  }

  void city(String? element) {
    _city = element;
    notifyListeners();
  }

  void state(String? element) {
    _state = element;
    notifyListeners();
  }

  void country(String? element) {
    _country = element;
    notifyListeners();
  }

  void countryCode(String? element) {
    _countryCode = element;
    notifyListeners();
  }

  void email(String? element) {
    _email = element;
    notifyListeners();
  }

  void panNumber(String? element) {
    _panNumber = element;
    notifyListeners();
  }

  void panCard(File? element) {
    _panCard = element;
    notifyListeners();
  }

  void addressProof(File? element) {
    _addressProof = element;
    notifyListeners();
  }

  void password(String? element) {
    _password = element;
    notifyListeners();
  }

  void confirmPassword(String? element) {
    _confirmPassword = element;
    notifyListeners();
  }


  final _myRepo = SponsorAuthRepository();


  Future<void> SignUpSponsor() async {

    _phoneNumber == null
        ? _alertServices.showToast(
        message: "Select Country first then enter 10 digit phone Number")
        : null;

    _countryCode == null
        ? _alertServices.showToast(
        message:
        "Select Country Code from Phone Number Field first then enter 10 digit phone Number")
        : null;

    _addressProof == null
        ? _alertServices.showToast(message: "Upload Address Proof")
        : null;
    _panCard == null
        ? _alertServices.showToast(message: "Upload pan card")
        : null;

    try {
      isLoading(true);

      var addressProofStream = http.ByteStream(_addressProof!.openRead());
      var panCardStream = http.ByteStream(_panCard!.openRead());
      var addressProofLength = await _addressProof!.length();
      var panCardLength = await _panCard!.length();
      var headers = {
        'Content-Type': 'application/json',
      };

      var fields = {
        'firstname': _firstName ?? "Not Selected",
        'lastname': _lastName ?? "Not Selected",
        'firm_name': _firmName ?? "Not Selected",
        'firm_type': _firmType ?? "Not Selected",
        'email': _email ?? "Not Selected",
        'username': _userName ?? "Not Selected",
        'mobile': _phoneNumber ?? "Not Selected",
        'address': _address ?? "Not Selected",
        'state': _state ?? "Not Selected",
        'zip': _pinCode ?? "Not Selected",
        'country_code': _countryCode ?? "Not Selected",
        'country': _country ?? "Not Selected",
        'city': _city ?? "Not Selected",
        'business_cat': _businessCategory ?? "Not Selected",
        'business_subcat': _businessSubCategory ?? "Not Selected",
        'multi_login': _multipleLoginRequired ?? "Not Selected",
        'num_login': _numberOfLoginRequired ?? "Not Selected",
        'designation': _designation ?? "Not Selected",
        'pan': _panNumber ?? "Not Selected",
        'password': _password ?? "Not Selected",
      };

      var panMultipartFile = http.MultipartFile(
          'pan_card', panCardStream, panCardLength,
          filename: _panCard!.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'));


      var addressMultipartFile = http.MultipartFile(
          'address_proof', addressProofStream, addressProofLength,
          filename: _addressProof!.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'));

      var files = <http.MultipartFile>[panMultipartFile,addressMultipartFile];

      if(_password == _confirmPassword){
        _myRepo.sponsorRegisterApi(fields: fields, files: files, headers: headers).then((value){
          if(kDebugMode){
            print("Api Hit Successfully");
          }
          isLoading(false);
          _alertServices.showToast(message: "Sponsor Register Successfully");
        }).onError((error,stackTrace){
          if(kDebugMode){
            print(error.toString());
          }
          _alertServices.showToast(message: error.toString());

        });
      }else{
        _alertServices.showToast(message: "Password Doesn't match");
      }




    } catch (e) {
      print("Error: $e");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}

