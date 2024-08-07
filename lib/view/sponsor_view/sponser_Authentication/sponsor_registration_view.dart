import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/view/sponsor_view/sponser_Authentication/sponsor_registration_form_view.dart';

class SponsorRegistrationView extends StatefulWidget {
  const SponsorRegistrationView({super.key});

  @override
  State<SponsorRegistrationView> createState() =>
      _SponsorRegistrationViewState();
}

class _SponsorRegistrationViewState extends State<SponsorRegistrationView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                      tabs: const [
                        Tab(child: Text('Company Sponsor')),
                        Tab(child: Text('Individual Sponsor')),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      SponsorRegistrationFormView(
                        key: PageStorageKey('companySponsor'),
                        isCompanySponsor: true,
                      ),
                      SponsorRegistrationFormView(
                        key: PageStorageKey('individualSponsor'),
                        isCompanySponsor: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}