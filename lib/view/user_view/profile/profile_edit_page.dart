// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:radigone_v3/resources/components/custom_header.dart';
// import 'package:radigone_v3/view_model/services/media_services.dart';
//
// import '../../../data/response/status.dart';
// import '../../../resources/components/background_designs.dart';
// import '../../../resources/components/custom_DatePicker.dart';
// import '../../../resources/components/custom_button.dart';
// import '../../../resources/components/custom_dropdown.dart';
// import '../../../resources/components/custom_form_field.dart';
// import '../../../resources/components/custom_phone_input.dart';
// import '../../../utils/constants.dart';
// import '../../../view_model/services/navigation_services.dart';
// import '../../../view_model/user_view_model/profile_update_view_model.dart';
// import '../../../view_model/user_view_model/profile_view_model.dart';
//
// class ProfileEditPage extends StatefulWidget {
//   const ProfileEditPage({super.key});
//
//   @override
//   State<ProfileEditPage> createState() => _ProfileEditPageState();
// }
//
// class _ProfileEditPageState extends State<ProfileEditPage> {
//   File? selectedProfileImage;
//
//   //Update user form key:
//   final GlobalKey<FormState> _updateUserFormKey = GlobalKey<FormState>();
//
//   //Date picker helper controllers:
//   late final TextEditingController _dobDateController = TextEditingController();
//   late final TextEditingController _anniversaryDateController =
//       TextEditingController();
//
//   //services:
//   late NavigationServices _navigationServices;
//   late MediaServices _mediaServices;
//
//   Future<void> _initializeData() async {
//     final provider =
//         Provider.of<UserProfileInformationProvider>(context, listen: false);
//     await provider.profileInformation(context);
//
//     //updating the dob and anniversary manual information
//     _dobDateController.text = provider.profileInfo.data?.dob ?? '';
//     _anniversaryDateController.text =
//         provider.profileInfo.data?.anniversaryDate ?? '';
//     setState(() {});
//   }
//
//   //Gender Dropdown List Data:
//   final List _genderDropdownList = const [
//     {'title': 'Male', 'value': 'Male'},
//     {'title': 'Female', 'value': 'Female'},
//     {'title': 'Transgender', 'value': 'Transgender'},
//   ];
//
//   final List _annualIncomeDropdownList = const [
//     {'title': 'Up tp Rs 100000', 'value': 'Up tp Rs 100000'},
//     {'title': 'Rs 100001-Rs 300000', 'value': 'Rs 100001-Rs 300000'},
//     {'title': 'Rs 300001-Rs 500000', 'value': 'Rs 300001-Rs 500000'},
//     {'title': 'Rs 500001-Rs 750000', 'value': 'Rs 500001-Rs 750000'},
//     {'title': 'Rs 750001-Rs 1000000', 'value': 'Rs 750001-Rs 1000000'},
//     {'title': 'Rs 10000000', 'value': 'Rs 10000000'},
//   ];
//
//   final List _maritalStatusDropdownList = const [
//     {'title': 'Single', 'value': 'Single'},
//     {'title': 'Married', 'value': 'Married'},
//   ];
//
//   final List _occupationDropdownList = const [
//     {'title': 'Service-Govt', 'value': 'Service-Govt'},
//     {'title': 'Job-Private', 'value': 'Job-Private'},
//     {'title': 'Self-Employed', 'value': 'Self-Employed'},
//     {
//       'title':
//           'Professional-Doctor-Engineer-Charted Accountant-IT Professional',
//       'value': 'Professional-Doctor-Engineer-Charted Accountant-IT Professional'
//     },
//     {'title': 'Retired Personal', 'value': 'Retired Personal'},
//     {'title': 'Home Maker', 'value': 'Home Maker'},
//     {'title': 'Student', 'value': 'Student'},
//     {'title': 'Any Other', 'value': 'Any Other'},
//   ];
//
//   @override
//   void initState() {
//     final GetIt getIt = GetIt.instance;
//
//     _navigationServices = getIt.get<NavigationServices>();
//     _mediaServices = getIt.get<MediaServices>();
//     _initializeData();
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _dobDateController.dispose();
//     _anniversaryDateController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(),
//     );
//   }
//
//   Widget _buildUI() {
//     return Stack(
//       children: [
//         const LowerBackgroundDesign(),
//         const UpperBackgroundDesign(),
//         Column(
//           children: [
//             const CustomHeaderWithBackButton(title: "Edit Profile"),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Form(
//                     key: _updateUserFormKey,
//                     child: Consumer<UserProfileInformationProvider>(
//                         builder: (context, profile, Widget? child) {
//                       switch (profile.profileInfo.status) {
//                         case Status.LOADING:
//                           return const SizedBox(
//                             height: 500,
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 1.5,
//                               ),
//                             ),
//                           );
//
//                         case Status.ERROR:
//                           return const Padding(
//                             padding: EdgeInsets.only(top: 8, bottom: 8),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 SizedBox(
//                                     height: 300,
//                                     child: Text(
//                                         "Please Check Your Internet Connection"))
//                               ],
//                             ),
//                           );
//
//                         case Status.COMPLETED:
//                           return Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               //Profile Image
//                               profileImage(),
//
//                               const SizedBox(height: 25),
//                               //User First and Last Name:
//                               _firstAndLastNameField(profile: profile),
//                               const SizedBox(height: 10),
//                               //Gender
//                               _genderDropdownField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //Marital Status
//                               _maritalStatusField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //Phone Number
//                               _phoneNumberField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //Whatsapp Number
//                               _whatsappNumberField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //Email Address
//                               _emailAddressField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //Address
//                               _addressField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               //cityAndState
//                               _cityAndStateField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _zipCodeField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _dobField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _occupationField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _anniversaryDateField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _annualIncomeField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _panCardNumberField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _accountNumberField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _reAccountNumberField(profile: profile),
//                               const SizedBox(height: 10),
//
//                               _ifscField(profile: profile),
//                               const SizedBox(height: 20),
//                               _submitButton(profile: profile),
//                               const SizedBox(height: 30),
//                             ],
//                           );
//
//                         case null:
//                           return const Center(
//                             child: Text(
//                                 "Null Values Found. Please contact Support"),
//                           );
//                       }
//                     })),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
//
//   //profile Image Field
//   Widget profileImage() {
//     return Consumer<UserProfileInformationProvider>(
//         builder: (context, infoProvider, _) {
//       return Consumer<UserprofileUpdateProvider>(
//           builder: (context, providerValue, _) {
//         return GestureDetector(
//             onTap: () async {
//               File? file = await _mediaServices.getImageFromGallery();
//               if (file != null) {
//                 providerValue.setProfileImage(file);
//                 setState(() {
//                   selectedProfileImage = file;
//                 });
//               }
//             },
//             child: Material(
//               elevation: 1,
//               borderRadius: BorderRadius.circular(180),
//               color: Colors.grey,
//               child: Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(180),
//                 ),
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: selectedProfileImage != null
//                       ? FileImage(selectedProfileImage!)
//                       // :  NetworkImage(infoProvider.image!) as ImageProvider,
//                       : const NetworkImage(Constants.PLACEHOLDER_PFP)
//                           as ImageProvider,
//                 ),
//               ),
//             ));
//       });
//     });
//   }
//
//   // First and LastName:
//   Widget _firstAndLastNameField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: SizedBox(
//               width: 150,
//               child: CustomFormField(
//                   hintText: "First name",
//                   initialValue: profile.profileInfo.data?.firstname.toString(),
//                   onSaved: (value) {
//                     update.setFirstName(value);
//                   },
//                   obscureText: false,
//                   isNumber: false),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             flex: 2,
//             child: SizedBox(
//               width: 150,
//               child: CustomFormField(
//                   hintText: "Last name",
//                   initialValue: profile.profileInfo.data?.lastname.toString(),
//                   onSaved: (value) {
//                     update.setLastName(value);
//                   },
//                   obscureText: false,
//                   isNumber: false),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //Gender Dropdown:
//   Widget _genderDropdownField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomDropdown(
//           value: (profile.profileInfo.data?.gander == null ||
//                   profile.profileInfo.data!.gander!.isEmpty)
//               ? null
//               : profile.profileInfo.data!.gander.toString(),
//           dropdownListData: _genderDropdownList,
//           onSaved: (value) {
//             update.setGender(value);
//           },
//           hint: "Gender",
//           onChanged: (value) {},
//         ));
//   }
//
//   //marital status:
//   Widget _maritalStatusField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomDropdown(
//           value: (profile.profileInfo.data?.marital == null ||
//                   profile.profileInfo.data!.marital!.isEmpty)
//               ? null
//               : profile.profileInfo.data!.marital.toString(),
//           dropdownListData: _maritalStatusDropdownList,
//           hint: "Marital",
//           onSaved: (value) {
//             update.setMarital(value);
//           },
//           onChanged: (value) {},
//         ));
//   }
//
//   Widget _phoneNumberField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomPhoneFormInputField(
//           initialValue: profile.profileInfo.data?.mobile.toString(),
//           hintText: "Phone Number",
//           onSaved: (value) {
//             update.setPhoneNumber(value!.completeNumber.toString());
//           },
//           onChanged: (value) {},
//         ));
//   }
//
//   Widget _whatsappNumberField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomPhoneFormInputField(
//           initialValue: profile.profileInfo.data?.whatsaap.toString(),
//           hintText: "Whatsapp Number",
//           onSaved: (value) {
//             update.setWhatsappNumber(
//                 value!.countryCode.toString() + value.number.toString());
//           },
//           onChanged: (value) {},
//         ));
//   }
//
//   Widget _emailAddressField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.email.toString(),
//           hintText: "Email",
//           onSaved: (value) {
//             update.setEmail(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _addressField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.address?.address.toString(),
//           hintText: "Address",
//           onSaved: (value) {
//             update.setAddress(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _cityAndStateField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: SizedBox(
//               width: 150,
//               child: CustomFormField(
//                   initialValue:
//                       profile.profileInfo.data?.address?.city.toString(),
//                   hintText: "City",
//                   onSaved: (value) {
//                     update.setCity(value);
//                   },
//                   obscureText: false,
//                   isNumber: false),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             flex: 2,
//             child: SizedBox(
//               width: 150,
//               child: CustomFormField(
//                   initialValue:
//                       profile.profileInfo.data?.address?.state.toString(),
//                   hintText: "State",
//                   onSaved: (value) {
//                     update.setState(value);
//                   },
//                   obscureText: false,
//                   isNumber: false),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _zipCodeField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.address?.zip.toString(),
//           hintText: "Zip Code",
//           onSaved: (value) {
//             update.setPinCode(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _dobField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomDatePicker(
//           textEditingController: _dobDateController,
//           hintText: "Date of Birth",
//           // initialValue: profile.profileInfo.data?.dob.toString(),
//           icon: const Icon(
//             Icons.calendar_month,
//             color: Colors.grey,
//           ),
//           doValidation: false,
//           onTap: () async {
//             DateTime? dob = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(1960),
//                 lastDate: DateTime.now().add(const Duration(days: 365)));
//
//             if (dob != null) {
//               setState(() {
//                 _dobDateController.text =
//                     DateFormat('yyyy-MM-dd').format(dob).toString();
//               });
//               // profileProvider.setDob(
//               //     DateFormat(
//               //         'yyyy-MM-dd')
//               //         .format(dob)
//               //         .toString());
//               // _dobDateController.text =
//               // profileProvider.dob!;
//               //
//               // updateProvider.setDob(
//               //     _dobDateController
//               //         .text
//               //         .toString());
//             }
//           },
//           onSaved: (value) {
//             update.setDob(_dobDateController.text);
//
//             // // setState(() {
//             // //   _email = value;
//             // // });
//             // value != null ? updateProvider.setDob(value) : null;
//             // value != null
//             //     ? updateProvider
//             //         .setDob(_dobDateController.text.toString())
//             //     : null;
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _occupationField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomDropdown(
//           value: (profile.profileInfo.data?.occupation == null ||
//                   profile.profileInfo.data!.occupation!.isEmpty)
//               ? null
//               : profile.profileInfo.data!.occupation.toString(),
//           dropdownListData: _occupationDropdownList,
//           // hint: profileProvider.occupation ?? "Occupation",
//           onSaved: (value) {
//             update.setOccupation(value);
//             // _gender = value as String;
//             //
//             // value != null
//             //     ? updateProvider.setOccupation(value.toString())
//             //     : null;
//           },
//           onChanged: (value) {
//             // // _gender = value as String;
//             // value != null
//             //     ? updateProvider.setOccupation(value.toString())
//             //     : null;
//           },
//           hint: 'Occupation',
//         ));
//   }
//
//   Widget _anniversaryDateField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomDatePicker(
//           textEditingController: _anniversaryDateController,
//           hintText: "Anniversary Date",
//           // initialValue: profile.profileInfo.data?.anniversaryDate.toString(),
//           // initialValue: profileProvider.dob,
//           icon: const Icon(
//             Icons.calendar_month,
//             color: Colors.grey,
//           ),
//           doValidation: false,
//           onTap: () async {
//             DateTime? anniversary = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(1960),
//                 lastDate: DateTime.now().add(const Duration(days: 365)));
//
//             if (anniversary != null) {
//               setState(() {
//                 _anniversaryDateController.text =
//                     DateFormat("yyyy-MM-dd").format(anniversary).toString();
//               });
//             }
//           },
//           onSaved: (value) {
//             update.setAnniversaryDate(_anniversaryDateController.text);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _annualIncomeField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9,
//         child: CustomDropdown(
//           value: (profile.profileInfo.data?.annualIncome == null ||
//                   profile.profileInfo.data!.annualIncome!.isEmpty)
//               ? null
//               : profile.profileInfo.data!.annualIncome.toString(),
//           dropdownListData: _annualIncomeDropdownList,
//           hint:
//               // profileProvider
//               //     .annualIncome ??
//               "Annual Income",
//           onSaved: (value) {
//             update.setAnnualIncome(value);
//           },
//           onChanged: (value) {
//             debugPrint(value);
//           },
//         ));
//   }
//
//   Widget _panCardNumberField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.pan.toString(),
//           hintText: "Pan Card No.",
//           doValidation: false,
//           onSaved: (value) {
//             update.setPanCardNumber(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _accountNumberField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.accountNumber.toString(),
//           hintText: "Account number",
//           onSaved: (value) {
//             update.setAccountNumber(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _reAccountNumberField(
//       {required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.reAccountNumber.toString(),
//           hintText: "Re-Account number",
//           onSaved: (value) {
//             update.setReAccountNumber(value);
//           },
//           obscureText: false,
//           isNumber: true),
//     );
//   }
//
//   Widget _ifscField({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.9,
//       child: CustomFormField(
//           initialValue: profile.profileInfo.data?.bankIfsc.toString(),
//           hintText: "Bank IFSC",
//           doValidation: false,
//           onSaved: (value) {
//             update.setBankIfsc(value);
//           },
//           obscureText: false,
//           isNumber: false),
//     );
//   }
//
//   Widget _submitButton({required UserProfileInformationProvider profile}) {
//     final update = Provider.of<UserprofileUpdateProvider>(context);
//     return SizedBox(
//       width: 240,
//       child: CustomButton(
//         buttonName: "Save",
//         isLoading: false,
//         isGradient: true,
//         onTap: () async {
//           if (_updateUserFormKey.currentState!.validate()) {
//             _updateUserFormKey.currentState?.save();
//
//             await update.profileUpdate(context);
//
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final provider =
//         Provider.of<UserProfileInformationProvider>(context, listen: false);
//     provider.profileInformation(context);
//   }
// }
