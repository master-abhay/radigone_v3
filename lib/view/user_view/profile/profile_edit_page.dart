import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/view_model/services/media_services.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_DatePicker.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_dropdown.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../resources/components/custom_phone_input.dart';
import '../../../utils/constants.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/user_view_model/profile_update_view_model.dart';
import '../../../view_model/user_view_model/profile_view_model.dart';

//
enum MaritalStatus { single, married }

//
MaritalStatus? _maritalStatus;

final maritalStatusMap = {
  MaritalStatus.single: "single",
  MaritalStatus.married: "married",
};

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  File? selectedProfileImage;

  //Update user form key:
  final GlobalKey<FormState> _updateUserFormKey = GlobalKey<FormState>();

  //Date picker helper controllers:
  late TextEditingController _dobDateController;
  late TextEditingController _anniversaryDateController;

  //services:
  late NavigationServices _navigationServices;
  late MediaServices _mediaServices;
  late Future<void> _initialization;

  Future<void> _initializeData() async {
    final provider =
        Provider.of<UserProfileInformationProvider>(context, listen: false);
    await provider.setUsername();
    await provider.setPassword();
    await provider.setToken();
    await provider.profileInformation(context);
  }

  @override
  void initState() {
    super.initState();

    final GetIt _getIt = GetIt.instance;

    _navigationServices = _getIt.get<NavigationServices>();
    _mediaServices = _getIt.get<MediaServices>();

    _initialization = _initializeData();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final provider =
    //       Provider.of<UserProfileInformationProvider>(context, listen: false);
    //   await provider.setUsername();
    //   await provider.setPassword();
    //   await provider.setToken();
    //   await provider.profileInformation();
    //
    // }
    // );

    final profileProvider =
        Provider.of<UserProfileInformationProvider>(context, listen: false);
    _dobDateController =
        TextEditingController(text: profileProvider.dob ?? 'YYYY-MM-DD');
    _anniversaryDateController = TextEditingController(
        text: profileProvider.anniversaryDate ?? 'YYYY-MM-DD');
  }

  @override
  void dispose() {
    _dobDateController.dispose();
    _anniversaryDateController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _buildUI(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        //header to display page name:
        const CustomHeaderWithBackButton(title: "Edit Profile"),

        FutureBuilder<void>(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Consumer<UserprofileUpdateProvider>(
                  builder: (context, updateProvider, _) {
                return Consumer<UserProfileInformationProvider>(
                    builder: (context, profileProvider, Widget? child) {
                  if (profileProvider.isLoading || updateProvider.isUpdating) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1.5,
                      ),
                    );
                  } else {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 120, bottom: 50),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //profilePic:
                            profileImage(),

                            //Form
                            profileUpdateForm(),
                          ],
                        ),
                      ),
                    );
                  }
                });
              });
            }
          },
        )
      ],
    );
  }


  Widget profileUpdateForm() {
    return SingleChildScrollView(
      // physics: const ClampingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
      child: Column(
        children: [
          Consumer<UserProfileInformationProvider>(
            builder: (context, profileProvider, _) {
              return Consumer<UserprofileUpdateProvider>(
                builder: (context, updateProvider, Widget? child) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Center(
                          child: Material(
                            color: MyColorScheme.lightGrey0,
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              // height: 500,
                              // padding: EdgeInsets.symmetric(
                              //     vertical: MediaQuery.of(context).size.height * 0.04,
                              //     horizontal:
                              //         MediaQuery.of(context).size.width * 0.05),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Form(
                                key: _updateUserFormKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: 150,
                                              child: CustomFormField(
                                                  hintText: "First name",
                                                  initialValue:
                                                      profileProvider.firstName,
                                                  onSaved: (value) {
                                                    value != null
                                                        ? updateProvider
                                                            .setFirstName(value)
                                                        : null;
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
                                                  initialValue:
                                                      profileProvider.lastName,
                                                  onSaved: (value) {
                                                    value != null
                                                        ? updateProvider
                                                            .setLastName(value)
                                                        : null;
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
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
                                          onSaved: (value) {
                                            // _gender = value as String;
                                            value != null
                                                ? updateProvider
                                                    .setGender(value as String)
                                                : null;
                                          },
                                          hint: profileProvider.gender == ''
                                              ? "Gender"
                                              : profileProvider.gender ??
                                                  "Gender",
                                          onChanged: (value) {
                                            // _gender = value as String;
                                            value != null
                                                ? profileProvider
                                                    .setGender(value as String)
                                                : null;
                                            value != null
                                                ? profileProvider
                                                    .setGender(value as String)
                                                : null;
                                          },
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: CustomDropdown(
                                          dropdownListData: const [
                                            {
                                              'title': 'Single',
                                              'value': 'Single'
                                            },
                                            {
                                              'title': 'Married',
                                              'value': 'Married'
                                            },
                                          ],
                                          hint: profileProvider.marital == ''
                                              ? "Marital"
                                              : profileProvider.marital ??
                                                  "Marital",
                                          onSaved: (value) {
                                            // _gender = value as String;
                                            value != null
                                                ? updateProvider
                                                    .setMarital(value as String)
                                                : null;
                                          },
                                          onChanged: (value) {
                                            // _gender = value as String;
                                            value != null
                                                ? profileProvider
                                                    .setMarital(value as String)
                                                : null;
                                            value != null
                                                ? updateProvider
                                                    .setMarital(value as String)
                                                : null;
                                          },
                                        )),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: CustomPhoneFormInputField(
                                          hintText: "Phone Number",
                                          initialValue:
                                              profileProvider.phoneNumber,
                                          onSaved: (value) {
                                            // setState(() {
                                            //   // _phoneNumber = value!.number;
                                            //   // _countryCode = value.countryCode;
                                            // });
                                            value != null
                                                ? updateProvider.setPhoneNumber(
                                                    value!.number)
                                                : null;
                                          },
                                          onChanged: (value) {
                                            // _phoneNumber = value!.number;
                                            // _countryCode = value.countryCode;
                                            value != null
                                                ? updateProvider.setPhoneNumber(
                                                    value!.number)
                                                : null;
                                          },
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: CustomPhoneFormInputField(
                                          hintText: "Whatsapp Number",
                                          initialValue:
                                              profileProvider.whatsappNumber,
                                          onSaved: (value) {
                                            // setState(() {
                                            //   _whatsappNumber = value!.number;
                                            //
                                            //   print(_whatsappNumber);
                                            // });
                                            value != null
                                                ? updateProvider
                                                    .setWhatsappNumber(
                                                        value!.number)
                                                : null;
                                          },
                                          onChanged: (value) {
                                            // _whatsappNumber = value!.number;
                                            // print(_whatsappNumber);
                                            value != null
                                                ? updateProvider
                                                    .setWhatsappNumber(
                                                        value!.number)
                                                : null;
                                          },
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Email",
                                          initialValue: profileProvider.email,
                                          onSaved: (value) {
                                            // setState(() {
                                            //   _email = value;
                                            // });
                                            value != null
                                                ? updateProvider.setEmail(value)
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    //profession is having problem in backend:
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Profession",
                                          initialValue:
                                              profileProvider.profession,
                                          doValidation: false,
                                          onSaved: (value) {
                                            value != null
                                                ? updateProvider
                                                    .setProfession(value)
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Address",
                                          initialValue: profileProvider.address,
                                          onSaved: (value) {
                                            value != null
                                                ? updateProvider
                                                    .setAddress(value)
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: 150,
                                              child: CustomFormField(
                                                  hintText: "City",
                                                  initialValue:
                                                      profileProvider.city,
                                                  onSaved: (value) {
                                                    value != null
                                                        ? updateProvider
                                                            .setCity(value)
                                                        : null;
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
                                                  initialValue:
                                                      profileProvider.state,
                                                  onSaved: (value) {
                                                    value != null
                                                        ? updateProvider
                                                            .setState(value)
                                                        : null;
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Zip Code",
                                          initialValue: profileProvider.pinCode,
                                          onSaved: (value) {
                                            // setState(() {
                                            //   _email = value;
                                            // });
                                            value != null
                                                ? updateProvider
                                                    .setPinCode(value)
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    //Date of Birth:

                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: 150,
                                              child: CustomDatePicker(
                                                  textEditingController:
                                                      _dobDateController,
                                                  hintText: "Date of Birth",
                                                  // initialValue: profileProvider.dob,
                                                  // initialValue: profileProvider.dob,
                                                  icon: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.grey,
                                                  ),
                                                  doValidation: false,
                                                  onTap: () async {
                                                    DateTime? dob =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1960),
                                                            lastDate: DateTime
                                                                    .now()
                                                                .add(const Duration(
                                                                    days:
                                                                        365)));

                                                    if (dob != null) {
                                                      profileProvider.setDob(
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(dob)
                                                              .toString());
                                                      _dobDateController.text =
                                                          profileProvider.dob!;

                                                      updateProvider.setDob(
                                                          _dobDateController
                                                              .text
                                                              .toString());

                                                      print(
                                                          '--------------------->>>>>>>>>>>${profileProvider.dob.toString()}');
                                                    }
                                                  },
                                                  onSaved: (value) {
                                                    // setState(() {
                                                    //   _email = value;
                                                    // });
                                                    value != null
                                                        ? updateProvider
                                                            .setDob(value)
                                                        : null;
                                                    value != null
                                                        ? updateProvider.setDob(
                                                            _dobDateController
                                                                .text
                                                                .toString())
                                                        : null;
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
                                                child: CustomDropdown(
                                                  dropdownListData: const [
                                                    {
                                                      'title': 'Service-Govt',
                                                      'value': 'Service-Govt'
                                                    },
                                                    {
                                                      'title': 'Job-Private',
                                                      'value': 'Job-Private'
                                                    },
                                                    {
                                                      'title': 'Self-Employed',
                                                      'value': 'Self-Employed'
                                                    },
                                                    {
                                                      'title':
                                                          'Professional-Doctor-Engineer-Charted Accountant-IT Professional',
                                                      'value':
                                                          'Professional-Doctor-Engineer-Charted Accountant-IT Professional'
                                                    },
                                                    {
                                                      'title':
                                                          'Retired Personal',
                                                      'value':
                                                          'Retired Personal'
                                                    },
                                                    {
                                                      'title': 'Home Maker',
                                                      'value': 'Home Maker'
                                                    },
                                                    {
                                                      'title': 'Student',
                                                      'value': 'Student'
                                                    },
                                                    {
                                                      'title': 'Any Other',
                                                      'value': 'Any Other'
                                                    },
                                                  ],
                                                  hint: profileProvider
                                                          .occupation ??
                                                      "Occupation",
                                                  onSaved: (value) {
                                                    // _gender = value as String;

                                                    value != null
                                                        ? updateProvider
                                                            .setOccupation(value
                                                                .toString())
                                                        : null;
                                                  },
                                                  onChanged: (value) {
                                                    // _gender = value as String;
                                                    value != null
                                                        ? updateProvider
                                                            .setOccupation(value
                                                                .toString())
                                                        : null;
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: 150,
                                              child: CustomDatePicker(
                                                  textEditingController:
                                                      _anniversaryDateController,
                                                  hintText: "Anniversary Date",
                                                  // initialValue: profileProvider.dob,
                                                  // initialValue: profileProvider.dob,
                                                  icon: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.grey,
                                                  ),
                                                  doValidation: false,
                                                  onTap: () async {
                                                    DateTime? anniversary =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1960),
                                                            lastDate: DateTime
                                                                    .now()
                                                                .add(const Duration(
                                                                    days:
                                                                        365)));

                                                    if (anniversary != null) {
                                                      profileProvider
                                                          .setAnniversaryDate(
                                                              DateFormat(
                                                                      'yyyy-MM-dd')
                                                                  .format(
                                                                      anniversary)
                                                                  .toString());
                                                      _anniversaryDateController
                                                              .text =
                                                          profileProvider
                                                              .anniversaryDate!;

                                                      updateProvider
                                                          .setAnniversaryDate(
                                                              _anniversaryDateController
                                                                  .text
                                                                  .toString());

                                                      print(
                                                          '--------------------->>>>>>>>>>>${profileProvider.anniversaryDate.toString()}');
                                                    }
                                                  },
                                                  onSaved: (value) {
                                                    // setState(() {
                                                    //   _email = value;
                                                    // });

                                                    value != null
                                                        ? updateProvider
                                                            .setAnniversaryDate(
                                                                value)
                                                        : null;
                                                    value != null
                                                        ? updateProvider
                                                            .setAnniversaryDate(
                                                                _anniversaryDateController
                                                                    .text
                                                                    .toString())
                                                        : null;
                                                  },
                                                  obscureText: false,
                                                  isNumber: false),
                                            ),
                                          ),

                                          //panCardNumber

                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                                width: 150,
                                                child: CustomDropdown(
                                                  dropdownListData: const [
                                                    {
                                                      'title':
                                                          'Up tp Rs 100000',
                                                      'value': 'Up tp Rs 100000'
                                                    },
                                                    {
                                                      'title':
                                                          'Rs 100001-Rs 300000',
                                                      'value':
                                                          'Rs 100001-Rs 300000'
                                                    },
                                                    {
                                                      'title':
                                                          'Rs 300001-Rs 500000',
                                                      'value':
                                                          'Rs 300001-Rs 500000'
                                                    },
                                                    {
                                                      'title':
                                                          'Rs 500001-Rs 750000',
                                                      'value':
                                                          'Rs 500001-Rs 750000'
                                                    },
                                                    {
                                                      'title':
                                                          'Rs 750001-Rs 1000000',
                                                      'value':
                                                          'Rs 750001-Rs 1000000'
                                                    },
                                                    {
                                                      'title': 'Rs 10000000',
                                                      'value': 'Rs 10000000'
                                                    },
                                                  ],
                                                  hint: profileProvider
                                                          .annualIncome ??
                                                      "Annual Income",
                                                  onSaved: (value) {
                                                    // _gender = value as String;
                                                    value != null
                                                        ? updateProvider
                                                            .setAnnualIncome(
                                                                value
                                                                    .toString())
                                                        : null;
                                                  },
                                                  onChanged: (value) {
                                                    // _gender = value as String;
                                                    value != null
                                                        ? updateProvider
                                                            .setAnnualIncome(
                                                                value
                                                                    .toString())
                                                        : null;
                                                  },
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    //Pan Card Number:
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Pan Card No.",
                                          initialValue: profileProvider.pinCode,
                                          doValidation: false,
                                          onSaved: (value) {
                                            value != null
                                                ? updateProvider
                                                    .setPanCardNumber(
                                                        value.toString())
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
//Account Number and Re-Account Number:
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: 150,
                                              child: CustomFormField(
                                                  hintText: "Account number",
                                                  initialValue: profileProvider
                                                          .accountNumber ??
                                                      "Account Number",
                                                  onSaved: (value) {
                                                    updateProvider
                                                        .setAccountNumber(
                                                            value);
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
                                                  hintText: "Re-Account number",
                                                  initialValue: profileProvider
                                                          .reAccountNumber ??
                                                      "Re-Account Number",
                                                  onSaved: (value) {
                                                    updateProvider
                                                        .setReAccountNumber(
                                                            value);
                                                  },
                                                  obscureText: false,
                                                  isNumber: true),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: CustomFormField(
                                          hintText: "Bank IFSC",
                                          initialValue:
                                              profileProvider.bankIfsc,
                                          doValidation: false,
                                          onSaved: (value) {
                                            // setState(() {
                                            //   _email = value;
                                            // });
                                            value != null
                                                ? updateProvider.setBankIfsc(
                                                    value.toString())
                                                : null;
                                          },
                                          obscureText: false,
                                          isNumber: false),
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 240,
                                      child: CustomButton(
                                        buttonName: "Save",
                                        isLoading: false,
                                        isGradient: true,
                                        onTap: () async {
                                          if (_updateUserFormKey.currentState!
                                              .validate()) {
                                            _updateUserFormKey.currentState
                                                ?.save();

                                            updateProvider
                                                .profileUpdate(context);

                                            // Reloading the data:
                                            await _initializeData();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  // Widget profileImage() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 15, bottom: 15),
  //     child: Material(
  //       elevation: 1,
  //       borderRadius: BorderRadius.circular(180),
  //       color: Colors.grey,
  //       child: Container(
  //           width: 80,
  //           height: 80,
  //           decoration: BoxDecoration(
  //             color: Colors.grey,
  //             borderRadius: BorderRadius.circular(180),
  //           ),
  //           child: Image.asset(
  //             "images/profileImage.png",
  //             fit: BoxFit.cover,
  //             errorBuilder: (context, object, stacktrace) {
  //               return Image.network(PLACEHOLDER_PFP, fit: BoxFit.cover);
  //             },
  //           )),
  //     ),
  //   );
  // }

  Widget profileImage() {
    return Consumer<UserProfileInformationProvider>(builder: (context,infoProvider,_){

    return Consumer<UserprofileUpdateProvider>(builder: (context,providerValue,_){

        return GestureDetector(
            onTap: () async {
              File? file = await _mediaServices.getImageFromGallery();
              if (file != null) {
                providerValue.setProfileImage(file);
                setState(() {
                  selectedProfileImage = file;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(180),
                color: Colors.grey,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: selectedProfileImage != null
                        ? FileImage(selectedProfileImage!)
                        // :  NetworkImage(infoProvider.image!) as ImageProvider,
                          :  const NetworkImage(Constants.PLACEHOLDER_PFP) as ImageProvider,

                ),
                ),
              ),
            ));
      });

    });

  }
}
