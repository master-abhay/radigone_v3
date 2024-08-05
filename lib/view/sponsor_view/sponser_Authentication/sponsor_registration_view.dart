import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_dependent_dropdown.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../utils/validations.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/media_services.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/sponsor_view_model/sponsor_register_viewModel.dart';

class SponsorRegistrationView extends StatefulWidget {
  const SponsorRegistrationView({super.key});

  @override
  State<SponsorRegistrationView> createState() =>
      _SponsorRegistrationViewState();
}

class _SponsorRegistrationViewState extends State<SponsorRegistrationView> {
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

  // String _selectedbusinessCategory = 'others';
  // var businessCategoryMap = {
  //   'Test11': 'Test11',
  //   'Online Services': 'Online Services',
  //   'OTT Platform': 'OTT Platform',
  //   'Sports': "Sports",
  //   'Mobile and Laptops': 'Mobile and Laptops',
  //   'Loans': 'Loans',
  //   'Tour and Travels': 'Tour and Travels',
  //   'Gold and Jewellery': 'Gold and Jewellery',
  //   'Clothing': 'Clothing',
  //   'Accessories': 'Accessories',
  //   'Real Estate': 'Real Estate',
  //   'Health': "Health",
  //   'others': 'others',
  // };
  //
  // final List<String> _businessCategoryList = [];
  // String _selectedSubCategory = '';
  // var subCategoryMap = {
  //   'test1': 'Test11',
  //   'test2': 'Test11',
  //   'test3': 'Test11',
  //   '123': 'Online Services',
  //   "Netflix": 'OTT Platform',
  //   "HotStar": 'OTT Platform',
  //   "Prime Video": 'OTT Platform',
  //   "Other": 'OTT Platform',
  //   'Cricket': "Sports",
  //   'Football': "Sports",
  //   'Tennis': "Sports",
  //   'BasketBall': "Sports",
  //   'Hockey': "Sports",
  //   'other': "Sports",
  //   '456': 'Mobile and Laptops',
  //   'Home Loan': 'Loans',
  //   'Vehicle Loan': 'Loans',
  //   "other": 'Loans',
  //   'Tour': 'Tour and Travels',
  //   'Travels': 'Tour and Travels',
  //   'abc': 'Gold and Jewellery',
  //   'Men': 'Clothing',
  //   'Women': 'Clothing',
  //   'Kids': 'Clothing',
  //   'Access': 'Accessories',
  //   'To': 'Accessories',
  //   'Commercial': 'Real Estate',
  //   'Residential': 'Real Estate',
  //   'Rent': 'Real Estate',
  //   'other': 'Real Estate',
  //   'Wealth': "Health",
  //   'abc': "others"
  // };
  // final List<String> _subCategoryList = [];
  //
  // void businessDependentDropdown() {
  //   businessCategoryMap.forEach((key, value) {
  //     _businessCategoryList.add(key);
  //   });
  // }
  //
  // void stateDependentDropdown(String? categoryShortName) {
  //   _subCategoryList.clear(); // Clear previous states
  //   subCategoryMap.forEach((key, value) {
  //     if (categoryShortName == value) {
  //       _subCategoryList.add(key);
  //     }
  //   });
  //   // Select the first state if available
  //   _selectedSubCategory =
  //       _subCategoryList.isNotEmpty ? _subCategoryList[0] : '';
  // }
  //
  // //Select No of login Required:
  // String _selectedMultipleLoginRequired = 'No';
  // var multipleLoginRequiredMap = {'Yes': 'Yes', 'No': 'No'};
  //
  // final List<String> _multipleLoginRequiredList = [];
  //
  // void multipleLoginSelectionMapDependentDropdown() {
  //   multipleLoginRequiredMap.forEach((key, value) {
  //     _multipleLoginRequiredList.add(key);
  //   });
  // }
  //
  // String? _selectedNumberOfLoginRequired;
  // var numberOfLoginRequiredMap = {
  //   '2': 'Yes',
  //   '3': 'Yes',
  //   '4': 'Yes',
  // };
  //
  // final List<String> _numberOfLoginRequiredList = [];
  //
  // void numberOfMultipleLoginDependentDropdown(String? selectValues) {
  //   _numberOfLoginRequiredList.clear();
  //   numberOfLoginRequiredMap.forEach((key, value) {
  //     if (selectValues == value) {
  //       _numberOfLoginRequiredList.add(key);
  //     }
  //   });
  //
  //   if (_numberOfLoginRequiredList.isNotEmpty) {
  //     _selectedNumberOfLoginRequired = _numberOfLoginRequiredList[0];
  //   } else {
  //     _selectedNumberOfLoginRequired = null;
  //   }
  // }

  // Define TextEditingControllers
  final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _firmTypeController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _proprietorController = TextEditingController();
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

  // Define FocusNodes
  final FocusNode _firmNameFocusNode = FocusNode();
  final FocusNode _firmTypeFocusNode = FocusNode();
  final FocusNode _companyFocusNode = FocusNode();
  final FocusNode _gstNumberFocusNode = FocusNode();
  final FocusNode _designationFocusNode = FocusNode();
  final FocusNode _proprietorFocusNode = FocusNode();
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

  // Boolean field
  bool _multipleLoginRequired = false;

  // Error variables
  String? _firmNameError;
  String? _firmTypeError;
  String? _companyError;
  String? _gstNumberError;
  String? _designationError;
  String? _proprietorError;
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

  @override
  void dispose() {
    // Dispose all controllers and focus nodes
    _firmNameController.dispose();
    _firmTypeController.dispose();
    _companyController.dispose();
    _gstNumberController.dispose();
    _designationController.dispose();
    _proprietorController.dispose();
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

    _firmNameFocusNode.dispose();
    _firmTypeFocusNode.dispose();
    _companyFocusNode.dispose();
    _gstNumberFocusNode.dispose();
    _designationFocusNode.dispose();
    _proprietorFocusNode.dispose();
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

    super.dispose();
  }

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();
    _alertServices = _getIt.get<AlertServices>();

    _signUpFormKey = GlobalKey<FormState>();
    super.initState();
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
    'Yes': ['2', '3', '4'],
    'No': [],
  };

// Define variables to manage selected options
  String _selectedMultipleLoginRequired = 'No';
  String? _selectedNumberOfLogins;
  final List<String> _numberOfLoginsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Consumer<RegisterSponsorProvider>(
      builder: (context, providerValue, Widget? child) {
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
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(150, 40))),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              // physics: const ClampingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Column(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
                          child: Center(
                            child: Material(
                              color: MyColorScheme.authContainerColor
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                // height: 500,
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.04,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Form(
                                  key: _signUpFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      _firmNameField(),
                                      const SizedBox(height: 10),
                                      _firmTypeField(),
                                      const SizedBox(height: 10),
                                      _gstNumberField(),
                                      const SizedBox(height: 10),
                                      _designationField(),
                                      const SizedBox(height: 10),
                                      _firstNameField(),
                                      const SizedBox(height: 10),
                                      _lastNameField(),
                                      const SizedBox(height: 10),
                                      _usernameField(),
                                      const SizedBox(height: 10),
                                      _phoneNumberField(),
                                      const SizedBox(height: 10),
                                      _businessCategoryField(),
                                      const SizedBox(height: 10),
                                      _registrationFeesField(),
                                      const SizedBox(height: 10),
                                      _multipleLoginRequiredField(),
                                      const SizedBox(height: 10),
                                      _postPaidArrangementField(),
                                      const SizedBox(height: 10),
                                      _emailField(),
                                      const SizedBox(height: 10),
                                      _addressField(),
                                      const SizedBox(height: 10),
                                      _cityField(),
                                      const SizedBox(height: 10),
                                      _stateField(),
                                      const SizedBox(height: 10),
                                      _pinCodeField(),
                                      const SizedBox(height: 10),
                                      _countryField(),

                                      const SizedBox(height: 10),
                                      _panAndAddressProofField(),
                                      const SizedBox(height: 10),
                                      _passwordField(),
                                      const SizedBox(height: 10),
                                      _confirmPasswordField(),
                                      const SizedBox(height: 30),
                                      _submitButton(),
                                    ],

                                    // children: [
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: Row(
                                    //       children: [
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "Firm name",
                                    //                 onSaved: (value) {
                                    //                   providerValue.firmName(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //        ),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //               width: 150,
                                    //               child: CustomDropdown(
                                    //                 onSaved: (value) {
                                    //                   providerValue.firmType(value);
                                    //                 },
                                    //                 onChanged: (value) {
                                    //                   providerValue.firmType(value);
                                    //
                                    //                 },
                                    //                 dropdownListData: const [
                                    //                   {
                                    //                     'title': 'Company',
                                    //                     'value': 'Company'
                                    //                   },
                                    //                   {
                                    //                     'title':
                                    //                         'Private Limited',
                                    //                     'value':
                                    //                         'Private Limited'
                                    //                   },
                                    //                   {
                                    //                     'title': 'Partnership',
                                    //                     'value': 'Partnership'
                                    //                   },
                                    //                   {
                                    //                     'title':
                                    //                         'Proprietorship',
                                    //                     'value':
                                    //                         'Proprietorship'
                                    //                   },
                                    //                   {
                                    //                     'title': 'LLP',
                                    //                     'value': 'LLP'
                                    //                   },
                                    //                   {
                                    //                     'title': 'OPC',
                                    //                     'value': 'OPC'
                                    //                   },
                                    //                 ],
                                    //                 hint: "Firm Type",
                                    //               )),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Gst Number",
                                    //         textCapitalization: false,
                                    //         onSaved: (value) {
                                    //           providerValue.gstNumber(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: false),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //       width: 295,
                                    //       child: CustomDropdown(
                                    //         onSaved: (value) {
                                    //           providerValue.designation(value);
                                    //         },
                                    //         onChanged: (value) {
                                    //           providerValue.designation(value);
                                    //         },
                                    //         dropdownListData: const [
                                    //           {
                                    //             'title': 'Proprietor',
                                    //             'value': 'Proprietor'
                                    //           },
                                    //           {
                                    //             'title': 'Director',
                                    //             'value': 'Director'
                                    //           },
                                    //           {
                                    //             'title': 'Authorized Person',
                                    //             'value': 'Authorized Person'
                                    //           },
                                    //         ],
                                    //         hint: "Designation",
                                    //       )),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: Row(
                                    //       children: [
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "First Name",
                                    //                 onSaved: (value) {
                                    //                   providerValue.firstName(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: false),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "Last Name",
                                    //                 onSaved: (value) {
                                    //                   providerValue.lastName(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: false),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Username",
                                    //         textCapitalization: false,
                                    //         onSaved: (value) {
                                    //          providerValue.userName(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: false),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //       width: 295,
                                    //       child: CustomPhoneFormInputField(
                                    //         hintText: "Phone Number",
                                    //         onSaved: (value) {
                                    //           providerValue.phoneNumber(value!.number);
                                    //           providerValue.countryCode(value.countryCode);
                                    //
                                    //         },
                                    //         onChanged: (value) {
                                    //           providerValue.phoneNumber(value!.number);
                                    //           providerValue.countryCode(value.countryCode);
                                    //         },
                                    //       )),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   // business Category: Given Value
                                    //   businessCategory(),
                                    //
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   //Registration Fees
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Registration Fees",
                                    //         onSaved: (value) {
                                    //         providerValue.registrationFees(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: true),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   //Profile Services:
                                    //
                                    //   //Multiple Login Required: dropdown
                                    //   requireNumberOfLoginDropdowns(),
                                    //
                                    //   // PostPaidArrangement
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   postPaidArrangementRequired(),
                                    //
                                    //   //Email:
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Email",
                                    //         onSaved: (value) {
                                    //          providerValue.email(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: false),
                                    //   ),
                                    //
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Address",
                                    //         onSaved: (value) {
                                    //           providerValue.address(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: false),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: Row(
                                    //       children: [
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "City",
                                    //                 onSaved: (value) {
                                    //                   providerValue.city(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: false),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "Pin Code",
                                    //                 onSaved: (value) {
                                    //                   providerValue.pinCode(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: true),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: Row(
                                    //       children: [
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "State",
                                    //                 onSaved: (value) {
                                    //                  providerValue.state(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: false),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: CustomFormField(
                                    //                 hintText: "Country",
                                    //                 onSaved: (value) {
                                    //                   providerValue.country(value);
                                    //                 },
                                    //                 obscureText: false,
                                    //                 isNumber: false),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: CustomFormField(
                                    //         hintText: "Pan Number",
                                    //         onSaved: (value) {
                                    //           providerValue.panNumber(value);
                                    //         },
                                    //         obscureText: false,
                                    //         isNumber: false,
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //       mainAxisSize: MainAxisSize.max,
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.center,
                                    //       children: [
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: Container(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 vertical:
                                    //                     MediaQuery.of(context)
                                    //                             .size
                                    //                             .width *
                                    //                         0.02),
                                    //             decoration: BoxDecoration(
                                    //               color: Colors.black
                                    //                   .withOpacity(0.3),
                                    //               border: Border.all(
                                    //                   color: MyColorScheme
                                    //                       .lightGrey3),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(8),
                                    //             ),
                                    //             child: Column(
                                    //               children: [
                                    //                 addressProofSelector(),
                                    //                 Text(
                                    //                   "Address Proof",
                                    //                   style: TextStyle(
                                    //                       color: Colors.white
                                    //                           .withOpacity(
                                    //                               0.65),
                                    //                       fontSize: 15),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Expanded(
                                    //           flex: 2,
                                    //           child: SizedBox(
                                    //             width: 150,
                                    //             child: Container(
                                    //               padding: EdgeInsets.symmetric(
                                    //                   vertical:
                                    //                       MediaQuery.of(context)
                                    //                               .size
                                    //                               .width *
                                    //                           0.02),
                                    //               decoration: BoxDecoration(
                                    //                 color: Colors.black
                                    //                     .withOpacity(0.3),
                                    //                 border: Border.all(
                                    //                     color: MyColorScheme
                                    //                         .lightGrey3),
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         8),
                                    //               ),
                                    //               child: Column(
                                    //                 children: [
                                    //                   panProofSelector(),
                                    //                   Text(
                                    //                     "Pan Card",
                                    //                     style: TextStyle(
                                    //                         color: Colors.white
                                    //                             .withOpacity(
                                    //                                 0.65),
                                    //                         fontSize: 15),
                                    //                   )
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: ValueListenableBuilder(
                                    //       valueListenable: _passwordVisibilty,
                                    //       builder:
                                    //           (context, value, Widget? child) {
                                    //         return CustomFormField(
                                    //           hintText:
                                    //               "Create 6 digit password",
                                    //           textCapitalization: false,
                                    //           onSaved: (value) {
                                    //             providerValue.password(value);
                                    //           },
                                    //           obscureText:
                                    //               _passwordVisibiltyObscure,
                                    //           isNumber: false,
                                    //           maxLines: 1,
                                    //           icon: GestureDetector(
                                    //             onTap: () {
                                    //               _passwordVisibilty.value =
                                    //                   !_passwordVisibilty.value;
                                    //               _passwordVisibiltyObscure =
                                    //                   !_passwordVisibiltyObscure;
                                    //             },
                                    //             child: _passwordVisibilty.value
                                    //                 ? const Icon(
                                    //                     Icons.visibility,
                                    //                     color: Colors.white,
                                    //                   )
                                    //                 : const Icon(
                                    //                     Icons.visibility_off,
                                    //                     color: Colors.white,
                                    //                   ),
                                    //           ),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 10,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 295,
                                    //     child: ValueListenableBuilder(
                                    //       valueListenable:
                                    //           _confirmPasswordVisibility,
                                    //       builder:
                                    //           (context, value, Widget? child) {
                                    //         return CustomFormField(
                                    //           hintText: "Confirm password",
                                    //           textCapitalization: false,
                                    //           onSaved: (value) {
                                    //             providerValue.confirmPassword(value);
                                    //           },
                                    //           obscureText:
                                    //               _confirmPasswordVisibilityObscure,
                                    //           isNumber: false,
                                    //           maxLines: 1,
                                    //           icon: GestureDetector(
                                    //             onTap: () {
                                    //               _confirmPasswordVisibility
                                    //                       .value =
                                    //                   !_confirmPasswordVisibility
                                    //                       .value;
                                    //               _confirmPasswordVisibilityObscure =
                                    //                   !_confirmPasswordVisibilityObscure;
                                    //             },
                                    //             child:
                                    //                 _confirmPasswordVisibility
                                    //                         .value
                                    //                     ? const Icon(
                                    //                         Icons.visibility,
                                    //                         color: Colors.white,
                                    //                       )
                                    //                     : const Icon(
                                    //                         Icons
                                    //                             .visibility_off,
                                    //                         color: Colors.white,
                                    //                       ),
                                    //           ),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 20,
                                    //   ),
                                    //   SizedBox(
                                    //     width: 240,
                                    //     child: CustomButton(
                                    //         buttonName: "Sign Up",
                                    //         isLoading: providerValue.loading,
                                    //         isGradient: true,
                                    //         onTap: () async{
                                    //
                                    //           if(_signUpFormKey.currentState!.validate()){
                                    //             _signUpFormKey.currentState!.save();
                                    //             await providerValue.SignUpSponsor();
                                    //
                                    //           }
                                    //
                                    //
                                    //
                                    //         }),
                                    //   ),
                                    //   const SizedBox(
                                    //     height: 5,
                                    //   ),
                                    //   GestureDetector(
                                    //     onTap: () {},
                                    //     child: const Text(
                                    //       "Have a referral code?",
                                    //       style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 12),
                                    //     ),
                                    //   ),
                                    // ],
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
      },
    );
  }

  // Widget businessCategory() {
  //   return Consumer<RegisterSponsorProvider>(
  //     builder: (context, providerValue, Widget? value) {
  //       return SizedBox(
  //         width: 295,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             DropdownButtonFormField<String>(
  //               hint: const Text("Select Business Category"),
  //               value: _selectedbusinessCategory.isNotEmpty
  //                   ? _selectedbusinessCategory
  //                   : null,
  //               items: _businessCategoryList.map((element) {
  //                 return DropdownMenuItem(
  //                   value: element,
  //                   child: Text(
  //                     element,
  //                     style: const TextStyle(color: Colors.white),
  //                   ),
  //                 );
  //               }).toList(),
  //               onChanged: (newValue) {
  //                 providerValue.businessCategory(newValue);
  //                 setState(() {
  //                   _selectedbusinessCategory = newValue!;
  //                 if(kDebugMode){
  //                   print(
  //                       "--------printing the business Category $_selectedbusinessCategory");
  //                 }
  //                   stateDependentDropdown(
  //                       businessCategoryMap[_selectedbusinessCategory]);
  //                 });
  //               },
  //               validator: (value) {
  //                 if (value != null && value.isNotEmpty) {
  //                   return null;
  //                 } else {
  //                   return "Select Business Category";
  //                   // return null;
  //                 }
  //               },
  //               padding: EdgeInsets.zero,
  //               isExpanded: true,
  //               alignment: Alignment.center,
  //               dropdownColor: Colors.black.withOpacity(0.65),
  //               focusColor: Colors.black,
  //               icon: const Icon(
  //                 Icons.arrow_drop_down,
  //                 color: Colors.white,
  //               ),
  //               decoration: InputDecoration(
  //                   errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
  //                   contentPadding: EdgeInsets.symmetric(
  //                       horizontal: MediaQuery.of(context).size.width * 0.02),
  //                   alignLabelWithHint: true,
  //                   // hintText: widget.hint.toLowerCase(),
  //                   hintText: "Select Business Category".toLowerCase(),
  //                   hintFadeDuration: const Duration(milliseconds: 500),
  //                   hintStyle: TextStyle(
  //                       color: Colors.white.withOpacity(0.1), fontSize: 15),
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: BorderSide.none),
  //                   focusedBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: const BorderSide(color: Colors.white)),
  //                   errorBorder: UnderlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: Colors.red.withOpacity(0.8))),
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: Colors.black.withOpacity(0.3))),
  //                   focusedErrorBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: const BorderSide(color: Colors.white)),
  //                   // labelText: widget.hint,
  //                   labelText: "Select Business category",
  //                   labelStyle: TextStyle(
  //                       color: Colors.white.withOpacity(0.65), fontSize: 15),
  //                   filled: true,
  //                   fillColor: Colors.black.withOpacity(0.3)),
  //             ),
  //             const SizedBox(height: 10),
  //             DropdownButtonFormField<String>(
  //               value: _selectedSubCategory.isNotEmpty
  //                   ? _selectedSubCategory
  //                   : null,
  //               items: _subCategoryList.map((state) {
  //                 return DropdownMenuItem(
  //                   value: state,
  //                   child: Text(
  //                     state,
  //                     style: const TextStyle(color: Colors.white),
  //                   ),
  //                 );
  //               }).toList(),
  //               onChanged: (newValue) {
  //                 providerValue.businessSubCategory(newValue);
  //                 setState(() {
  //                   _selectedSubCategory = newValue!;
  //                   print(
  //                       "--------printing the business Category $_selectedSubCategory");
  //                 });
  //               }
  //
  //              ,
  //               padding: EdgeInsets.zero,
  //               isExpanded: true,
  //               alignment: Alignment.center,
  //               dropdownColor: Colors.black.withOpacity(0.65),
  //               focusColor: Colors.black,
  //               icon: const Icon(
  //                 Icons.arrow_drop_down,
  //                 color: Colors.white,
  //               ),
  //               decoration: InputDecoration(
  //                   errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
  //                   contentPadding: EdgeInsets.symmetric(
  //                       horizontal: MediaQuery.of(context).size.width * 0.02),
  //                   alignLabelWithHint: true,
  //                   // hintText: widget.hint.toLowerCase(),
  //                   hintText: "Select Business Subcategory".toLowerCase(),
  //                   hintFadeDuration: const Duration(milliseconds: 500),
  //                   hintStyle: TextStyle(
  //                       color: Colors.white.withOpacity(0.1), fontSize: 15),
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: BorderSide.none),
  //                   focusedBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: const BorderSide(color: Colors.white)),
  //                   errorBorder: UnderlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: Colors.red.withOpacity(0.8))),
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide:
  //                           BorderSide(color: Colors.black.withOpacity(0.3))),
  //                   focusedErrorBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                       borderSide: const BorderSide(color: Colors.white)),
  //                   // labelText: widget.hint,
  //                   labelText: "Select Business Subcategory",
  //                   labelStyle: TextStyle(
  //                       color: Colors.white.withOpacity(0.65), fontSize: 15),
  //                   filled: true,
  //                   fillColor: Colors.black.withOpacity(0.3)),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget requireNumberOfLoginDropdowns() {
  //   return Consumer<RegisterSponsorProvider>(
  //       builder: (context, providerValue, Widget? value) {
  //     return SizedBox(
  //       width: 295,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           DropdownButtonFormField<String>(
  //             value: _selectedMultipleLoginRequired,
  //             items: _multipleLoginRequiredList.map((element) {
  //               return DropdownMenuItem(
  //                 value: element,
  //                 child: Text(
  //                   element,
  //                   style: const TextStyle(color: Colors.white),
  //                 ),
  //               );
  //             }).toList(),
  //             onChanged: (newValue) {
  //               providerValue.multipleLoginRequired(newValue);
  //               setState(() {
  //                 _selectedMultipleLoginRequired = newValue!;
  //                 numberOfMultipleLoginDependentDropdown(
  //                     multipleLoginRequiredMap[_selectedMultipleLoginRequired]);
  //               });
  //             },
  //             validator: (value) {
  //               if (value != null && value.isNotEmpty) {
  //                 return null;
  //               } else {
  //                 return "Select Field";
  //                 // return null;
  //               }
  //             },
  //             padding: EdgeInsets.zero,
  //             isExpanded: true,
  //             alignment: Alignment.center,
  //             dropdownColor: Colors.black.withOpacity(0.65),
  //             focusColor: Colors.black,
  //             icon: const Icon(
  //               Icons.arrow_drop_down,
  //               color: Colors.white,
  //             ),
  //             decoration: InputDecoration(
  //                 errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
  //                 contentPadding: EdgeInsets.symmetric(
  //                     horizontal: MediaQuery.of(context).size.width * 0.02),
  //                 alignLabelWithHint: true,
  //                 // hintText: widget.hint.toLowerCase(),
  //                 hintText: "Multiple Login Required".toLowerCase(),
  //                 hintFadeDuration: const Duration(milliseconds: 500),
  //                 hintStyle: TextStyle(
  //                     color: Colors.white.withOpacity(0.1), fontSize: 15),
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: BorderSide.none),
  //                 focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: const BorderSide(color: Colors.white)),
  //                 errorBorder: UnderlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide:
  //                         BorderSide(color: Colors.red.withOpacity(0.8))),
  //                 enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide:
  //                         BorderSide(color: Colors.black.withOpacity(0.3))),
  //                 focusedErrorBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: const BorderSide(color: Colors.white)),
  //                 // labelText: widget.hint,
  //                 labelText: "Multiple Login Required",
  //                 labelStyle: TextStyle(
  //                     color: Colors.white.withOpacity(0.65), fontSize: 15),
  //                 filled: true,
  //                 fillColor: Colors.black.withOpacity(0.3)),
  //           ),
  //           const SizedBox(height: 10),
  //           DropdownButtonFormField<String>(
  //             value: _selectedNumberOfLoginRequired,
  //             items: _numberOfLoginRequiredList.map((element) {
  //               return DropdownMenuItem(
  //                 value: element,
  //                 child: Text(
  //                   element,
  //                   style: const TextStyle(color: Colors.white),
  //                 ),
  //               );
  //             }).toList(),
  //             onChanged: (newValue) {
  //               providerValue.numberOfLoginRequired(newValue);
  //               setState(() {
  //                 _selectedNumberOfLoginRequired = newValue;
  //               });
  //             },
  //
  //             padding: EdgeInsets.zero,
  //             isExpanded: true,
  //             alignment: Alignment.center,
  //             dropdownColor: Colors.black.withOpacity(0.65),
  //             focusColor: Colors.black,
  //             icon: const Icon(
  //               Icons.arrow_drop_down,
  //               color: Colors.white,
  //             ),
  //             decoration: InputDecoration(
  //                 errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
  //                 contentPadding: EdgeInsets.symmetric(
  //                     horizontal: MediaQuery.of(context).size.width * 0.02),
  //                 alignLabelWithHint: true,
  //                 // hintText: widget.hint.toLowerCase(),
  //                 hintText: "Number of Required Login".toLowerCase(),
  //                 hintFadeDuration: const Duration(milliseconds: 500),
  //                 hintStyle: TextStyle(
  //                     color: Colors.white.withOpacity(0.1), fontSize: 15),
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: BorderSide.none),
  //                 focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: const BorderSide(color: Colors.white)),
  //                 errorBorder: UnderlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide:
  //                         BorderSide(color: Colors.red.withOpacity(0.8))),
  //                 enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide:
  //                         BorderSide(color: Colors.black.withOpacity(0.3))),
  //                 focusedErrorBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                     borderSide: const BorderSide(color: Colors.white)),
  //                 // labelText: widget.hint,
  //                 labelText: "Number of Required Login",
  //                 labelStyle: TextStyle(
  //                     color: Colors.white.withOpacity(0.65), fontSize: 15),
  //                 filled: true,
  //                 fillColor: Colors.black.withOpacity(0.3)),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // Widget postPaidArrangementRequired() {
  //   return Consumer<RegisterSponsorProvider>(
  //     builder: (context, providerValue, Widget? value) {
  //       return SizedBox(
  //         width: 295,
  //         child: DropdownButtonFormField(
  //           items: const [
  //             DropdownMenuItem(
  //               value: 'Yes',
  //               child: Text(
  //                 "Yes",
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               value: 'No',
  //               child: Text(
  //                 "No",
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             )
  //           ],
  //           onChanged: (value) {
  //             providerValue.postPaidArrangementRequired(value);
  //           },
  //           validator: (value) {
  //             if (value != null && value.isNotEmpty) {
  //               return null;
  //             } else {
  //               return "Select Field";
  //               // return null;
  //             }
  //           },
  //           padding: EdgeInsets.zero,
  //           isExpanded: true,
  //           alignment: Alignment.center,
  //           dropdownColor: Colors.black.withOpacity(0.65),
  //           focusColor: Colors.black,
  //           icon: const Icon(
  //             Icons.arrow_drop_down,
  //             color: Colors.white,
  //           ),
  //           decoration: InputDecoration(
  //               errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
  //               contentPadding: EdgeInsets.symmetric(
  //                   horizontal: MediaQuery.of(context).size.width * 0.02),
  //               alignLabelWithHint: true,
  //               // hintText: widget.hint.toLowerCase(),
  //               hintText: "Postpaid Arrangement Required".toLowerCase(),
  //               hintFadeDuration: const Duration(milliseconds: 500),
  //               hintStyle: TextStyle(
  //                   color: Colors.white.withOpacity(0.1), fontSize: 15),
  //               border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                   borderSide: BorderSide.none),
  //               focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                   borderSide: const BorderSide(color: Colors.white)),
  //               errorBorder: UnderlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                   borderSide: BorderSide(color: Colors.red.withOpacity(0.8))),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                   borderSide:
  //                       BorderSide(color: Colors.black.withOpacity(0.3))),
  //               focusedErrorBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                   borderSide: const BorderSide(color: Colors.white)),
  //               // labelText: widget.hint,
  //               labelText: "Postpaid Arrangement Required",
  //               labelStyle: TextStyle(
  //                   color: Colors.white.withOpacity(0.65), fontSize: 15),
  //               filled: true,
  //               fillColor: Colors.black.withOpacity(0.3)),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget addressProofSelector() {
  //   return Consumer<RegisterSponsorProvider>(
  //     builder: (context, providerValue, Widget? value) {
  //       return GestureDetector(
  //         onTap: () async {
  //           File? file = await _mediaServices.getImageFromGallery();
  //           if (file != null) {
  //             providerValue.addressProof(file);
  //             setState(() {
  //               selectedAddressProof = file;
  //             });
  //           }
  //         },
  //         child: CircleAvatar(
  //           radius: 30,
  //           backgroundImage: selectedAddressProof != null
  //               ? FileImage(selectedAddressProof!)
  //               : const NetworkImage(Constants.PLACEHOLDER_PFP) as ImageProvider,
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget panProofSelector() {
  //   return Consumer<RegisterSponsorProvider>(
  //       builder: (context, providerValue, Widget? value) {
  //     return GestureDetector(
  //       onTap: () async {
  //         File? file = await _mediaServices.getImageFromGallery();
  //         if (file != null) {
  //           providerValue.panCard(file);
  //           setState(() {
  //             selectedPanProof = file;
  //           });
  //         }
  //       },
  //       child: CircleAvatar(
  //         radius: 30,
  //         backgroundImage: selectedPanProof != null
  //             ? FileImage(selectedPanProof!)
  //             : const NetworkImage(Constants.PLACEHOLDER_PFP) as ImageProvider,
  //       ),
  //     );
  //   });
  // }

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
            _firstNameError = ErrorText.getNameError(name: value!);
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
      hintText: "Firm Type",
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
        _firmTypeController.text = value.toString();
        FocusScope.of(context).requestFocus(_firstNameFocusNode);
      },
      dropdownListData: const [
        'Proprietor',
        'Director',
        'Authorized Person',
      ],
      hintText: "Designation",
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

  //*-----Multiple Login Required Field------*
  Widget _multipleLoginRequiredField() {
    return DependentDropdown(
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
      onChanged: (value) {
        _postPaidArrangementController.text = value.toString();
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      dropdownListData: const ['No', 'Yes'],
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
      nextFocusNode: _passwordFocusNode,
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

  //*-----Submit Button------*
  Widget _submitButton() {
    return  CustomButton(
        buttonName: "Submit",
        isLoading: false,
        isGradient: true,
        onTap: () {
          debugPrint('Firm Name: ${_firmNameController.text}');
          debugPrint('Firm Type: ${_firmTypeController.text}');
          debugPrint('Company: ${_companyController.text}');
          debugPrint('GST Number: ${_gstNumberController.text}');
          debugPrint('Designation: ${_designationController.text}');
          debugPrint('Proprietor: ${_proprietorController.text}');
          debugPrint('First Name: ${_firstNameController.text}');
          debugPrint('Last Name: ${_lastNameController.text}');
          debugPrint('Username: ${_usernameController.text}');
          debugPrint('Country Code: ${_countryCodeController.text}');
          debugPrint('Phone Number: ${_phoneNumberController.text}');
          debugPrint('Business Category: ${_businessCategoryController.text}');
          debugPrint('Business Sub-Category: ${_businessSubCategoryController.text}');
          debugPrint('Registration Fees: ${_registrationFeesController.text}');
          debugPrint('Multiple Login Required: ${_multipleLoginRequiredController.text}');
          debugPrint('Number of Login Required: ${_numberOfLoginRequiredController.text}');
          debugPrint('Post Paid Arrangement: ${_postPaidArrangementController.text}');
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
          debugPrint('No Of Logins: ${_noOfLoginsController.text}');


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
