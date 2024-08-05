import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_button.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../utils/validations.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/media_services.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/user_view_model/user_auth_viewModels/viewer_registration_viewModel.dart';

enum MaritalStatus { single, married }

//
MaritalStatus? _maritalStatus;

final maritalStatusMap = {
  MaritalStatus.single: "single",
  MaritalStatus.married: "married",
};

class ViewerRegistrationView extends StatefulWidget {
  const ViewerRegistrationView({super.key});

  @override
  State<ViewerRegistrationView> createState() => _ViewerRegistrationViewState();
}

class _ViewerRegistrationViewState extends State<ViewerRegistrationView> {
  //Going to integrate userRegistration Api:

  bool isLoading = false;

  File? selectedAddressProof;

  File? selectedPanProof;

  bool showSpinner = false;

  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordVisibility =
      ValueNotifier<bool>(false);

  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late MediaServices _mediaServices;
  late AlertServices _alertServices;

  // Define TextEditingControllers for each field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _whatsappCountryCodeController =
      TextEditingController();
  final TextEditingController _whatsAppNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _genderFocusNode = FocusNode();
  final FocusNode _maritalStatusFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _whatsappNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _pinCodeFocusNode = FocusNode();
  final FocusNode _addressProofFocusNode = FocusNode();
  final FocusNode _panCardFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  String? _firstNameError;
  String? _lastNameError;
  String? _userNameError;
  String? _genderError;
  String? _maritalStatusError;
  String? _phoneNumberError;
  String? _whatsappNumberError;
  String? _emailError;
  String? _addressError;
  String? _cityError;
  String? _countryError;
  String? _stateError;
  String? _pinCodeError;
  String? _panCardError;
  String? _passwordError;
  String? _confirmPasswordError;



  void populateDropDown(){

  }

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();
    _alertServices = _getIt.get<AlertServices>();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _genderController.dispose();
    _maritalStatusController.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
    _whatsappCountryCodeController.dispose();
    _whatsAppNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _panNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _userNameFocusNode.dispose();
    _genderFocusNode.dispose();
    _maritalStatusFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _whatsappNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    _countryFocusNode.dispose();
    _stateFocusNode.dispose();
    _pinCodeFocusNode.dispose();
    _addressProofFocusNode.dispose();
    _panCardFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
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
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.04,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                      color: MyColorScheme.authContainerColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _firstNameField(),
                      const SizedBox(height: 10),
                      _lastNameField(),
                      const SizedBox(height: 10),
                      _usernameField(),
                      const SizedBox(height: 10),
                      _genderField(),
                      const SizedBox(height: 10),
                      _maritalStatusField(),
                      const SizedBox(height: 10),
                      _phoneNumberField(),
                      const SizedBox(height: 10),
                      _whatsAppNumberField(),
                      _emailField(),
                      const SizedBox(height: 10),
                      _addressField(),
                      const SizedBox(height: 10),
                      _cityField(),
                      const SizedBox(height: 10),
                      _pinCodeField(),
                      const SizedBox(height: 10),
                      _stateField(),
                      const SizedBox(height: 10),
                      _countryField(),
                      const SizedBox(height: 10),
                      _panNumberField(),
                      const SizedBox(height: 10),
                      _panAndAddressProofField(),
                      const SizedBox(height: 10),
                      _passwordField(),
                      const SizedBox(height: 10),
                      _confirmPasswordField(),
                      const SizedBox(height: 30),
                      _submitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //*-----First Name Field------*
  Widget _firstNameField() {
    return CustomFormField(
      controller: _firstNameController,
      currentFocusNode: _firstNameFocusNode,
      nextFocusNode: _lastNameFocusNode,
      hintText: "First name",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _firstNameError,
      onChanged: (value) {
        if (_firstNameFocusNode.hasFocus) {
          setState(() {
            _firstNameError = ErrorText.getNameError(name: value!);
          });
        }
      },
    );
  }

  //*-----Last Name Field------*
  Widget _lastNameField() {
    return CustomFormField(
      controller: _lastNameController,
      currentFocusNode: _lastNameFocusNode,
      nextFocusNode: _userNameFocusNode,
      hintText: "Last name",
      textInputType: TextInputType.text,
      obscureText: false,
      errorText: _lastNameError,
      onChanged: (value) {
        if (_lastNameFocusNode.hasFocus) {
          setState(() {
            _lastNameError = ErrorText.getNameError(name: value!);
          });
        }
      },
    );
  }

  //*-----UserName Field------*
  Widget _usernameField() {
    return CustomFormField(
      controller: _usernameController,
      currentFocusNode: _userNameFocusNode,
      nextFocusNode: _genderFocusNode,
      hintText: "Username",
      textInputType: TextInputType.text,
      obscureText: false,
      errorText: _userNameError,
      onChanged: (value) {
        if (_userNameFocusNode.hasFocus) {
          setState(() {
            _userNameError = ErrorText.getUsernameError(username: value!);
          });
        }
      },
    );
  }

  //*-----Gender Field------*
  Widget _genderField() {
    return SingleDropdown(
      focusNode: _genderFocusNode,
      dropdownListData: const [
        'Male','Female'
      ],
      hintText: "Gender",
      onChanged: (value) {
        _genderController.text = value.toString();
        FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
      },
    );
  }

  //*------Marital Status Field------*
  Widget _maritalStatusField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 0.5)),
      child: Row(
        children: [
          Expanded(
              child: RadioListTile<MaritalStatus>(
            title: Text(
              "Single",
              style: TextStyle(color: Colors.white.withOpacity(0.65)),
            ),
            value: MaritalStatus.single,
            groupValue: _maritalStatus,
            dense: true,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _maritalStatus = value;
                // _marriageStatus = maritalStatusMap[value];
                _maritalStatusController.text = _maritalStatus!.name;
              });
            },
          )),
          Expanded(
              child: RadioListTile<MaritalStatus>(
            title: Text(
              "Married",
              style: TextStyle(color: Colors.white.withOpacity(0.65)),
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
                _maritalStatusController.text = _maritalStatus!.name;
              });
            },
          )),
        ],
      ),
    );
  }

  //*-----Phone Number Field------*
  Widget _phoneNumberField() {
    return CustomPhoneFormInputField(
      focusNode: _phoneNumberFocusNode,
      nextFocusNode: _whatsappNumberFocusNode,
      hintText: "Phone Number",
      onChanged: (value) {
        if (_phoneNumberFocusNode.hasFocus) {
          _phoneNumberController.text = value!.number;
          _countryCodeController.text = value.countryCode.substring(1);

          _phoneNumberError =
              ErrorText.getPhoneNumberError(phoneNumber: value.number);
        }
      },
    );
  }

  //*-----Whatsapp Number Field------*
  Widget _whatsAppNumberField() {
    return CustomPhoneFormInputField(
      focusNode: _whatsappNumberFocusNode,
      nextFocusNode: _emailFocusNode,
      hintText: "Whatsapp Number",
      onChanged: (value) {
        if (_whatsappNumberFocusNode.hasFocus) {
          _whatsAppNumberController.text = value!.number;
          _whatsappCountryCodeController.text = value.countryCode.substring(1);
          _whatsappNumberError =
              ErrorText.getPhoneNumberError(phoneNumber: value.number);
        }
      },
    );
  }

  //*-----Email Field------*
  Widget _emailField() {
    return CustomFormField(
      controller: _emailController,
      currentFocusNode: _emailFocusNode,
      nextFocusNode: _addressFocusNode,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      obscureText: false,
      errorText: _emailError,
      onChanged: (value) {
        if (_emailFocusNode.hasFocus) {
          setState(() {
            _emailError = ErrorText.getEmailError(email: value!);
          });
        }
      },
    );
  }

  //*-----Address Field------*
  Widget _addressField() {
    return CustomFormField(
      controller: _addressController,
      currentFocusNode: _addressFocusNode,
      nextFocusNode: _cityFocusNode,
      hintText: "Address",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _addressError,
      onChanged: (value) {
        if (_addressFocusNode.hasFocus) {
          setState(() {
            _addressError = ErrorText.getAddressError(address: value!);
          });
        }
      },
    );
  }

  //*-----City Field------*
  Widget _cityField() {
    return CustomFormField(
      controller: _cityController,
      currentFocusNode: _cityFocusNode,
      nextFocusNode: _pinCodeFocusNode,
      hintText: "City",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _cityError,
      onChanged: (value) {
        if (_cityFocusNode.hasFocus) {
          setState(() {
            _cityError = ErrorText.getCityError(city: value!);
          });
        }
      },
    );
  }

  //*-----Pin Code Field------*
  Widget _pinCodeField() {
    return CustomFormField(
      controller: _pinCodeController,
      currentFocusNode: _pinCodeFocusNode,
      nextFocusNode: _stateFocusNode,
      hintText: "Pin Code",
      obscureText: false,
      textInputType: TextInputType.number,
      errorText: _pinCodeError,
      onChanged: (value) {
        if (_pinCodeFocusNode.hasFocus) {
          setState(() {
            _pinCodeError = ErrorText.getPinCodeError(pinCode: value!);
          });
        }
      },
    );
  }

  //*-----State Field------*
  Widget _stateField() {
    return CustomFormField(
      controller: _stateController,
      currentFocusNode: _stateFocusNode,
      nextFocusNode: _countryFocusNode,
      hintText: "State",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _stateError,
      onChanged: (value) {
        if (_stateFocusNode.hasFocus) {
          setState(() {
            _stateError = ErrorText.getStateError(state: value!);
          });
        }
      },
    );
  }

  //*-----Country Field------*
  Widget _countryField() {
    return CustomFormField(
      controller: _countryController,
      currentFocusNode: _countryFocusNode,
      nextFocusNode: _panCardFocusNode,
      hintText: "Country",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _countryError,
      onChanged: (value) {
        if (_countryFocusNode.hasFocus) {
          setState(() {
            _countryError = ErrorText.getCountryError(country: value!);
          });
        }
      },
    );
  }

  //*-----Pan Card Number Field------*
  Widget _panNumberField() {
    return CustomFormField(
      controller: _panNumberController,
      currentFocusNode: _panCardFocusNode,
      nextFocusNode: _passwordFocusNode,
      hintText: "Pan Card Number",
      obscureText: false,
      textInputType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      errorText: _panCardError,
      onChanged: (value) {
        if (_panCardFocusNode.hasFocus) {
          setState(() {
            _panCardError = ErrorText.getPanCardError(panCard: value!);
          });
        }
      },
    );
  }

  //*----Pan and Address Field-----*
  Widget _panAndAddressProofField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: Border.all(color: MyColorScheme.lightGrey3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildFileSelector(
                  file: selectedAddressProof,
                  onTap: () async {
                    File? file = await _mediaServices.getSingleFileFromPicker(
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf']);
                    if (file != null) {
                      setState(() {
                        selectedAddressProof = file;
                      });
                    }
                  },
                  fileType: 'address_proof',
                ),
                Text(
                  "Address Proof",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.65), fontSize: 15),
                ),
                Text(
                  textAlign: TextAlign.center,
                  selectedAddressProof != null
                      ? selectedAddressProof!.path.split('/').last
                      : "'jpg', 'jpeg', 'png', 'pdf' allowed",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 10,
                  ),
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
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: Border.all(color: MyColorScheme.lightGrey3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildFileSelector(
                  file: selectedPanProof,
                  onTap: () async {
                    File? file = await _mediaServices.getSingleFileFromPicker(
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf']);
                    if (file != null) {
                      setState(() {
                        selectedPanProof = file;
                      });
                    }
                  },
                  fileType: 'pan_card',
                ),
                Text(
                  "Pan Card",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.65), fontSize: 15),
                ),
                Text(
                  textAlign: TextAlign.center,
                  selectedAddressProof != null
                      ? selectedAddressProof!.path.split('/').last
                      : "'jpg', 'jpeg', 'png', 'pdf' allowed",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //*-----Password Field------*
  Widget _passwordField() {
    return ValueListenableBuilder(
      valueListenable: _passwordVisibility,
      builder: (context, value, Widget? child) {
        return CustomFormField(
          controller: _passwordController,
          currentFocusNode: _passwordFocusNode,
          nextFocusNode: _confirmPasswordFocusNode,
          errorText: _passwordError,
          hintText: "Password",
          textCapitalization: TextCapitalization.none,
          onChanged: (value) {
            if (_passwordFocusNode.hasFocus) {
              setState(() {
                _passwordError = ErrorText.getPasswordError(password: value!);
              });
            }
          },
          obscureText: _passwordVisibility.value,
          maxLines: 1,
          icon: GestureDetector(
            onTap: () {
              _passwordVisibility.value = !_passwordVisibility.value;
            },
            child: _passwordVisibility.value
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
          ),
        );
      },
    );
  }

  //*-----Confirm Password Field------*
  Widget _confirmPasswordField() {
    return ValueListenableBuilder(
      valueListenable: _confirmPasswordVisibility,
      builder: (context, value, Widget? child) {
        return CustomFormField(
          controller: _confirmPasswordController,
          currentFocusNode: _confirmPasswordFocusNode,
          errorText: _confirmPasswordError,
          hintText: "Confirm Password",
          textCapitalization: TextCapitalization.none,
          obscureText: _confirmPasswordVisibility.value,
          maxLines: 1,
          onChanged: (value) {
            if (_confirmPasswordFocusNode.hasFocus) {
              setState(() {
                _confirmPasswordError =
                    ErrorText.getConfirmPasswordError(password: value!);
              });
            }
          },
          icon: GestureDetector(
            onTap: () {
              _confirmPasswordVisibility.value =
                  !_confirmPasswordVisibility.value;
            },
            child: _confirmPasswordVisibility.value
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
          ),
        );
      },
    );
  }

  //*-----Submit Button-----*
  Widget _submitButton() {
    return ChangeNotifierProvider(
        create: (context) => ViewerRegistrationViewmodel(),
        child: Consumer<ViewerRegistrationViewmodel>(
            builder: (context, provider, _) {
          return CustomButton(
              buttonName: "Submit",
              isLoading: false,
              isGradient: true,
              onTap: () {

                final result = _validateForm(signup: provider, context: context);

              });
        }));
  }

  Widget _buildFileSelector(
      {File? file, required VoidCallback onTap, required String fileType}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundImage:
            file != null && _isImageFile(file.path) ? FileImage(file) : null,
        backgroundColor: Colors.grey[200],
        child: file != null && !_isImageFile(file.path)
            ? const Icon(Icons.insert_drive_file, color: Colors.black)
            : null,
      ),
    );
  }

  bool _isImageFile(String path) {
    final String extension = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png'].contains(extension);
  }

  // Form extra validations
  bool _validateForm(
      {required ViewerRegistrationViewmodel signup,
      required BuildContext context}) {
    if (_firstNameController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your first name.", context);
      return false;
    } else {
      signup.firstname = _firstNameController.text.trim();
    }

    if (_lastNameController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your last name.", context);
      return false;
    } else {
      signup.lastname = _lastNameController.text.trim();
    }

    if (_usernameController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your username.", context);
      return false;
    } else {
      signup.username = _usernameController.text.trim();
    }

    if (_phoneNumberController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your phone number.", context);
      return false;
    } else {
      signup.mobile = _phoneNumberController.text.trim();
    }

    if (_whatsappCountryCodeController.text.isEmpty ||
        _whatsAppNumberController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your WhatsApp number and country code.", context);
      return false;
    } else {
      signup.whatsapp = _whatsAppNumberController.text.trim();
      signup.country_code_wp = _whatsappCountryCodeController.text.trim();
    }

    if (_addressController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your address.", context);
      return false;
    } else {
      signup.address = _addressController.text.trim();
    }

    if (_genderController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please select your gender.", context);
      return false;
    } else {
      signup.gender = _genderController.text.trim();
    }

    if (_maritalStatusController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your marital status.", context);
      return false;
    } else {
      signup.marital = _maritalStatusController.text.trim();
    }

    if (_stateController.text.isEmpty) {
      _alertServices.flushBarErrorMessages("Please enter your state.", context);
      return false;
    } else {
      signup.state = _stateController.text.trim();
    }

    if (_cityController.text.isEmpty) {
      _alertServices.flushBarErrorMessages("Please enter your city.", context);
      return false;
    } else {
      signup.city = _cityController.text.trim();
    }

    if (_pinCodeController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your pin code.", context);
      return false;
    } else {
      signup.pincode = _pinCodeController.text.trim();
    }

    if (_countryController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your country.", context);
      return false;
    } else {
      signup.country = _countryController.text.trim();
    }

    if (_panNumberController.text.isEmpty) {
      _alertServices.flushBarErrorMessages(
          "Please enter your PAN number.", context);
      return false;
    } else {
      signup.pan = _panNumberController.text.trim();
    }

    if (selectedAddressProof == null) {
      _alertServices.flushBarErrorMessages(
          "Please attach your Address image.", context);
      return false;
    } else {
      signup.addressProof = selectedAddressProof;
    }

    if (selectedPanProof == null) {
      _alertServices.flushBarErrorMessages(
          "Please attach your pan image.", context);
      return false;
    } else {
      signup.panCardProof = selectedPanProof;
    }

    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      _alertServices.flushBarErrorMessages(
          "Please enter a valid email address.", context);
      return false;
    } else {
      signup.email = _emailController.text.trim().toLowerCase();
    }

    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 8) {
      _alertServices.flushBarErrorMessages(
          "Password must be at least 8 characters long.", context);
      return false;
    } else {
      signup.password = _passwordController.text.trim();
    }

    if (_confirmPasswordController.text.isEmpty ||
        _confirmPasswordController.text != _passwordController.text) {
      _alertServices.flushBarErrorMessages("Passwords do not match.", context);
      return false;
    } else {
      signup.password_confirmation = _confirmPasswordController.text.trim();
    }

    return true;
  }
}
