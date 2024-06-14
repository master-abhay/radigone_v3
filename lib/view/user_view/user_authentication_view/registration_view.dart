import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/constants.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/media_services.dart';
import '../../../view_model/services/navigation_services.dart';

enum MaritalStatus { single, married }

//
MaritalStatus? _maritalStatus;

final maritalStatusMap = {
  MaritalStatus.single: "single",
  MaritalStatus.married: "married",
};

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //Going to integrate userRegistration Api:

  bool isLoading = false;

  File? selectedAddressProof;

  File? selectedPanProof;

  bool showSpinner = false;

  // This is created beacuse we have to move to the screens according to the app user.
  String widgetScenerio = "registration";

  bool _passwordVisibiltyObscure = true;
  bool _confirmPasswordVisibilityObscure = true;

  final ValueNotifier<bool> _passwordVisibilty = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordVisibility = ValueNotifier<bool>(false);

  String? _firstName,
      _lastName,
      _userName,
      _gender,
      _marriageStatus,
      _phoneNumber,
      _whatsappNumber,
      _email,
      _address,
      _country,
      _countryCode,
      _state,
      _pinCode,
      _password,
      _confirmPassword;

  late GlobalKey<FormState> _signUpFormKey;
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late MediaServices _mediaServices;
  late AlertServices _alertServices;

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();
    _alertServices = _getIt.get<AlertServices>();

    _signUpFormKey = GlobalKey<FormState>();
    print("SignUpForm global key created");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.6,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  child: Image.asset(
                    "images/splash_logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "REGISTRATION",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: Column(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
                      child: Center(
                        child: Material(
                          color:
                              MyColorScheme.authContainerColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            // height: 500,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.04,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24)),
                            child: Form(
                              key: _signUpFormKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 295,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 150,
                                            child: CustomFormField(
                                                hintText: "First name",
                                                onSaved: (value) {
                                                  setState(() {
                                                    _firstName = value;
                                                  });
                                                },
                                                obscureText: false,
                                                isNumber: false),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 150,
                                            child: CustomFormField(
                                                hintText: "Last name",
                                                onSaved: (value) {
                                                  setState(() {
                                                    _lastName = value;
                                                  });
                                                },
                                                obscureText: false,
                                                isNumber: false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: CustomFormField(
                                        hintText: "Username",
                                        textCapitalization: false,
                                        onSaved: (value) {
                                          setState(() {
                                            _userName = value;
                                          });
                                        },
                                        obscureText: false,
                                        isNumber: false),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 295,
                                      child: CustomDropdown(
                                        dropdownListData: const [
                                          {'title': 'Male', 'value': 'Male'},
                                          {
                                            'title': 'Female',
                                            'value': 'Female'
                                          },
                                          {
                                            'title': 'Transgender',
                                            'value': 'Transgender'
                                          },
                                        ],
                                        hint: "Gender",
                                        onSaved: (value) {
                                          _gender = value as String;
                                        },
                                        onChanged: (value) {
                                          _gender = value as String;
                                        },
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    width: 295,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: RadioListTile<MaritalStatus>(
                                          title: Text(
                                            "Single",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.65)),
                                          ),
                                          value: MaritalStatus.single,
                                          groupValue: _maritalStatus,
                                          dense: true,
                                          activeColor: Colors.white,
                                          onChanged: (value) {
                                            setState(() {
                                              _maritalStatus = value;
                                              // _marriageStatus = maritalStatusMap[value];
                                              _marriageStatus =
                                                  _maritalStatus?.name;
                                            });
                                          },
                                        )),
                                        Expanded(
                                            child: RadioListTile<MaritalStatus>(
                                          title: Text(
                                            "Married",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.65)),
                                          ),
                                          value: MaritalStatus.married,
                                          groupValue: _maritalStatus,
                                          dense: true,
                                          activeColor: Colors.white,

                                          // tileColor: Colors.grey,
                                          onChanged: (value) {
                                            setState(() {
                                              _maritalStatus = value;
                                              // _marriageStatus = maritalStatusMap[value];
                                              _marriageStatus =
                                                  _maritalStatus?.name;
                                            });
                                          },
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 295,
                                      child: CustomPhoneFormInputField(
                                        hintText: "Phone Number",
                                        onSaved: (value) {
                                          setState(() {
                                            _phoneNumber = value!.number;
                                            _countryCode = value.countryCode;
                                          });
                                        },
                                        onChanged: (value) {
                                          _phoneNumber = value!.number;
                                          _countryCode = value.countryCode;
                                        },
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 295,
                                      child: CustomPhoneFormInputField(
                                        hintText: "Whatsapp Number",
                                        onSaved: (value) {
                                          setState(() {
                                            _whatsappNumber = value!.number;

                                            print(_whatsappNumber);
                                          });
                                        },
                                        onChanged: (value) {
                                          _whatsappNumber = value!.number;
                                          print(_whatsappNumber);
                                        },
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: CustomFormField(
                                        hintText: "Email",
                                        onSaved: (value) {
                                          setState(() {
                                            _email = value;
                                          });
                                        },
                                        obscureText: false,
                                        isNumber: false),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: CustomFormField(
                                        hintText: "Address",
                                        onSaved: (value) {
                                          setState(() {
                                            _address = value;
                                          });
                                        },
                                        obscureText: false,
                                        isNumber: false),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 150,
                                            child: CustomFormField(
                                                hintText: "Country",
                                                onSaved: (value) {
                                                  setState(() {
                                                    _country = value;
                                                  });
                                                },
                                                obscureText: false,
                                                isNumber: false),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 150,
                                            child: CustomFormField(
                                                hintText: "State",
                                                onSaved: (value) {
                                                  setState(() {
                                                    _state = value;
                                                  });
                                                },
                                                obscureText: false,
                                                isNumber: false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: CustomFormField(
                                        hintText: "Pin Code",
                                        onSaved: (value) {
                                          setState(() {
                                            _pinCode = value;
                                          });
                                        },
                                        obscureText: false,
                                        isNumber: true),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              border: Border.all(
                                                  color:
                                                      MyColorScheme.lightGrey3),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                addressProofSelector(),
                                                Text(
                                                  "Address Proof",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.65),
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 150,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                border: Border.all(
                                                    color: MyColorScheme
                                                        .lightGrey3),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                children: [
                                                  panProofSelector(),
                                                  Text(
                                                    "Pan Card",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.65),
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: ValueListenableBuilder(
                                      valueListenable: _passwordVisibilty,
                                      builder: (context, value, Widget? child) {
                                        return CustomFormField(
                                          hintText: "Create 6 digit password",
                                          textCapitalization: false,
                                          onSaved: (value) {
                                            setState(() {
                                              _password = value;
                                            });
                                          },
                                          obscureText:
                                              _passwordVisibiltyObscure,
                                          isNumber: false,
                                          maxLines: 1,
                                          icon: GestureDetector(
                                            onTap: () {
                                              _passwordVisibilty.value =
                                                  !_passwordVisibilty.value;
                                              _passwordVisibiltyObscure =
                                                  !_passwordVisibiltyObscure;
                                            },
                                            child: _passwordVisibilty.value
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 295,
                                    child: ValueListenableBuilder(
                                      valueListenable:
                                          _confirmPasswordVisibility,
                                      builder: (context, value, Widget? child) {
                                        return CustomFormField(
                                          hintText: "Confirm password",
                                          textCapitalization: false,
                                          onSaved: (value) {
                                            setState(() {
                                              _confirmPassword = value;
                                            });
                                          },
                                          obscureText:
                                              _confirmPasswordVisibilityObscure,
                                          isNumber: false,
                                          maxLines: 1,
                                          icon: GestureDetector(
                                            onTap: () {
                                              _confirmPasswordVisibility.value =
                                                  !_confirmPasswordVisibility
                                                      .value;
                                              _confirmPasswordVisibilityObscure =
                                                  !_confirmPasswordVisibilityObscure;
                                            },
                                            child:
                                                _confirmPasswordVisibility.value
                                                    ? const Icon(
                                                        Icons.visibility,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Icons.visibility_off,
                                                        color: Colors.white,
                                                      ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: CustomButton(
                                        buttonName: "Sign Up",
                                        isLoading: isLoading,
                                        isGradient: true,
                                        onTap: () async {
                                          if(kDebugMode){
                                            print(
                                                "-------printing the value of the gender just for testing Purpose $_gender");
                                            print(
                                                "-------printing the value of the marriageStatus just for testing Purpose $_marriageStatus");
                                            print(
                                                "-------printing the value of the _phoneNumber just for testing Purpose $_phoneNumber");
                                            print(
                                                "-------printing the value of the whatsappNumber just for testing Purpose $_whatsappNumber");

                                          }


                                          if(_gender == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message: "Select Gender");
                                            return;
                                          }


                                          if(_marriageStatus == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message:
                                                "Select Marital Status");
                                            return;
                                          }
                                          if(_phoneNumber == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message:
                                                "Select Country first then enter 10 digit phone Number");
                                            return;
                                          }if(_whatsappNumber == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message:
                                                "Select Whatsapp Number Country first then enter 10 digit whatsApp Number");
                                            return;
                                          }if(selectedAddressProof == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message:
                                                "Upload Address Proof");
                                            return;
                                          }if(selectedPanProof == null){
                                            setState(() {

                                            });
                                            _alertServices.showToast(
                                                message: "Upload pan card");
                                            return;
                                          }








                                          if (_signUpFormKey.currentState!
                                                  .validate() &&
                                              _gender != null &&
                                              _marriageStatus != null &&
                                              _phoneNumber != null &&
                                              _whatsappNumber != null) {
                                            try {
                                              try {
                                                _signUpFormKey.currentState!
                                                    .save();

                                                setState(() {
                                                  isLoading = true;
                                                });

                                                var addressProofStream =
                                                    http.ByteStream(
                                                        selectedAddressProof!
                                                            .openRead());
                                                var panProofStream =
                                                    http.ByteStream(
                                                        selectedPanProof!
                                                            .openRead());

                                                var addressProofLength =
                                                    await selectedAddressProof!
                                                        .length();
                                                var panProofLength =
                                                    await selectedPanProof!
                                                        .length();

                                                var uri = Uri.parse(
                                                    "https://radigone.com/api/v1/user/register");
                                                var request =
                                                    http.MultipartRequest(
                                                        'POST', uri);

                                                request.fields['email'] =
                                                    _email!;
                                                request.fields['mobile'] =
                                                    _phoneNumber!;
                                                request.fields['whatsaap'] =
                                                    _whatsappNumber!;
                                                request.fields['marital'] =
                                                    _marriageStatus!;
                                                request.fields['gander'] =
                                                    _gender!;
                                                request.fields['state'] =
                                                    _state!;
                                                request.fields['pincode'] =
                                                    _pinCode!;
                                                request.fields['address'] =
                                                    _address!;
                                                request.fields['password'] =
                                                    _password!;
                                                request.fields['username'] =
                                                    _userName!;
                                                request.fields['country_code'] =
                                                    _countryCode!;
                                                request.fields['firstname'] =
                                                    _firstName!;
                                                request.fields['lastname'] =
                                                    _lastName!;
                                                request.fields['country'] =
                                                    _country!;

                                    if(kDebugMode){
                                      print(
                                          "Pan Proof Path: ${selectedPanProof!.path}");
                                      print(
                                          "Address Proof Path: ${selectedAddressProof!.path}");
                                    }

                                                var panMultiPartFile =
                                                    http.MultipartFile(
                                                  'pan_card', panProofStream,
                                                  panProofLength,
                                                  filename: selectedPanProof!
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  contentType: MediaType(
                                                      'application',
                                                      'octet-stream'), // Adjust content type as needed
                                                );

                                                var addressProofMultipartFile =
                                                    http.MultipartFile(
                                                  'address_proof',
                                                  addressProofStream,
                                                  addressProofLength,
                                                  filename:
                                                      selectedAddressProof!.path
                                                          .split('/')
                                                          .last,
                                                  contentType: MediaType(
                                                      'application',
                                                      'octet-stream'), // Adjust content type as needed
                                                );

                                                request.files
                                                    .add(panMultiPartFile);
                                                request.files.add(
                                                    addressProofMultipartFile);

                                                var response;

                                                if (_password ==
                                                    _confirmPassword) {
                                                  var response0 =
                                                      await request.send();
                                                  response = response0;
                                                } else {
                                                  _alertServices.showToast(
                                                      message:
                                                          "Password Doesn't match");
                                                }

                                                if (response.statusCode ==
                                                    200) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  if(kDebugMode){
                                                    print(
                                                        "User Registered Successfully");
                                                  }

                                                  _alertServices.showToast(
                                                      message:
                                                          "User Registered Successfully. Login to Continue");
                                                  //Going to Otp-verification page:
                                                  _navigationServices.goBack();
                                                  // _navigationServices.push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             OtpVerification(
                                                  //               widgetScnerio:
                                                  //               widgetScenerio,
                                                  //             )));
                                                } else {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  var responseBody =
                                                      await response.stream
                                                          .bytesToString();
                                                  var decodedResponse =
                                                      jsonDecode(responseBody);
                                                  print(
                                                      "User not registered ${response.statusCode}");
                                                  print(
                                                      "Response Body: $decodedResponse");

                                                  if (decodedResponse[
                                                          'errors'] !=
                                                      null) {
                                                    print(
                                                        'Errors: ${decodedResponse['errors']}');
                                                    _alertServices.showToast(
                                                        message:
                                                            decodedResponse['errors'].toString());
                                                  }
                                                }
                                              } catch (e) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                print("Error: $e");
                                              } finally {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              }
                                            } catch (e) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              print(
                                                  "Error While saving the Fields $e");
                                            }
                                          } else {
                                            isLoading = false;
                                            print("May be some value is null");
                                          }
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      "Have a referral code?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget addressProofSelector() {
    return GestureDetector(
      onTap: () async {
        File? file = await _mediaServices.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectedAddressProof = file;
          });
        }
      },
      child: CircleAvatar(
        radius: 30,
        backgroundImage: selectedAddressProof != null
            ? FileImage(selectedAddressProof!)
            : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
      ),
    );
  }

  Widget panProofSelector() {
    return GestureDetector(
      onTap: () async {
        File? file = await _mediaServices.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectedPanProof = file;
          });
        }
      },
      child: CircleAvatar(
        radius: 30,
        backgroundImage: selectedPanProof != null
            ? FileImage(selectedPanProof!)
            : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
      ),
    );
  }
}
