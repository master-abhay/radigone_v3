import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
import 'package:radigone_v3/resources/components/custom_checkbox_tile.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/resources/components/custom_phone_input.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/services/media_services.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_dependent_dropdown.dart';
import '../../../utils/constants.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_profile_update_viewModel.dart';
import '../../../view_model/user_view_model/profile_update_view_model.dart';
import '../../../view_model/user_view_model/profile_view_model.dart';

class SponsorProfileUpdateView extends StatefulWidget {
  const SponsorProfileUpdateView({super.key});

  @override
  _SponsorProfileUpdateViewState createState() =>
      _SponsorProfileUpdateViewState();
}

class _SponsorProfileUpdateViewState extends State<SponsorProfileUpdateView> {
  bool isFirm = true;

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


  //read Only
   bool _firstNameReadOnly = false;
   bool _lastNameReadOnly = false;
   bool _emailReadOnly = false;
   bool _mobileNumberReadOnly = false;
   bool _businessCategoryReadOnly = false;//Already Managed in the business dropdown custom widget
   bool _businessSubcategoryReadOnly = false;//Already Managed in the business dropdown custom widget
   bool _profilingServicesReadOnly = false;
   bool _panReadOnly = false;
   bool _optOutMessageReadOnly = false;
   bool _firmNameReadOnly = false;
   bool _firmTypeReadOnly = false;
   bool _designationReadOnly = false;
   bool _addressReadOnly = false;
   bool _cityReadOnly = false;
   bool _stateReadOnly = false;
   bool _zipReadOnly = false;

  Future<void> _initializeData() async {
    final provider = Provider.of<FetchSponsorInformation>(context, listen: false);
    await provider.loginSponsor(context);

    if (!provider.isLoading) {
      LoginSponsorModel value = provider.loginSponsorModel;

      _firstName.text = value.data?.firstname ?? '';
      _firstNameReadOnly = _firstName.text.isNotEmpty;

      _lastName.text = value.data?.lastname ?? '';
      _lastNameReadOnly = _lastName.text.isNotEmpty;

      _email.text = value.data?.email ?? '';
      _emailReadOnly = _email.text.isNotEmpty;

      _mobileNumber.text = value.data?.mobile ?? '';
      _mobileNumberReadOnly = _mobileNumber.text.isNotEmpty;
      print('mobile number readonly is :----------->>>>>>>>${_mobileNumberReadOnly.toString()}');

      _businessCategory.text = value.data?.businessCat ?? '';
      _businessCategoryReadOnly = _businessCategory.text.isNotEmpty;

      _businessSubcategory.text = value.data?.businessSubcat ?? '';
      _businessSubcategoryReadOnly = _businessSubcategory.text.isNotEmpty;

      _profilingServices.text = value.data?.profilingService ?? '';
      _profilingServicesReadOnly = _profilingServices.text.isNotEmpty;

      _pan.text = value.data?.pan ?? '';
      _panReadOnly = _pan.text.isNotEmpty;

      _optOutMessage.text = value.data?.optOutMsg ?? '';
      _optOutMessageReadOnly = _optOutMessage.text.isNotEmpty;

      _firmName.text = value.data?.firmName ?? '';
      _firmNameReadOnly = _firmName.text.isNotEmpty;

      _firmType.text = value.data?.firmType ?? '';
      _firmTypeReadOnly = _firmType.text.isNotEmpty;

      _designation.text = value.data?.designation ?? '';
      _designationReadOnly = _designation.text.isNotEmpty;

      _address.text = value.data?.address?.address ?? '';
      _addressReadOnly = _address.text.isNotEmpty;

      _city.text = value.data?.address?.city ?? '';
      _cityReadOnly = _city.text.isNotEmpty;

      _state.text = value.data?.address?.state ?? '';
      _stateReadOnly = _state.text.isNotEmpty;

      _zip.text = value.data?.address?.zip ?? '';
      _zipReadOnly = _zip.text.isNotEmpty;

      setState(() {});  // Update the state to reflect changes in the UI
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
                return const SizedBox(
                    height: 500,
                    width: 100,
                    child:  Center(child: CircularProgressIndicator(strokeWidth: 1.4,color: Colors.white,)));
              }
              if (snapshot.hasError) {
                if(kDebugMode){
                  print(snapshot.error.toString());
                }
                return const Text("Snapshot has error");
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            readOnly: _firstNameReadOnly,
                                            currentFocusNode:
                                                _firstNameFocusNode,
                                            nextFocusNode: _lastNameFocusNode,
                                            controller: _firstName,
                                            obscureText: false,
                                            hintText: "First Name",
                                            onChanged: (value) {
                                              _firstName.text = value!;
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: CustomTextField(
                                            readOnly: _lastNameReadOnly,
                                            currentFocusNode:
                                                _lastNameFocusNode,
                                            nextFocusNode: _emailFocusNode,
                                            controller: _lastName,
                                            obscureText: false,
                                            hintText: "Last Name",
                                            onChanged: (value) {
                                              _lastName.text = value!;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _emailReadOnly,
                                      currentFocusNode: _emailFocusNode,
                                      nextFocusNode: _mobileNumberFocusNode,
                                      controller: _email,
                                      obscureText: false,
                                      hintText: "Email",
                                      onChanged: (value) {
                                        setState(() {
                                          _email.text = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomPhoneFormInputField(
                                      hintText: "Mobile Number",
                                      onSaved: (value) {
                                        setState(() {
                                          _mobileNumber.text =
                                              value!.completeNumber.toString();
                                        });
                                      },
                                      onChanged: (value) {},
                                      initialValue: _mobileNumber.text,
                                      enabled: !_mobileNumberReadOnly,
                                      focusNode: _mobileNumberFocusNode,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  DependentDropdown(
                                    categories: _categories,
                                    // initialBusinessCategory: _selectedBusinessCategory,
                                    initialBusinessCategory:
                                        _businessCategory.text.toString(),
                                    initialSubCategory:
                                        _businessSubcategory.text.toString(),
                                    onBusinessCategoryChanged: (value) {
                                      setState(() {
                                        _businessCategory.text = value!;
                                      });
                                    },
                                    onSubCategoryChanged: (value) {
                                      setState(() {
                                        _businessSubcategory.text = value!;
                                      });
                                    },
                                    onBusinessCategorySaved: (value) {
                                      _businessCategory.text = value!;
                                    },
                                    onSubCategorySaved: (value) {
                                      _businessSubcategory.text = value!;
                                    },
                                    businessCategoryFocusNode:
                                        _businessCategoryFocusNode,
                                    subCategoryFocusNode:
                                        _businessSubcategoryFocusNode,
                                    nextFocusNode: _profilingServicesFocusNode,
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _profilingServicesReadOnly,
                                      currentFocusNode:
                                          _profilingServicesFocusNode,
                                      nextFocusNode: _panFocusNode,
                                      controller: _profilingServices,
                                      obscureText: false,
                                      hintText: "Profiling Services",
                                      onChanged: (value) {
                                        _profilingServices.text = value!;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _panReadOnly,
                                      currentFocusNode: _panFocusNode,
                                      nextFocusNode: _optOutMessageFocusNode,
                                      controller: _pan,
                                      obscureText: false,
                                      hintText: "Pan",
                                      onChanged: (value) {
                                        setState(() {
                                          _pan.text = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _optOutMessageReadOnly,
                                      currentFocusNode: _optOutMessageFocusNode,
                                      nextFocusNode: _firmNameFocusNode,
                                      controller: _optOutMessage,
                                      obscureText: false,
                                      hintText: "Opt Out Message",
                                      onChanged: (value) {
                                        setState(() {
                                          _optOutMessage.text = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomCheckBoxTile(

                                      isChecked: isFirm,
                                      title: "Is It Firm?",
                                      controlAffinity:
                                          ListTileControlAffinity.platform,
                                      onChanged: (value) {
                                        setState(() {
                                          isFirm = value!;
                                        });
                                      }),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Visibility(
                                    visible: isFirm,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: CustomTextField(
                                        readOnly: _firmNameReadOnly,
                                        currentFocusNode: _firmNameFocusNode,
                                        nextFocusNode: _firmTypeFocusNode,
                                        controller: _firmName,
                                        obscureText: false,
                                        hintText: "Firm Name",
                                        onChanged: (value) {
                                          setState(() {
                                            _firmName.text = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: isFirm,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: CustomTextField(
                                        readOnly: _firmTypeReadOnly,
                                        currentFocusNode: _firmTypeFocusNode,
                                        nextFocusNode: _designationFocusNode,
                                        controller: _firmType,
                                        obscureText: false,
                                        hintText: "Firm Type",
                                        onChanged: (value) {
                                          setState(() {
                                            _firmType.text = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: isFirm,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: CustomTextField(
                                        readOnly: _designationReadOnly,
                                        currentFocusNode: _designationFocusNode,
                                        nextFocusNode: _addressFocusNode,
                                        controller: _designation,
                                        obscureText: false,
                                        hintText: "Designation",
                                        onChanged: (value) {
                                          setState(() {
                                            _designation.text = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _addressReadOnly,
                                      currentFocusNode: _addressFocusNode,
                                      nextFocusNode: _cityFocusNode,
                                      controller: _address,
                                      obscureText: false,
                                      hintText: "Address",
                                      onChanged: (value) {
                                        setState(() {
                                          _address.text = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          readOnly: _cityReadOnly,
                                          currentFocusNode: _cityFocusNode,
                                          nextFocusNode: _stateFocusNode,
                                          controller: _city,
                                          obscureText: false,
                                          hintText: "City",
                                          onChanged: (value) {
                                            setState(() {
                                              _city.text = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          readOnly: _stateReadOnly,
                                          currentFocusNode: _stateFocusNode,
                                          nextFocusNode: _zipFocusNode,
                                          controller: _state,
                                          obscureText: false,
                                          hintText: "State",
                                          onChanged: (value) {
                                            setState(() {
                                              _state.text = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CustomTextField(
                                      readOnly: _zipReadOnly,
                                      currentFocusNode: _zipFocusNode,
                                      controller: _zip,
                                      obscureText: false,
                                      hintText: "Zip/Pin Code",
                                      textInputType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          _zip.text = value!;
                                        });
                                      },
                                    ),
                                  )
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
                          : const NetworkImage(Constants.PLACEHOLDER_PFP)
                              as ImageProvider,
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
