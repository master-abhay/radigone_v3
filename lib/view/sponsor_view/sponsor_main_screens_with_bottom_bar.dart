import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view/sponsor_view/profile/sponser_profile_view.dart';
import 'package:radigone_v3/view/sponsor_view/sponsor_side_menubar.dart';
import 'package:radigone_v3/view_model/services/auth_services.dart';

import '../../resources/colors.dart';
import '../../resources/components/app_bar/custom_app_bar.dart';
import '../../utils/constants.dart';
import 'deposit/sponsor_deposit_view.dart';
import 'history/sponsor_history_view.dart';
import 'home/sponser_home_view.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        gradient: MyColorScheme.bottomNavigationBar,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            index: 0,
            icon: "images/homeIcon.svg",
            label: "Home",
          ),
          _buildNavItem(
            context,
            index: 1,
            icon: "images/coupons.svg",
            label: "Coupons",
          ),
          _buildNavItem(
            context,
            index: 2,
            icon: "images/history.svg",
            label: "History",
          ),
          _buildNavItem(
            context,
            index: 3,
            icon: "images/profile.svg",
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String icon,
    required String label,
  }) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width * .25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? Colors.yellow : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.yellow : Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorMainView extends StatefulWidget {
  const SponsorMainView({super.key});

  @override
  State<SponsorMainView> createState() => _SponsorMainViewState();
}

class _SponsorMainViewState extends State<SponsorMainView> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  List<dynamic> screens = [
    const SponsorHomeView(),
    const SponsorDepositView(),
    const SponsorHistoryView(),
    const SponsorProfileView()
  ];

  late AuthService _authService;
  String? sponsorName, sponsorEmail, sponsorImageLink;

  Future<void> _initializeValues() async {
    sponsorName = await _authService.getSponsorName();
    sponsorEmail = await _authService.getSponsorEmail();
    sponsorImageLink =
        await _authService.getSponsorImageLink() ?? Constants.PLACEHOLDER_PFP;
  }

  @override
  void initState() {
    super.initState();

    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();
    _initializeValues();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? CustomAppBar(
              height: 0,
              openDrawer: () {
                _drawerKey.currentState!.openDrawer();
              })
          : null,
      key: _drawerKey,
      extendBody: true,
      drawer: Drawer(
        child: FutureBuilder(
          future: _initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const SponsorSideBarView(
                sponsorName: "Fetching..",
                sponsorEmail: "Fetching..",
                sponsorProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              return const SponsorSideBarView(
                sponsorName: "Error..",
                sponsorEmail: "Error..",
                sponsorProfileImageLink: null,
              );
            }
            return SponsorSideBarView(
              sponsorName: 'Hi $sponsorName', sponsorEmail: sponsorEmail,
              // sponsorProfileImageLink: sponsorImageLink,
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return screens[currentIndex];
  }
}
