import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/common/business_category_model.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/utils/utils.dart';
import 'package:radigone_v3/view/sponsor_view/sponser_Authentication/company_registration_form_view.dart';
import 'package:radigone_v3/view/sponsor_view/sponser_Authentication/individual_registration_form_view.dart';
import 'package:radigone_v3/view_model/common_viewModel/business_categories_viewModel.dart';

import '../../../utils/constants.dart';
import '../../../view_model/common_viewModel/registration_fees_viewModel.dart';

class SponsorRegistrationView extends StatefulWidget {
  final UserType userType;
  const SponsorRegistrationView({super.key, required this.userType});

  @override
  State<SponsorRegistrationView> createState() =>
      _SponsorRegistrationViewState();
}

class _SponsorRegistrationViewState extends State<SponsorRegistrationView>
    with TickerProviderStateMixin, MediaQueryMixin {
  late TabController _tabController;

  String _registrationFees = '';
  List<Categories> _categories = [];

  Future<void> _initializeData() async {
    try {


      final businessCategoriesProvider =  Provider.of<BusinessCategoryViewModel>(context,listen: false);
      await businessCategoriesProvider.getBusinessCategories();
       _categories = businessCategoriesProvider.businessCategory?.data?.categories ?? [];



      final provider =
          Provider.of<RegistrationFeesViewModel>(context, listen: false);

      if (widget.userType == UserType.sponsor) {
        _registrationFees =
            await _getRegistrationFees(provider.getSponsorRegistrationFees) ??
                '';
      } else if (widget.userType == UserType.agent) {
        _registrationFees =
            await _getRegistrationFees(provider.getAgentRegistrationFees) ?? '';
      }






    } catch (e) {
      // Handle error if needed
      debugPrint(e.toString());
    }
  }

  Future<String?> _getRegistrationFees(
      Future<bool> Function() getFeesMethod) async {
    bool result = await getFeesMethod();
    if (result) {
      final provider =
          Provider.of<RegistrationFeesViewModel>(context, listen: false);
      return provider.registrationFees;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      await _initializeData();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
          ),
          Container(
            width: double.infinity,
            height: screenHeight / 2.6,
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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Material(
                    elevation: 2,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.amber,
                      labelColor: Colors.white,
                      indicatorWeight: 4,
                      indicatorSize: TabBarIndicatorSize.tab,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 2),
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 18),
                      labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      unselectedLabelColor: Colors.grey.shade600,
                      tabs: [
                        Tab(
                            child: Text(widget.userType == UserType.sponsor
                                ? 'Company Sponsor'
                                : 'Company Agent')),
                        Tab(
                            child: Text(widget.userType == UserType.sponsor
                                ? 'Individual Sponsor'
                                : 'Individual Agent')),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<RegistrationFeesViewModel>(
                      builder: (context, registrationFeesViewModel, _) {
                    return Consumer<BusinessCategoryViewModel>(
                      builder: (context,businessCategoryViewModel,_){
                        return  (registrationFeesViewModel.isLoading || businessCategoryViewModel.isLoading)
                            ? const Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.white,
                            ))
                            : TabBarView(
                          controller: _tabController,
                          children: [
                           CompanyRegistrationFormView(
                              key: PageStorageKey(
                                  widget.userType == UserType.sponsor
                                      ? 'companySponsor'
                                      : 'companyAgent'),
                              registrationFees: _registrationFees,
                              userType: widget.userType,
                              businessCategories : _categories,
                            ),
                            IndividualRegistrationFormView(
                              key: PageStorageKey(
                                  widget.userType == UserType.sponsor
                                      ? 'individualSponsor'
                                      : 'individualAgent'),
                              registrationFees: _registrationFees,
                              userType: widget.userType,
                              businessCategories : _categories,
                            ),
                          ],
                        );
                      },
                    );




                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
