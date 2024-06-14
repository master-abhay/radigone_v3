// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:provider/provider.dart';
// import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
// import 'package:radigone_v3/resources/components/custom_header.dart';
// import 'package:radigone_v3/resources/components/custom_phone_input.dart';
// import 'package:radigone_v3/resources/components/custom_text_field.dart';
// import 'package:radigone_v3/view_model/services/media_services.dart';
// import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_login_view_model.dart';
// import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_profile_update_viewModel.dart';
//
// import '../../../resources/colors.dart';
// import '../../../resources/components/background_designs.dart';
// import '../../../resources/components/constants.dart';
// import '../../../view_model/services/navigation_services.dart';
// import '../../../view_model/user_view_model/profile_update_view_model.dart';
// import '../../../view_model/user_view_model/profile_view_model.dart';
//
// class SponsorProfileUpdateView extends StatefulWidget {
//   const SponsorProfileUpdateView({super.key});
//
//   @override
//   State<SponsorProfileUpdateView> createState() =>
//       _SponsorProfileUpdateViewState();
// }
//
// class _SponsorProfileUpdateViewState extends State<SponsorProfileUpdateView> {
// //Profile Image:
//   File? selectedProfileImage;
//
//   //services:
//   late NavigationServices _navigationServices;
//   late MediaServices _mediaServices;
//   late Future<void> _initialization;
//
// // TextEditingControllers
//   late final TextEditingController _firstName;
//   late final TextEditingController _lastName;
//   late final TextEditingController _email;
//   late final TextEditingController _mobileNumber;
//   late final TextEditingController _businessCategory;
//   late final TextEditingController _businessSubcategory;
//   late final TextEditingController _profilingServices;
//   late final TextEditingController _pan;
//   late final TextEditingController _optOutMessage;
//   late final TextEditingController _firmName;
//   late final TextEditingController _firmType;
//   late final TextEditingController _designation;
//   late final TextEditingController _address;
//   late final TextEditingController _city;
//   late final TextEditingController _state;
//   late final TextEditingController _zip;
//
//   // FocusNodes
//   final FocusNode _firstNameFocusNode = FocusNode();
//   final FocusNode _lastNameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _mobileNumberFocusNode = FocusNode();
//   final FocusNode _businessCategoryFocusNode = FocusNode();
//   final FocusNode _businessSubcategoryFocusNode = FocusNode();
//   final FocusNode _profilingServicesFocusNode = FocusNode();
//   final FocusNode _panFocusNode = FocusNode();
//   final FocusNode _optOutMessageFocusNode = FocusNode();
//   final FocusNode _firmNameFocusNode = FocusNode();
//   final FocusNode _firmTypeFocusNode = FocusNode();
//   final FocusNode _designationFocusNode = FocusNode();
//   final FocusNode _addressFocusNode = FocusNode();
//   final FocusNode _cityFocusNode = FocusNode();
//   final FocusNode _stateFocusNode = FocusNode();
//   final FocusNode _zipFocusNode = FocusNode();
//
//   Future<void> _initializeData() async {
//     final provider =
//         Provider.of<FetchSponsorInformation>(context, listen: false);
//     provider.loginSponsor(context);
//
//     if (!provider.isLoading) {
//       LoginSponsorModel value = provider.loginSponsorModel;
//       _firstName.text = value.data?.firstname ?? '';
//       _lastName.text = value.data?.lastname ?? '';
//       _email.text = value.data?.email ?? '';
//       _mobileNumber.text = value.data?.mobile ?? '';
//       _businessCategory.text = value.data?.businessCat.toString() ?? '';
//       _businessSubcategory.text = value.data?.businessSubcat.toString() ?? '';
//       _profilingServices.text = value.data?.profilingService.toString() ?? '';
//       _pan.text = value.data?.pan.toString() ?? '';
//       _optOutMessage.text = value.data?.optOutMsg.toString() ?? '';
//       _firmName.text = value.data?.firmName.toString() ?? '';
//       _firmType.text = value.data?.firmType.toString() ?? '';
//       _designation.text = value.data?.designation.toString() ?? '';
//       _address.text = value.data?.address.toString() ?? '';
//       _city.text = value.data?.address?.city.toString() ?? '';
//       _state.text = value.data?.address?.state.toString() ?? '';
//       _zip.text = value.data?.address?.zip.toString() ?? '';
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final GetIt getIt = GetIt.instance;
//     _navigationServices = getIt.get<NavigationServices>();
//     _mediaServices = getIt.get<MediaServices>();
//
//     _firstName = TextEditingController();
//     _lastName = TextEditingController();
//     _email = TextEditingController();
//     _mobileNumber = TextEditingController();
//     _businessCategory = TextEditingController();
//     _businessSubcategory = TextEditingController();
//     _profilingServices = TextEditingController();
//     _pan = TextEditingController();
//     _optOutMessage = TextEditingController();
//     _firmName = TextEditingController();
//     _firmType = TextEditingController();
//     _designation = TextEditingController();
//     _address = TextEditingController();
//     _city = TextEditingController();
//     _state = TextEditingController();
//     _zip = TextEditingController();
//
//     _initialization = _initializeData();
//   }
//
//   @override
//   void dispose() {
//     _firstName.dispose();
//     _lastName.dispose();
//     _email.dispose();
//     _mobileNumber.dispose();
//     _businessCategory.dispose();
//     _businessSubcategory.dispose();
//     _profilingServices.dispose();
//     _pan.dispose();
//     _optOutMessage.dispose();
//     _firmName.dispose();
//     _firmType.dispose();
//     _designation.dispose();
//     _address.dispose();
//     _city.dispose();
//     _state.dispose();
//     _zip.dispose();
//
//     _firstNameFocusNode.dispose();
//     _lastNameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     _mobileNumberFocusNode.dispose();
//     _businessCategoryFocusNode.dispose();
//     _businessSubcategoryFocusNode.dispose();
//     _profilingServicesFocusNode.dispose();
//     _panFocusNode.dispose();
//     _optOutMessageFocusNode.dispose();
//     _firmNameFocusNode.dispose();
//     _firmTypeFocusNode.dispose();
//     _designationFocusNode.dispose();
//     _addressFocusNode.dispose();
//     _cityFocusNode.dispose();
//     _stateFocusNode.dispose();
//     _zipFocusNode.dispose();
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
//         //header to display page name:
//         const CustomHeaderWithBackButton(title: "Edit Profile"),
//
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           margin: const EdgeInsets.only(top: 120, bottom: 50),
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 //profilePic:
//                 profileImage(),
//
//                 //Form
//                 profileUpdateForm(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget profileUpdateForm() {
//     return SingleChildScrollView(
//       // physics: const ClampingScrollPhysics(),
//       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//       // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
//       child: Column(
//         children: [
//
//           FutureBuilder(
//               future: _initialization,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   print(snapshot.error.toString());
//                   return const Text("Snapshot has error");
//                 }
//
//                 return  Consumer<FetchSponsorInformation>(
//                   builder: (context, provider, _) {
//                     return SafeArea(
//                       child: Column(
//                         children: [
//                           Center(
//                             child: Material(
//                               color: MyColorScheme.lightGrey0,
//                               borderRadius: BorderRadius.circular(24),
//                               child: Container(
//                                   // height: 500,
//                                   // padding: EdgeInsets.symmetric(
//                                   //     vertical: MediaQuery.of(context).size.height * 0.04,
//                                   //     horizontal:
//                                   //         MediaQuery.of(context).size.width * 0.05),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(24)),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.sizeOf(context).width *
//                                                 0.9,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                   width: 150,
//                                                   child: CustomTextField(
//                                                       currentFocusNode:
//                                                           _firstNameFocusNode,
//                                                       nextFocusNode:
//                                                           _lastNameFocusNode,
//                                                       controller: _firstName,
//                                                       obscureText: false,
//                                                       hintText: "First Name",
//                                                       isNumber: false,
//                                                       onChanged: (value) {})),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: SizedBox(
//                                                   width: 150,
//                                                   child: CustomTextField(
//                                                       currentFocusNode:
//                                                           _lastNameFocusNode,
//                                                       nextFocusNode:
//                                                           _emailFocusNode,
//                                                       controller: _lastName,
//                                                       obscureText: false,
//                                                       hintText: "Last Name",
//                                                       isNumber: false,
//                                                       onChanged: (value) {})),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.sizeOf(context).width *
//                                                 0.9,
//                                         child: CustomTextField(
//                                             currentFocusNode: _emailFocusNode,
//                                             controller: _email,
//                                             obscureText: false,
//                                             hintText: "Email",
//                                             isNumber: false,
//                                             onChanged: (value) {}),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.sizeOf(context).width *
//                                                 0.9,
//                                         child: CustomPhoneFormInputField(
//                                           hintText: "Mobile Number",
//                                           onSaved: (value) {},
//                                           onChanged: (value) {},
//                                           initialValue: _mobileNumber.text,
//                                           enabled: _mobileNumber.text.isEmpty
//                                               ? false
//                                               : true,
//                                         ),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }),
//         ],
//       ),
//     );
//   }
//
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
//             child: Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Material(
//                 elevation: 1,
//                 borderRadius: BorderRadius.circular(180),
//                 color: Colors.grey,
//                 child: Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(180),
//                   ),
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundImage: selectedProfileImage != null
//                         ? FileImage(selectedProfileImage!)
//                         // :  NetworkImage(infoProvider.image!) as ImageProvider,
//                         : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
//                   ),
//                 ),
//               ),
//             ));
//       });
//     });
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/resources/components/custom_phone_input.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/services/media_services.dart';


import '../../../resources/colors.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/constants.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_profile_update_viewModel.dart';
import '../../../view_model/user_view_model/profile_update_view_model.dart';
import '../../../view_model/user_view_model/profile_view_model.dart';

class SponsorProfileUpdateView extends StatefulWidget {
  const SponsorProfileUpdateView({Key? key}) : super(key: key);

  @override
  _SponsorProfileUpdateViewState createState() =>
      _SponsorProfileUpdateViewState();
}

class _SponsorProfileUpdateViewState extends State<SponsorProfileUpdateView> {
  //Profile Image:
  File? selectedProfileImage;

  //services:
  late NavigationServices _navigationServices;
  late MediaServices _mediaServices;
  late Future<void> _initialization;

  // TextEditingControllers
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _mobileNumber;
  late final TextEditingController _businessCategory;
  late final TextEditingController _businessSubcategory;
  late final TextEditingController _profilingServices;
  late final TextEditingController _pan;
  late final TextEditingController _optOutMessage;
  late final TextEditingController _firmName;
  late final TextEditingController _firmType;
  late final TextEditingController _designation;
  late final TextEditingController _address;
  late final TextEditingController _city;
  late final TextEditingController _state;
  late final TextEditingController _zip;

  // FocusNodes
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _businessCategoryFocusNode = FocusNode();
  final FocusNode _businessSubcategoryFocusNode = FocusNode();
  final FocusNode _profilingServicesFocusNode = FocusNode();
  final FocusNode _panFocusNode = FocusNode();
  final FocusNode _optOutMessageFocusNode = FocusNode();
  final FocusNode _firmNameFocusNode = FocusNode();
  final FocusNode _firmTypeFocusNode = FocusNode();
  final FocusNode _designationFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _zipFocusNode = FocusNode();

  Future<void> _initializeData() async {
    final provider = Provider.of<FetchSponsorInformation>(context, listen: false);
    await provider.loginSponsor(context);

    if (!provider.isLoading) {
      LoginSponsorModel value = provider.loginSponsorModel;
      _firstName.text = value.data?.firstname ?? '';
      _lastName.text = value.data?.lastname ?? '';
      _email.text = value.data?.email ?? '';
      _mobileNumber.text = value.data?.mobile ?? '';
      _businessCategory.text = value.data?.businessCat.toString() ?? '';
      _businessSubcategory.text = value.data?.businessSubcat.toString() ?? '';
      _profilingServices.text = value.data?.profilingService.toString() ?? '';
      _pan.text = value.data?.pan.toString() ?? '';
      _optOutMessage.text = value.data?.optOutMsg.toString() ?? '';
      _firmName.text = value.data?.firmName.toString() ?? '';
      _firmType.text = value.data?.firmType.toString() ?? '';
      _designation.text = value.data?.designation.toString() ?? '';
      _address.text = value.data?.address.toString() ?? '';
      _city.text = value.data?.address?.city.toString() ?? '';
      _state.text = value.data?.address?.state.toString() ?? '';
      _zip.text = value.data?.address?.zip.toString() ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _mediaServices = getIt.get<MediaServices>();

    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _mobileNumber = TextEditingController();
    _businessCategory = TextEditingController();
    _businessSubcategory = TextEditingController();
    _profilingServices = TextEditingController();
    _pan = TextEditingController();
    _optOutMessage = TextEditingController();
    _firmName = TextEditingController();
    _firmType = TextEditingController();
    _designation = TextEditingController();
    _address = TextEditingController();
    _city = TextEditingController();
    _state = TextEditingController();
    _zip = TextEditingController();

    _initialization = _initializeData();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _mobileNumber.dispose();
    _businessCategory.dispose();
    _businessSubcategory.dispose();
    _profilingServices.dispose();
    _pan.dispose();
    _optOutMessage.dispose();
    _firmName.dispose();
    _firmType.dispose();
    _designation.dispose();
    _address.dispose();
    _city.dispose();
    _state.dispose();
    _zip.dispose();

    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileNumberFocusNode.dispose();
    _businessCategoryFocusNode.dispose();
    _businessSubcategoryFocusNode.dispose();
    _profilingServicesFocusNode.dispose();
    _panFocusNode.dispose();
    _optOutMessageFocusNode.dispose();
    _firmNameFocusNode.dispose();
    _firmTypeFocusNode.dispose();
    _designationFocusNode.dispose();
    _addressFocusNode.dispose();
    _cityFocusNode.dispose();
    _stateFocusNode.dispose();
    _zipFocusNode.dispose();
    super.dispose();
  }

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

        Container(
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
        ),
      ],
    );
  }

  Widget profileUpdateForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {

return Center(child: CircularProgressIndicator());
}
if (snapshot.hasError) {
print(snapshot.error.toString());
return Text("Snapshot has error");
}

return Consumer<FetchSponsorInformation>(
builder: (context, provider, _) {
return SafeArea(
child: Column(
children: [
Center(
child: Material(
color: MyColorScheme.lightGrey0,
borderRadius: BorderRadius.circular(24),
child: Container(
decoration:
BoxDecoration(borderRadius: BorderRadius.circular(24)),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
SizedBox(
width: MediaQuery.of(context).size.width * 0.9,
child: Row(
children: [
Expanded(
flex: 2,
child: SizedBox(
width: 150,
child: CustomTextField(
currentFocusNode: _firstNameFocusNode,
nextFocusNode: _lastNameFocusNode,
controller: _firstName,
obscureText: false,
hintText: "First Name",
isNumber: false,
onChanged: (value) {},
),
),
),
const SizedBox(width: 10),
Expanded(
flex: 2,
child: SizedBox(
width: 150,
child: CustomTextField(
currentFocusNode: _lastNameFocusNode,
nextFocusNode: _emailFocusNode,
controller: _lastName,
obscureText: false,
hintText: "Last Name",
isNumber: false,
onChanged: (value) {},
),
),
),
],
),
),
const SizedBox(height: 10),
SizedBox(
width: MediaQuery.of(context).size.width * 0.9,
child: CustomTextField(
currentFocusNode: _emailFocusNode,
controller: _email,
obscureText: false,
hintText: "Email",
isNumber: false,
onChanged: (value) {},
),
),
const SizedBox(height: 10),
SizedBox(
width: MediaQuery.of(context).size.width * 0.9,
child: CustomPhoneFormInputField(
hintText: "Mobile Number",
onSaved: (value) {},
onChanged: (value) {},
initialValue: _mobileNumber.text,
enabled: _mobileNumber.text.isEmpty ? false : true,
),
),
],
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
),
],
),
);
}

Widget profileImage() {
return Consumer<UserProfileInformationProvider>(
builder: (context, infoProvider, _) {
return Consumer<UserprofileUpdateProvider>(
builder: (context, providerValue, _) {
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
    : const NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
),
),
),
),
);
},
);
},
);
}
}
