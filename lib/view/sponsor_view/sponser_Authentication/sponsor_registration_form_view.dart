import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/utils/utils.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_dependent_dropdown.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../utils/constants.dart';
import '../../../utils/validations.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/media_services.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/sponsor_view_model/sponsor_register_viewModel.dart';

class SponsorRegistrationFormView extends StatefulWidget {
  final bool isCompany;
  final String registrationFees;
  final UserType userType;

  const SponsorRegistrationFormView(
      {super.key,
      required this.userType,
      required this.isCompany,
      required this.registrationFees});

  @override
  State<SponsorRegistrationFormView> createState() =>
      _SponsorRegistrationFormViewState();
}

class _SponsorRegistrationFormViewState
    extends State<SponsorRegistrationFormView> with MediaQueryMixin {
  //Going to integrate userRegistration Api:

  bool isLoading = false;

  File? selectedAddressProof;

  File? selectedPanProof;

  bool showSpinner = false;

  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordVisibility =
      ValueNotifier<bool>(false);

  late GlobalKey<FormState> _signUpFormKey;
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late MediaServices _mediaServices;
  late AlertServices _alertServices;

  // Define TextEditingControllers
  final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _firmTypeController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _selectedTitleController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _businessCategoryController =
      TextEditingController();
  final TextEditingController _businessSubCategoryController =
      TextEditingController();
  final TextEditingController _registrationFeesController =
      TextEditingController();
  final TextEditingController _multipleLoginRequiredController =
      TextEditingController();
  final TextEditingController _numberOfLoginRequiredController =
      TextEditingController();
  final TextEditingController _postPaidArrangementController =
      TextEditingController();
  final TextEditingController _profileServicesController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressProofController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _noOfLoginsController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();

  // Define FocusNodes
  final FocusNode _firmNameFocusNode = FocusNode();
  final FocusNode _firmTypeFocusNode = FocusNode();
  final FocusNode _gstNumberFocusNode = FocusNode();
  final FocusNode _designationFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _businessCategoryFocusNode = FocusNode();
  final FocusNode _businessSubCategoryFocusNode = FocusNode();
  final FocusNode _registrationFeesFocusNode = FocusNode();
  final FocusNode _multipleLoginRequiredFocusNode = FocusNode();
  final FocusNode _numberOfLoginRequiredFocusNode = FocusNode();
  final FocusNode _postPaidArrangementRequiredFocusNode = FocusNode();

  final FocusNode _profileServicesFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _pinCodeFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _addressProofFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _noOfLoginsFocusNode = FocusNode();
  final FocusNode _panNumberFocusNode = FocusNode();

  // Error variables
  String? _firmNameError;
  String? _firmTypeError;
  String? _companyError;
  String? _gstNumberError;
  String? _designationError;
  String? _firstNameError;
  String? _lastNameError;
  String? _usernameError;
  String? _phoneNumberError;
  String? _businessCategoryError;
  String? _businessSubCategoryError;
  String? _registrationFeesError;
  String? _profileServicesError;
  String? _addressError;
  String? _cityError;
  String? _stateError;
  String? _pinCodeError;
  String? _countryError;
  String? _emailError;
  String? _addressProofError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _noOfLoginsError;
  String? _panNumberError;

  @override
  void dispose() {
    // Dispose all controllers and focus nodes
    _firmNameController.dispose();
    _firmTypeController.dispose();
    _gstNumberController.dispose();
    _designationController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _businessCategoryController.dispose();
    _businessSubCategoryController.dispose();
    _registrationFeesController.dispose();
    _profileServicesController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _addressProofController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _noOfLoginsController.dispose();
    _panNumberController.dispose();

    _firmNameFocusNode.dispose();
    _firmTypeFocusNode.dispose();
    _gstNumberFocusNode.dispose();
    _designationFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _businessCategoryFocusNode.dispose();
    _businessSubCategoryFocusNode.dispose();
    _registrationFeesFocusNode.dispose();
    _profileServicesFocusNode.dispose();
    _addressFocusNode.dispose();
    _cityFocusNode.dispose();
    _stateFocusNode.dispose();
    _pinCodeFocusNode.dispose();
    _countryFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressProofFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _noOfLoginsFocusNode.dispose();
    _panNumberFocusNode.dispose();

    super.dispose();
  }

  final Map<String, List<String>> _categories = {
    'Test11': ['test1', 'test2', 'test3'],
    'Online Services': ['123'],
    'OTT Platform': ['Netflix', 'HotStar', 'Prime Video', 'Other'],
    'Sports': [
      'Cricket',
      'Football',
      'Tennis',
      'BasketBall',
      'Hockey',
      'other'
    ],
    'Mobile and Laptops': ['456'],
    'Loans': ['Home Loan', 'Vehicle Loan', 'other'],
    'Tour and Travels': ['Tour', 'Travels'],
    'Gold and Jewellery': ['abc'],
    'Clothing': ['Men', 'Women', 'Kids'],
    'Accessories': ['Access', 'To'],
    'Real Estate': ['Commercial', 'Residential', 'Rent', 'other'],
    'Health': ['Wealth'],
    'others': ['abc'],
  };

  // Define the map for Multiple Login Required options
  final Map<String, List<String>> _multipleLoginOptions = {
    'No': [],
    'Yes': ['2', '3', '4'],
  };

  final List<String> titleOptions = const ['Mr', 'Ms', 'Mrs', 'Dr'];

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();
    _alertServices = _getIt.get<AlertServices>();

    _signUpFormKey = GlobalKey<FormState>();

    _selectedTitleController.text = titleOptions[0];
    _registrationFeesController.text = widget.registrationFees;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return Consumer<RegisterSponsorProvider>(
      builder: (context, providerValue, Widget? child) {
        return mainForm();
      },
    );
  }

  Widget mainForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: screenHeight / 8),
      child: Padding(
        padding: EdgeInsets.all(kPadding),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.04, horizontal: screenWidth * 0.05),
          decoration: BoxDecoration(
              color: MyColorScheme.authContainerColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(visible: widget.isCompany, child: _firmNameField()),
              Visibility(
                visible: widget.isCompany,
                child: kFormFieldHeight,
              ),
              Visibility(visible: widget.isCompany, child: _firmTypeField()),
              Visibility(
                visible: widget.isCompany,
                child: kFormFieldHeight,
              ),
              Visibility(visible: widget.isCompany, child: _gstNumberField()),
              Visibility(
                visible: widget.isCompany,
                child: kFormFieldHeight,
              ),
              Visibility(visible: widget.isCompany, child: _designationField()),
              Visibility(
                visible: widget.isCompany,
                child: kFormFieldHeight,
              ),
              _firstNameField(),
              kFormFieldHeight,
              _lastNameField(),
              kFormFieldHeight,
              _usernameField(),
              kFormFieldHeight,
              _phoneNumberField(),
              kFormFieldHeight,
              _businessCategoryField(),
              kFormFieldHeight,
              _registrationFeesField(),
              kFormFieldHeight,
              _multipleLoginRequiredField(),
              kFormFieldHeight,
              _postPaidArrangementField(),
              kFormFieldHeight,
              _emailField(),
              kFormFieldHeight,
              _addressField(),
              kFormFieldHeight,
              _cityField(),
              kFormFieldHeight,
              _stateField(),
              kFormFieldHeight,
              _pinCodeField(),
              kFormFieldHeight,
              _countryField(),
              kFormFieldHeight,
              Visibility(
                  visible: !widget.isCompany, child: _panCardNumberField()),
              Visibility(
                visible: !widget.isCompany,
                child: kFormFieldHeight,
              ),
              _panAndAddressProofField(),
              kFormFieldHeight,
              _passwordField(),
              kFormFieldHeight,
              _confirmPasswordField(),
              const SizedBox(height: 30),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  //*-----Firm Name Field------*
  Widget _firmNameField() {
    return CustomFormField(
      controller: _firmNameController,
      currentFocusNode: _firmNameFocusNode,
      nextFocusNode: _firmTypeFocusNode,
      hintText: "Firm Name",
      obscureText: false,
      textInputType: TextInputType.text,
      errorText: _firmNameError,
      onChanged: (value) {
        if (_firmNameFocusNode.hasFocus) {
          setState(() {
            _firmNameError = ErrorText.getNameError(name: value!);
          });
        }
      },
    );
  }

  Widget _firmTypeField() {
    return SingleDropdown(
      focusNode: _firmTypeFocusNode,
      onChanged: (value) {
        _firmTypeController.text = value.toString();
        FocusScope.of(context).requestFocus(_gstNumberFocusNode);
      },
      dropdownListData: const [
        'Company',
        'Private Limited',
        'Partnership',
        'Proprietorship',
        'LLP',
        'OPC'
      ],
      hintText: "Select Firm Type",
      labelText: "Firm Type",
    );
  }

//*-----Gst Number Field------*

  Widget _gstNumberField() {
    return CustomFormField(
      controller: _gstNumberController,
      currentFocusNode: _gstNumberFocusNode,
      nextFocusNode: _designationFocusNode,
      hintText: "Gst Number",
      obscureText: false,
      textInputType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      errorText: _gstNumberError,
      onChanged: (value) {
        if (_gstNumberFocusNode.hasFocus) {
          setState(() {
            _gstNumberError = ErrorText.getGstNumberError(gstNumber: value!);
          });
        }
      },
    );
  }

  Widget _designationField() {
    return SingleDropdown(
      focusNode: _designationFocusNode,
      onChanged: (value) {
        _designationController.text = value.toString();
        FocusScope.of(context).requestFocus(_firstNameFocusNode);
      },
      dropdownListData: const [
        'Proprietor',
        'Director',
        'Authorized Person',
      ],
      hintText: "Select Designation",
      labelText: "Designation",
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
      titleOptions: titleOptions,
      selectedTitleValue: _selectedTitleController.text,
      onTitleChanged: (value) {
        setState(() {
          _selectedTitleController.text = value!;
        });
      },
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
      nextFocusNode: _usernameFocusNode,
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
      currentFocusNode: _usernameFocusNode,
      nextFocusNode: _phoneNumberFocusNode,
      hintText: "Username",
      textInputType: TextInputType.text,
      obscureText: false,
      errorText: _usernameError,
      onChanged: (value) {
        if (_usernameFocusNode.hasFocus) {
          setState(() {
            _usernameError = ErrorText.getUsernameError(username: value!);
          });
        }
      },
    );
  }

  //*-----Phone Number Field------*
  Widget _phoneNumberField() {
    return CustomPhoneFormInputField(
      focusNode: _phoneNumberFocusNode,
      nextFocusNode: _businessCategoryFocusNode,
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

  //*-----Business Category Field------*
  Widget _businessCategoryField() {
    return DependentDropdown(
      hintText: "Business Category",
      subDropdownHintText: "Business Sub Category",
      fillColor: Colors.black.withOpacity(0.3),
      categories: _categories,
      onCategoryChanged: (value) {
        setState(() {
          _businessCategoryController.text = value.toString();
        });
      },
      onSubCategoryChanged: (value) {
        setState(() {
          _businessSubCategoryController.text = value.toString();
        });
      },
      onCategorySaved: (value) {
        _businessCategoryController.text = value.toString();
      },
      onSubCategorySaved: (value) {
        _businessSubCategoryController.text = value.toString();
      },
      categoryFocusNode: _businessCategoryFocusNode,
      subCategoryFocusNode: _businessSubCategoryFocusNode,
      nextFocusNode: _registrationFeesFocusNode,
    );
  }

  //*-----Registration Fees Field------*
  Widget _registrationFeesField() {
    return CustomFormField(
      readOnly: true,
      controller: _registrationFeesController,
      currentFocusNode: _registrationFeesFocusNode,
      nextFocusNode: _multipleLoginRequiredFocusNode,
      hintText: "Registration Fees",
      textInputType: TextInputType.text,
      obscureText: false,
      onChanged: (value) {
        if (_registrationFeesFocusNode.hasFocus) {
          setState(() {});
        }
      },
    );
  }

  //*-----Multiple Login Required Field------*
  Widget _multipleLoginRequiredField() {
    return DependentDropdown(
      hintText: "Multiple Login Required",
      subDropdownHintText: "No. of Logins",
      fillColor: Colors.black.withOpacity(0.3),
      categories: _multipleLoginOptions,
      onCategoryChanged: (value) {
        setState(() {
          _multipleLoginRequiredController.text = value.toString();
        });
      },
      onSubCategoryChanged: (value) {
        setState(() {
          _numberOfLoginRequiredController.text = value.toString();
        });
      },
      onCategorySaved: (value) {
        _multipleLoginRequiredController.text = value.toString();
      },
      onSubCategorySaved: (value) {
        _numberOfLoginRequiredController.text = value.toString();
      },
      categoryFocusNode: _multipleLoginRequiredFocusNode,
      subCategoryFocusNode: _numberOfLoginRequiredFocusNode,
      nextFocusNode: _postPaidArrangementRequiredFocusNode,
    );
  }

  //*-----Postpaid Arrangement Field------*
  Widget _postPaidArrangementField() {
    return SingleDropdown(
      ignore: true,
      onChanged: (value) {
        _postPaidArrangementController.text = value.toString();
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      dropdownListData: const ['No', 'Yes'],
      labelText: "PostPaid Arrangement Required",
      hintText: "Available after vintage of 1 year",
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
      nextFocusNode: _stateFocusNode,
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

  //*-----State Field------*
  Widget _stateField() {
    return CustomFormField(
      controller: _stateController,
      currentFocusNode: _stateFocusNode,
      nextFocusNode: _pinCodeFocusNode,
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

  //*-----Pin Code Field------*
  Widget _pinCodeField() {
    return CustomFormField(
      controller: _pinCodeController,
      currentFocusNode: _pinCodeFocusNode,
      nextFocusNode: _countryFocusNode,
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

  //*-----Country Field------*
  Widget _countryField() {
    return CustomFormField(
      controller: _countryController,
      currentFocusNode: _countryFocusNode,
      nextFocusNode:
          widget.isCompany ? _passwordFocusNode : _panNumberFocusNode,
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

  //*-----Pan Number Field------*
  Widget _panCardNumberField() {
    return CustomFormField(
      controller: _panNumberController,
      currentFocusNode: _panNumberFocusNode,
      nextFocusNode: _passwordFocusNode,
      hintText: "Pan Card Number",
      obscureText: false,
      textInputType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      errorText: _panNumberError,
      onChanged: (value) {
        if (_panNumberFocusNode.hasFocus) {
          setState(() {
            _panNumberError = ErrorText.getPanCardError(panCard: value!);
          });
        }
      },
    );
  }

  //*----Pan and Address Field-----*
  Widget _panAndAddressProofField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.02),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            border: Border.all(color: MyColorScheme.lightGrey3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: _buildFileSelector(
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
            title: Text(
              "Address Proof",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.65), fontSize: 15),
            ),
            titleAlignment: ListTileTitleAlignment.center,
            subtitle: Text(
              selectedAddressProof != null
                  ? selectedAddressProof!.path.split('/').last
                  : "Upload (jpg, jpeg, png, pdf) less then 2MB in size (Driving Licence/Voter Card/Masked Aadhaar Card/Passport/Job card issued Nrega duly signed by an officer of the state government)",
              style: TextStyle(
                color: Colors.white.withOpacity(0.65),
                fontSize: 10,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.02),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            border: Border.all(color: MyColorScheme.lightGrey3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: _buildFileSelector(
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
            title: Text(
              "Pan Card",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.65), fontSize: 15),
            ),
            subtitle: Text(
              selectedPanProof != null
                  ? selectedPanProof!.path.split('/').last
                  : "Upload (jpg, jpeg, png, pdf) less then 2MB in size",
              style: TextStyle(
                color: Colors.white.withOpacity(0.65),
                fontSize: 10,
              ),
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

  //*-----Submit Button------*
  Widget _submitButton() {
    return CustomButton(
        buttonName: "Submit",
        isLoading: false,
        isGradient: true,
        onTap: () {
          debugPrint('Firm Name: ${_firmNameController.text}');
          debugPrint('Firm Type: ${_firmTypeController.text}');
          debugPrint('GST Number: ${_gstNumberController.text}');
          debugPrint('Designation: ${_designationController.text}');
          debugPrint('First Name: ${_firstNameController.text}');
          debugPrint('Last Name: ${_lastNameController.text}');
          debugPrint('Username: ${_usernameController.text}');
          debugPrint('Country Code: ${_countryCodeController.text}');
          debugPrint('Phone Number: ${_phoneNumberController.text}');
          debugPrint('Business Category: ${_businessCategoryController.text}');
          debugPrint(
              'Business Sub-Category: ${_businessSubCategoryController.text}');
          debugPrint('Registration Fees: ${_registrationFeesController.text}');
          debugPrint(
              'Multiple Login Required: ${_multipleLoginRequiredController.text}');
          debugPrint(
              'Number of Login Required: ${_numberOfLoginRequiredController.text}');
          debugPrint(
              'Post Paid Arrangement: ${_postPaidArrangementController.text}');
          debugPrint('Profile Services: ${_profileServicesController.text}');
          debugPrint('Address: ${_addressController.text}');
          debugPrint('City: ${_cityController.text}');
          debugPrint('State: ${_stateController.text}');
          debugPrint('Pin Code: ${_pinCodeController.text}');
          debugPrint('Country: ${_countryController.text}');
          debugPrint('Email: ${_emailController.text}');
          debugPrint('Address Proof: ${_addressProofController.text}');
          debugPrint('Password: ${_passwordController.text}');
          debugPrint('Confirm Password: ${_confirmPasswordController.text}');
        });
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
}
