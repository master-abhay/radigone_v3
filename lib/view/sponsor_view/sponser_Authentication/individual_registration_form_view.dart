import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/common/business_category_model.dart';
import 'package:radigone_v3/resources/components/custom_checkbox_tile.dart';
import 'package:radigone_v3/utils/utils.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_dependent_dropdown.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../resources/components/dropdowns/business_category_dependent_dropdown.dart';
import '../../../utils/constants.dart';
import '../../../utils/validations.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/media_services.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/sponsor_view_model/sponsor_auth_viewModel/sponsor_register_viewModel.dart';

class IndividualRegistrationFormView extends StatefulWidget {
  final String registrationFees;
  final List<Categories> businessCategories;
  final UserType userType;

  const IndividualRegistrationFormView({
    super.key,
    required this.userType,
    required this.registrationFees,
    required this.businessCategories,
  });

  @override
  State<IndividualRegistrationFormView> createState() =>
      _IndividualRegistrationFormViewState();
}

class _IndividualRegistrationFormViewState
    extends State<IndividualRegistrationFormView>
    with MediaQueryMixin, AutomaticKeepAliveClientMixin {
  //Going to integrate userRegistration Api:

  bool isLoading = false;

  File? _selectedAddressProof;

  File? _selectedPanProof;

  bool showSpinner = false;

  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordVisibility =
      ValueNotifier<bool>(false);

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
  final TextEditingController _businessCategoryIdController =
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();


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
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _noOfLoginsFocusNode = FocusNode();
  final FocusNode _panNumberFocusNode = FocusNode();

  // Error variables

  String? _firstNameError;
  String? _lastNameError;
  String? _usernameError;
  String? _addressError;
  String? _cityError;
  String? _stateError;
  String? _pinCodeError;
  String? _countryError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
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
    _businessCategoryIdController.dispose();
    _businessSubCategoryController.dispose();
    _registrationFeesController.dispose();
    _profileServicesController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _panNumberController.dispose();

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
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _noOfLoginsFocusNode.dispose();
    _panNumberFocusNode.dispose();

    super.dispose();
  }


  bool _profileServicesCheck = false;

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();
    _alertServices = _getIt.get<AlertServices>();
    _selectedTitleController.text = Constants.titleOptions[0];
    _registrationFeesController.text = widget.registrationFees;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return SizedBox(
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return mainForm();
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
              _profileServicesField(),
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
              _panCardNumberField(),
              kFormFieldHeight,
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
      titleOptions: Constants.titleOptions,
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
      textCapitalization: TextCapitalization.none,
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

        }
      },
    );
  }

  //*-----Business Category Field------*
  Widget _businessCategoryField() {
    return BusinessCategoryDependentDropdown(
      categories: widget.businessCategories,
      hintText: "Business Category",
      subDropdownHintText: "Business Sub Category",
      categoryFocusNode: _businessCategoryFocusNode,
      subCategoryFocusNode: _businessSubCategoryFocusNode,
      nextFocusNode: _multipleLoginRequiredFocusNode,
      fillColor: Colors.black.withOpacity(0.3),
      initialCategory: null,
      // Pass initial values if available
      initialSubCategory: null,
      onCategoryChanged: (categoryId) {
        // Handle category change
        _businessCategoryIdController.text = categoryId.toString();
      },
      onSubCategoryChanged: (subCategory) {
        // Handle subcategory change
        _businessSubCategoryController.text = subCategory.toString();
      },
    );
  }

  //   return DependentDropdown(
  //     hintText: "Business Category",
  //     subDropdownHintText: "Business Sub Category",
  //     fillColor: Colors.black.withOpacity(0.3),
  //     categories: _categories,
  //     onCategoryChanged: (value) {
  //       setState(() {
  //         _businessCategoryIdController.text = value.toString();
  //       });
  //     },
  //     onSubCategoryChanged: (value) {
  //       setState(() {
  //         _businessSubCategoryController.text = value.toString();
  //       });
  //     },
  //     onCategorySaved: (value) {
  //       _businessCategoryIdController.text = value.toString();
  //     },
  //     onSubCategorySaved: (value) {
  //       _businessSubCategoryController.text = value.toString();
  //     },
  //     categoryFocusNode: _businessCategoryFocusNode,
  //     subCategoryFocusNode: _businessSubCategoryFocusNode,
  //     nextFocusNode: _registrationFeesFocusNode,
  //   );
  // }

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
      categories: Constants.multipleLoginOptions,
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
        // _postPaidArrangementController.text = value.toString();
        _postPaidArrangementController.text = 'No';
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      dropdownListData: const ['No', 'Yes'],
      labelText: "PostPaid Arrangement Required",
      hintText: "Available after vintage of 1 year",
    );
  }

  //*----Profile Services Field----*
  Widget _profileServicesField() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Profile Services",
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
        ),
        CustomCheckBoxTile(
            isChecked: _profileServicesCheck,
            title: "Contact details of viewers",
            onChanged: (value) {
              setState(() {
                _profileServicesCheck = !_profileServicesCheck;
                if (_profileServicesCheck) {
                  _profileServicesController.text =
                      "Contact details of viewers";
                } else {
                  _profileServicesController.text = "";
                }
              });
            }),
        CustomCheckBoxTile(
            isChecked: false,
            title: "Discount coupons to boost sales",
            onChanged: (value) {}),
        CustomCheckBoxTile(
            isChecked: false,
            title: "Radigone Points deposit time- 7/10/15/20 Days",
            onChanged: (value) {})
      ],
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
      textCapitalization: TextCapitalization.none,
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
      nextFocusNode: _panNumberFocusNode,
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
              file: _selectedAddressProof,
              onTap: () async {
                File? file = await _mediaServices.getSingleFileFromPicker(
                    allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf']);
                if (file != null) {
                  setState(() {
                    _selectedAddressProof = file;
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
              _selectedAddressProof != null
                  ? _selectedAddressProof!.path.split('/').last
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
              file: _selectedPanProof,
              onTap: () async {
                File? file = await _mediaServices.getSingleFileFromPicker(
                    allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf']);
                if (file != null) {
                  setState(() {
                    _selectedPanProof = file;
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
              _selectedPanProof != null
                  ? _selectedPanProof!.path.split('/').last
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
    return ChangeNotifierProvider(
      create: (context) => SponsorRegisterViewModel(),
      child: Consumer<SponsorRegisterViewModel>(
        builder: (context, signup, _) {
          return CustomButton(
              buttonName: "Submit",
              isLoading: false,
              isGradient: true,
              onTap: () async {
                //*----Setting Hard Values----*
                _postPaidArrangementController.text = "No";

                debugPrint('Firm Name: ${_firmNameController.text}');
                debugPrint('Firm Type: ${_firmTypeController.text}');
                debugPrint('GST Number: ${_gstNumberController.text}');
                debugPrint('Designation: ${_designationController.text}');
                debugPrint('First Name: ${_firstNameController.text}');
                debugPrint('Last Name: ${_lastNameController.text}');
                debugPrint('Username: ${_usernameController.text}');
                debugPrint('Country Code: ${_countryCodeController.text}');
                debugPrint('Phone Number: ${_phoneNumberController.text}');
                debugPrint(
                    'Business Category: ${_businessCategoryIdController.text}');
                debugPrint(
                    'Business Sub-Category: ${_businessSubCategoryController.text}');
                debugPrint(
                    'Registration Fees: ${_registrationFeesController.text}');
                debugPrint(
                    'Multiple Login Required: ${_multipleLoginRequiredController.text}');
                debugPrint(
                    'Number of Login Required: ${_numberOfLoginRequiredController.text}');
                debugPrint(
                    'Post Paid Arrangement: ${_postPaidArrangementController.text}');
                debugPrint(
                    'Profile Services: ${_profileServicesController.text}');
                debugPrint('Address: ${_addressController.text}');
                debugPrint('City: ${_cityController.text}');
                debugPrint('State: ${_stateController.text}');
                debugPrint('Pin Code: ${_pinCodeController.text}');
                debugPrint('Country: ${_countryController.text}');
                debugPrint('Email: ${_emailController.text}');
                debugPrint('Password: ${_passwordController.text}');
                debugPrint(
                    'Confirm Password: ${_confirmPasswordController.text}');
                debugPrint(
                    'addressFile:${_selectedAddressProof?.path.split('/').last.toString()}');
                debugPrint(
                    'panFile:${_selectedPanProof?.path.split('/').last.toString()}');

                bool validate =
                    await _validateForm(signup: signup, context: context);

                if (validate) {
                  await signup.registerSponsor();
                }
              });
        },
      ),
    );
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

  Future<bool> _validateForm(
      {required SponsorRegisterViewModel signup,
      required BuildContext context}) async {
    // Utility function to show error messages
    void showError(String message) {
      _alertServices.flushBarErrorMessages(message, context);
    }

    // Validate selected title
    if (_selectedTitleController.text.isEmpty) {
      showError("Please select your title.");
      return false;
    } else {
      signup.setSelectedTitle = _selectedTitleController.text.trim();
    }

    // Validate first name
    if (_firstNameController.text.isEmpty) {
      showError("Please enter your first name.");
      return false;
    } else {
      signup.setFirstName = _firstNameController.text.trim();
    }

    // Validate last name
    if (_lastNameController.text.isEmpty) {
      showError("Please enter your last name.");
      return false;
    } else {
      signup.setLastName = _lastNameController.text.trim();
    }

    // Validate username
    if (_usernameController.text.isEmpty) {
      showError("Please enter your username.");
      return false;
    } else {
      signup.setUsername = _usernameController.text.trim();
    }

    // Validate phone number
    if (_phoneNumberController.text.isEmpty) {
      showError("Please enter your phone number.");
      return false;
    } else {
      signup.setPhoneNumber = _phoneNumberController.text.trim();
    }

    // Validate country code
    if (_countryCodeController.text.isEmpty) {
      showError("Please enter your country code.");
      return false;
    } else {
      signup.setCountryCode = _countryCodeController.text.trim();
    }

    // Validate business category
    if (_businessCategoryIdController.text.isEmpty) {
      showError("Please select a business category.");
      return false;
    } else {
      signup.setBusinessCategory = _businessCategoryIdController.text.trim();
    }

    // Validate business sub-category
    if (_businessSubCategoryController.text.isEmpty) {
      showError("Please select a business sub-category.");
      return false;
    } else {
      signup.setBusinessSubCategory =
          _businessSubCategoryController.text.trim();
    }

    // Validate multiple login required
    if (_multipleLoginRequiredController.text.isEmpty) {
      showError("Please specify if multiple logins are required.");
      return false;
    } else {
      signup.setMultipleLoginRequired =
          _multipleLoginRequiredController.text.trim();
    }

    // Validate number of logins required
    if (!(_multipleLoginRequiredController.text == 'No') &&
        _numberOfLoginRequiredController.text.isEmpty) {
      showError("Please enter the number of logins required.");
      return false;
    } else {
      signup.setNumberOfLoginRequired =
          _numberOfLoginRequiredController.text.trim();
    }

    // Validate post-paid arrangement
    if (_postPaidArrangementController.text.isEmpty) {
      showError("Please specify the post-paid arrangement.");
      return false;
    } else {
      signup.setPostPaidArrangement =
          _postPaidArrangementController.text.trim();
    }

    // Validate address
    if (_addressController.text.isEmpty) {
      showError("Please enter your address.");
      return false;
    } else {
      signup.setAddress = _addressController.text.trim();
    }

    // Validate city
    if (_cityController.text.isEmpty) {
      showError("Please enter your city.");
      return false;
    } else {
      signup.setCity = _cityController.text.trim();
    }

    // Validate state
    if (_stateController.text.isEmpty) {
      showError("Please enter your state.");
      return false;
    } else {
      signup.setState = _stateController.text.trim();
    }

    // Validate pin code
    if (_pinCodeController.text.isEmpty) {
      showError("Please enter your pin code.");
      return false;
    } else {
      signup.setPinCode = _pinCodeController.text.trim();
    }

    // Validate country
    if (_countryController.text.isEmpty) {
      showError("Please enter your country.");
      return false;
    } else {
      signup.setCountry = _countryController.text.trim();
    }

    // Validate email
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      showError("Please enter a valid email address.");
      return false;
    } else {
      signup.setEmail = _emailController.text.trim().toLowerCase();
    }

    // Validate password
    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 8) {
      showError("Password must be at least 8 characters long.");
      return false;
    } else {
      signup.setPassword = _passwordController.text.trim();
    }

    // Validate confirm password
    if (_confirmPasswordController.text.isEmpty ||
        _confirmPasswordController.text != _passwordController.text) {
      showError("Passwords do not match.");
      return false;
    } else {
      signup.setConfirmPassword = _confirmPasswordController.text.trim();
    }

    // Validate PAN number
    if (_panNumberController.text.isEmpty) {
      showError("Please enter your PAN number.");
      return false;
    } else {
      signup.setPanNumber = _panNumberController.text.trim();
    }

    // Validate address proof file
    if (_selectedAddressProof == null) {
      showError("Please attach your address proof.");
      return false;
    } else {
      signup.setAddressProofFile = _selectedAddressProof;
    }

    // Validate pan proof file
    if (_selectedPanProof == null) {
      showError("Please attach your Pan card proof.");
      return false;
    } else {
      signup.setPanProofFile = _selectedPanProof;
    }

    return true;
  }

  @override
  bool get wantKeepAlive => true;
}
