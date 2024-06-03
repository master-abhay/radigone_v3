// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:provider/provider.dart';
//
// class SponserRegistrationPage extends StatefulWidget {
//   const SponserRegistrationPage({super.key});
//
//   @override
//   State<SponserRegistrationPage> createState() =>
//       _SponserRegistrationPageState();
// }
//
// class _SponserRegistrationPageState extends State<SponserRegistrationPage> {
//   //Going to integrate userRegistration Api:
//
//   bool isLoading = false;
//
//   File? selectedAddressProof;
//
//   File? selectedPanProof;
//
//   bool showSpinner = false;
//
//   // This is created beacuse we have to move to the screens according to the app user.
//   String widgetScenerio = "registration";
//
//   bool _passwordVisibiltyObscure = true;
//   bool _confirmPasswordVisibilityObscure = true;
//
//   final ValueNotifier<bool> _passwordVisibilty = ValueNotifier<bool>(false);
//   final ValueNotifier<bool> _confirmPasswordVisibility = ValueNotifier<bool>(false);
//
//
//   late GlobalKey<FormState> _signUpFormKey;
//   final GetIt _getIt = GetIt.instance;
//
//   late NavigationServices _navigationServices;
//   late MediaServices _mediaServices;
//   late AlertServices _alertServices;
//
//   String _selectedbusinessCategory = 'others';
//   var businessCategoryMap = {
//     'Test11': 'Test11',
//     'Online Services': 'Online Services',
//     'OTT Platform': 'OTT Platform',
//     'Sports': "Sports",
//     'Mobile and Laptops': 'Mobile and Laptops',
//     'Loans': 'Loans',
//     'Tour and Travels': 'Tour and Travels',
//     'Gold and Jewellery': 'Gold and Jewellery',
//     'Clothing': 'Clothing',
//     'Accessories': 'Accessories',
//     'Real Estate': 'Real Estate',
//     'Health': "Health",
//     'others': 'others',
//   };
//
//   final List<String> _businessCategoryList = [];
//
//   String _selectedSubCategory = '';
//   var subCategoryMap = {
//     'test1': 'Test11',
//     'test2': 'Test11',
//     'test3': 'Test11',
//     '123': 'Online Services',
//     "Netflix": 'OTT Platform',
//     "HotStar": 'OTT Platform',
//     "Prime Video": 'OTT Platform',
//     "Other": 'OTT Platform',
//     'Cricket': "Sports",
//     'Football': "Sports",
//     'Tennis': "Sports",
//     'BasketBall': "Sports",
//     'Hockey': "Sports",
//     'other': "Sports",
//     '456': 'Mobile and Laptops',
//     'Home Loan': 'Loans',
//     'Vehicle Loan': 'Loans',
//     "other": 'Loans',
//     'Tour': 'Tour and Travels',
//     'Travels': 'Tour and Travels',
//     'abc': 'Gold and Jewellery',
//     'Men': 'Clothing',
//     'Women': 'Clothing',
//     'Kids': 'Clothing',
//     'Access': 'Accessories',
//     'To': 'Accessories',
//     'Commercial': 'Real Estate',
//     'Residential': 'Real Estate',
//     'Rent': 'Real Estate',
//     'other': 'Real Estate',
//     'Wealth': "Health",
//     'abc': "others"
//   };
//   final List<String> _subCategoryList = [];
//
//   void businessDependentDropdown() {
//     businessCategoryMap.forEach((key, value) {
//       _businessCategoryList.add(key);
//     });
//   }
//
//   void stateDependentDropdown(String? categoryShortName) {
//     _subCategoryList.clear(); // Clear previous states
//     subCategoryMap.forEach((key, value) {
//       if (categoryShortName == value) {
//         _subCategoryList.add(key);
//       }
//     });
//     // Select the first state if available
//     _selectedSubCategory =
//         _subCategoryList.isNotEmpty ? _subCategoryList[0] : '';
//   }
//
//   //Select No of login Required:
//   String _selectedMultipleLoginRequired = 'No';
//   var multipleLoginRequiredMap = {'Yes': 'Yes', 'No': 'No'};
//
//   final List<String> _multipleLoginRequiredList = [];
//
//   void multipleLoginSelectionMapDependentDropdown() {
//     multipleLoginRequiredMap.forEach((key, value) {
//       _multipleLoginRequiredList.add(key);
//     });
//   }
//
//   String? _selectedNumberOfLoginRequired;
//   var numberOfLoginRequiredMap = {
//     '2': 'Yes',
//     '3': 'Yes',
//     '4': 'Yes',
//   };
//
//   final List<String> _numberOfLoginRequiredList = [];
//
//   void numberOfMultipleLoginDependentDropdown(String? selectValues) {
//     _numberOfLoginRequiredList.clear();
//     numberOfLoginRequiredMap.forEach((key, value) {
//       if (selectValues == value) {
//         _numberOfLoginRequiredList.add(key);
//       }
//     });
//
//     if (_numberOfLoginRequiredList.isNotEmpty) {
//       _selectedNumberOfLoginRequired = _numberOfLoginRequiredList[0];
//     } else {
//       _selectedNumberOfLoginRequired = null;
//     }
//   }
//
//   @override
//   void initState() {
//     _navigationServices = _getIt.get<NavigationServices>();
//     _mediaServices = _getIt.get<MediaServices>();
//     _alertServices = _getIt.get<AlertServices>();
//
//     _signUpFormKey = GlobalKey<FormState>();
//     print("SignUpForm global key created");
//
//     super.initState();
//
//     businessDependentDropdown();
//     stateDependentDropdown(businessCategoryMap[_selectedSubCategory]);
//
//     //select Number of login required:
//     multipleLoginSelectionMapDependentDropdown();
//     numberOfMultipleLoginDependentDropdown(_selectedMultipleLoginRequired);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("======================>>>>>>>>>>>>>>>>>>Build");
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: buildUI(),
//     );
//   }
//
//   Widget buildUI() {
//     return Consumer<RegisterSponsorProvider>(
//       builder: (context, providerValue, Widget? child) {
//         return Stack(
//           children: [
//             Container(
//               height: double.infinity,
//               decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
//             ),
//             Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height / 2.6,
//               decoration: const BoxDecoration(
//                   gradient: MyColorScheme.yellowLinearGradient,
//                   borderRadius: BorderRadius.vertical(
//                       bottom: Radius.elliptical(150, 40))),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 35,
//                       child: Image.asset(
//                         "images/splash_logo.png",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "REGISTRATION",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               // physics: const ClampingScrollPhysics(),
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               padding:
//                   EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
//               child: Column(
//                 children: [
//                   SafeArea(
//                     child: Column(
//                       children: [
//                         Container(
//                           // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
//                           child: Center(
//                             child: Material(
//                               color: MyColorScheme.authContainerColor
//                                   .withOpacity(0.8),
//                               borderRadius: BorderRadius.circular(24),
//                               child: Container(
//                                 // height: 500,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical:
//                                         MediaQuery.of(context).size.height *
//                                             0.04,
//                                     horizontal:
//                                         MediaQuery.of(context).size.width *
//                                             0.05),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(24)),
//                                 child: Form(
//                                   key: _signUpFormKey,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         width: 295,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "Firm name",
//                                                     onSaved: (value) {
//                                                       providerValue.firmName(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                   width: 150,
//                                                   child: CustomDropdown(
//                                                     onSaved: (value) {
//                                                       providerValue.firmType(value);
//                                                     },
//                                                     onChanged: (value) {
//                                                       providerValue.firmType(value);
//
//                                                     },
//                                                     dropdownListData: const [
//                                                       {
//                                                         'title': 'Company',
//                                                         'value': 'Company'
//                                                       },
//                                                       {
//                                                         'title':
//                                                             'Private Limited',
//                                                         'value':
//                                                             'Private Limited'
//                                                       },
//                                                       {
//                                                         'title': 'Partnership',
//                                                         'value': 'Partnership'
//                                                       },
//                                                       {
//                                                         'title':
//                                                             'Proprietorship',
//                                                         'value':
//                                                             'Proprietorship'
//                                                       },
//                                                       {
//                                                         'title': 'LLP',
//                                                         'value': 'LLP'
//                                                       },
//                                                       {
//                                                         'title': 'OPC',
//                                                         'value': 'OPC'
//                                                       },
//                                                     ],
//                                                     hint: "Firm Type",
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Gst Number",
//                                             textCapitalization: false,
//                                             onSaved: (value) {
//                                               providerValue.gstNumber(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: false),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                           width: 295,
//                                           child: CustomDropdown(
//                                             onSaved: (value) {
//                                               providerValue.designation(value);
//                                             },
//                                             onChanged: (value) {
//                                               providerValue.designation(value);
//                                             },
//                                             dropdownListData: const [
//                                               {
//                                                 'title': 'Proprietor',
//                                                 'value': 'Proprietor'
//                                               },
//                                               {
//                                                 'title': 'Director',
//                                                 'value': 'Director'
//                                               },
//                                               {
//                                                 'title': 'Authorized Person',
//                                                 'value': 'Authorized Person'
//                                               },
//                                             ],
//                                             hint: "Designation",
//                                           )),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "First Name",
//                                                     onSaved: (value) {
//                                                       providerValue.firstName(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "Last Name",
//                                                     onSaved: (value) {
//                                                       providerValue.lastName(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Username",
//                                             textCapitalization: false,
//                                             onSaved: (value) {
//                                              providerValue.userName(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: false),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                           width: 295,
//                                           child: CustomPhoneFormInputField(
//                                             hintText: "Phone Number",
//                                             onSaved: (value) {
//                                               providerValue.phoneNumber(value!.number);
//                                               providerValue.countryCode(value.countryCode);
//
//                                             },
//                                             onChanged: (value) {
//                                               providerValue.phoneNumber(value!.number);
//                                               providerValue.countryCode(value.countryCode);
//                                             },
//                                           )),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       // business Category: Given Value
//                                       businessCategory(),
//
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       //Registration Fees
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Registration Fees",
//                                             onSaved: (value) {
//                                             providerValue.registrationFees(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: true),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       //Profile Services:
//
//                                       //Multiple Login Required: dropdown
//                                       requireNumberOfLoginDropdowns(),
//
//                                       // PostPaidArrangement
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       postPaidArrangementRequired(),
//
//                                       //Email:
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Email",
//                                             onSaved: (value) {
//                                              providerValue.email(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: false),
//                                       ),
//
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Address",
//                                             onSaved: (value) {
//                                               providerValue.address(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: false),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "City",
//                                                     onSaved: (value) {
//                                                       providerValue.city(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "Pin Code",
//                                                     onSaved: (value) {
//                                                       providerValue.pinCode(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: true),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "State",
//                                                     onSaved: (value) {
//                                                      providerValue.state(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: CustomFormField(
//                                                     hintText: "Country",
//                                                     onSaved: (value) {
//                                                       providerValue.country(value);
//                                                     },
//                                                     obscureText: false,
//                                                     isNumber: false),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       SizedBox(
//                                         width: 295,
//                                         child: CustomFormField(
//                                             hintText: "Pan Number",
//                                             onSaved: (value) {
//                                               providerValue.panNumber(value);
//                                             },
//                                             obscureText: false,
//                                             isNumber: false,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//
//                                       SizedBox(
//                                         width: 295,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.02),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.black
//                                                       .withOpacity(0.3),
//                                                   border: Border.all(
//                                                       color: MyColorScheme
//                                                           .lightGrey3),
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                 ),
//                                                 child: Column(
//                                                   children: [
//                                                     addressProofSelector(),
//                                                     Text(
//                                                       "Address Proof",
//                                                       style: TextStyle(
//                                                           color: Colors.white
//                                                               .withOpacity(
//                                                                   0.65),
//                                                           fontSize: 15),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                 width: 150,
//                                                 child: Container(
//                                                   padding: EdgeInsets.symmetric(
//                                                       vertical:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width *
//                                                               0.02),
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.black
//                                                         .withOpacity(0.3),
//                                                     border: Border.all(
//                                                         color: MyColorScheme
//                                                             .lightGrey3),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                   ),
//                                                   child: Column(
//                                                     children: [
//                                                       panProofSelector(),
//                                                       Text(
//                                                         "Pan Card",
//                                                         style: TextStyle(
//                                                             color: Colors.white
//                                                                 .withOpacity(
//                                                                     0.65),
//                                                             fontSize: 15),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: ValueListenableBuilder(
//                                           valueListenable: _passwordVisibilty,
//                                           builder:
//                                               (context, value, Widget? child) {
//                                             return CustomFormField(
//                                               hintText:
//                                                   "Create 6 digit password",
//                                               textCapitalization: false,
//                                               onSaved: (value) {
//                                                 providerValue.password(value);
//                                               },
//                                               obscureText:
//                                                   _passwordVisibiltyObscure,
//                                               isNumber: false,
//                                               maxLines: 1,
//                                               icon: GestureDetector(
//                                                 onTap: () {
//                                                   _passwordVisibilty.value =
//                                                       !_passwordVisibilty.value;
//                                                   _passwordVisibiltyObscure =
//                                                       !_passwordVisibiltyObscure;
//                                                 },
//                                                 child: _passwordVisibilty.value
//                                                     ? const Icon(
//                                                         Icons.visibility,
//                                                         color: Colors.white,
//                                                       )
//                                                     : const Icon(
//                                                         Icons.visibility_off,
//                                                         color: Colors.white,
//                                                       ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width: 295,
//                                         child: ValueListenableBuilder(
//                                           valueListenable:
//                                               _confirmPasswordVisibility,
//                                           builder:
//                                               (context, value, Widget? child) {
//                                             return CustomFormField(
//                                               hintText: "Confirm password",
//                                               textCapitalization: false,
//                                               onSaved: (value) {
//                                                 providerValue.confirmPassword(value);
//                                               },
//                                               obscureText:
//                                                   _confirmPasswordVisibilityObscure,
//                                               isNumber: false,
//                                               maxLines: 1,
//                                               icon: GestureDetector(
//                                                 onTap: () {
//                                                   _confirmPasswordVisibility
//                                                           .value =
//                                                       !_confirmPasswordVisibility
//                                                           .value;
//                                                   _confirmPasswordVisibilityObscure =
//                                                       !_confirmPasswordVisibilityObscure;
//                                                 },
//                                                 child:
//                                                     _confirmPasswordVisibility
//                                                             .value
//                                                         ? const Icon(
//                                                             Icons.visibility,
//                                                             color: Colors.white,
//                                                           )
//                                                         : const Icon(
//                                                             Icons
//                                                                 .visibility_off,
//                                                             color: Colors.white,
//                                                           ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                       SizedBox(
//                                         width: 240,
//                                         child: CustomButton(
//                                             buttonName: "Sign Up",
//                                             isLoading: isLoading,
//                                             isGradient: true,
//                                             onTap: () async{
//
//                                               if(_signUpFormKey.currentState!.validate()){
//                                                 _signUpFormKey.currentState!.save();
//                                                 await providerValue.SignUpSponsor();
//
//                                               }
//
//
//
//                                             }),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {},
//                                         child: const Text(
//                                           "Have a referral code?",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 12),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget businessCategory() {
//     return Consumer<RegisterSponsorProvider>(
//       builder: (context, providerValue, Widget? value) {
//         return SizedBox(
//           width: 295,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: _selectedbusinessCategory.isNotEmpty
//                     ? _selectedbusinessCategory
//                     : null,
//                 items: _businessCategoryList.map((element) {
//                   return DropdownMenuItem(
//                     value: element,
//                     child: Text(
//                       element,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   providerValue.businessCategory(newValue);
//                   setState(() {
//                     _selectedbusinessCategory = newValue!;
//                     print(
//                         "--------printing the business Category $_selectedbusinessCategory");
//                     stateDependentDropdown(
//                         businessCategoryMap[_selectedbusinessCategory]);
//                   });
//                 },
//                 validator: (value) {
//                   if (value != null && value.isNotEmpty) {
//                     return null;
//                   } else {
//                     return "Select Business Category";
//                     // return null;
//                   }
//                 },
//                 padding: EdgeInsets.zero,
//                 isExpanded: true,
//                 alignment: Alignment.center,
//                 dropdownColor: Colors.black.withOpacity(0.65),
//                 focusColor: Colors.black,
//                 icon: const Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.white,
//                 ),
//                 decoration: InputDecoration(
//                     errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: MediaQuery.of(context).size.width * 0.02),
//                     alignLabelWithHint: true,
//                     // hintText: widget.hint.toLowerCase(),
//                     hintText: "Select Business Category".toLowerCase(),
//                     hintFadeDuration: const Duration(milliseconds: 500),
//                     hintStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.1), fontSize: 15),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(color: Colors.white)),
//                     errorBorder: UnderlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.red.withOpacity(0.8))),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.black.withOpacity(0.3))),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(color: Colors.white)),
//                     // labelText: widget.hint,
//                     labelText: "Select Business category",
//                     labelStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.65), fontSize: 15),
//                     filled: true,
//                     fillColor: Colors.black.withOpacity(0.3)),
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 value: _selectedSubCategory.isNotEmpty
//                     ? _selectedSubCategory
//                     : null,
//                 items: _subCategoryList.map((state) {
//                   return DropdownMenuItem(
//                     value: state,
//                     child: Text(
//                       state,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   providerValue.businessSubCategory(newValue);
//                   setState(() {
//                     _selectedSubCategory = newValue!;
//                     print(
//                         "--------printing the business Category $_selectedSubCategory");
//                   });
//                 }
//
//                ,
//                 padding: EdgeInsets.zero,
//                 isExpanded: true,
//                 alignment: Alignment.center,
//                 dropdownColor: Colors.black.withOpacity(0.65),
//                 focusColor: Colors.black,
//                 icon: const Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.white,
//                 ),
//                 decoration: InputDecoration(
//                     errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: MediaQuery.of(context).size.width * 0.02),
//                     alignLabelWithHint: true,
//                     // hintText: widget.hint.toLowerCase(),
//                     hintText: "Select Business Subcategory".toLowerCase(),
//                     hintFadeDuration: const Duration(milliseconds: 500),
//                     hintStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.1), fontSize: 15),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(color: Colors.white)),
//                     errorBorder: UnderlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.red.withOpacity(0.8))),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide:
//                             BorderSide(color: Colors.black.withOpacity(0.3))),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(color: Colors.white)),
//                     // labelText: widget.hint,
//                     labelText: "Select Business Subcategory",
//                     labelStyle: TextStyle(
//                         color: Colors.white.withOpacity(0.65), fontSize: 15),
//                     filled: true,
//                     fillColor: Colors.black.withOpacity(0.3)),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget requireNumberOfLoginDropdowns() {
//     return Consumer<RegisterSponsorProvider>(
//         builder: (context, providerValue, Widget? value) {
//       return SizedBox(
//         width: 295,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DropdownButtonFormField<String>(
//               value: _selectedMultipleLoginRequired,
//               items: _multipleLoginRequiredList.map((element) {
//                 return DropdownMenuItem(
//                   value: element,
//                   child: Text(
//                     element,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (newValue) {
//                 providerValue.multipleLoginRequired(newValue);
//                 setState(() {
//                   _selectedMultipleLoginRequired = newValue!;
//                   numberOfMultipleLoginDependentDropdown(
//                       multipleLoginRequiredMap[_selectedMultipleLoginRequired]);
//                 });
//               },
//               validator: (value) {
//                 if (value != null && value.isNotEmpty) {
//                   return null;
//                 } else {
//                   return "Select Field";
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
//                   hintText: "Multiple Login Required".toLowerCase(),
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
//                   labelText: "Multiple Login Required",
//                   labelStyle: TextStyle(
//                       color: Colors.white.withOpacity(0.65), fontSize: 15),
//                   filled: true,
//                   fillColor: Colors.black.withOpacity(0.3)),
//             ),
//             const SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: _selectedNumberOfLoginRequired,
//               items: _numberOfLoginRequiredList.map((element) {
//                 return DropdownMenuItem(
//                   value: element,
//                   child: Text(
//                     element,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (newValue) {
//                 providerValue.numberOfLoginRequired(newValue);
//                 setState(() {
//                   _selectedNumberOfLoginRequired = newValue;
//                 });
//               },
//
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
//                   hintText: "Number of Required Login".toLowerCase(),
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
//                   labelText: "Number of Required Login",
//                   labelStyle: TextStyle(
//                       color: Colors.white.withOpacity(0.65), fontSize: 15),
//                   filled: true,
//                   fillColor: Colors.black.withOpacity(0.3)),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget postPaidArrangementRequired() {
//     return Consumer<RegisterSponsorProvider>(
//       builder: (context, providerValue, Widget? value) {
//         return SizedBox(
//           width: 295,
//           child: DropdownButtonFormField(
//             items: const [
//               DropdownMenuItem(
//                 value: 'Yes',
//                 child: Text(
//                   "Yes",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: 'No',
//                 child: Text(
//                   "No",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )
//             ],
//             onChanged: (value) {
//               providerValue.postPaidArrangementRequired(value);
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
//                 hintText: "Postpaid Arrangement Required".toLowerCase(),
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
//                     borderSide: BorderSide(color: Colors.red.withOpacity(0.8))),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide:
//                         BorderSide(color: Colors.black.withOpacity(0.3))),
//                 focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white)),
//                 // labelText: widget.hint,
//                 labelText: "Postpaid Arrangement Required",
//                 labelStyle: TextStyle(
//                     color: Colors.white.withOpacity(0.65), fontSize: 15),
//                 filled: true,
//                 fillColor: Colors.black.withOpacity(0.3)),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget addressProofSelector() {
//     return Consumer<RegisterSponsorProvider>(
//       builder: (context, providerValue, Widget? value) {
//         return GestureDetector(
//           onTap: () async {
//             File? file = await _mediaServices.getImageFromGallery();
//             if (file != null) {
//               providerValue.addressProof(file);
//               setState(() {
//                 selectedAddressProof = file;
//               });
//             }
//           },
//           child: CircleAvatar(
//             radius: 30,
//             backgroundImage: selectedAddressProof != null
//                 ? FileImage(selectedAddressProof!)
//                 : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
//           ),
//         );
//       },
//     );
//   }
//
//   Widget panProofSelector() {
//     return Consumer<RegisterSponsorProvider>(
//         builder: (context, providerValue, Widget? value) {
//       return GestureDetector(
//         onTap: () async {
//           File? file = await _mediaServices.getImageFromGallery();
//           if (file != null) {
//             providerValue.panCard(file);
//             setState(() {
//               selectedPanProof = file;
//             });
//           }
//         },
//         child: CircleAvatar(
//           radius: 30,
//           backgroundImage: selectedPanProof != null
//               ? FileImage(selectedPanProof!)
//               : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
//         ),
//       );
//     });
//   }
// }
