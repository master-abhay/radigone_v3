import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/dashboard_info_container.dart';
import '../../../view_model/services/auth_services.dart';
import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';

class SponsorHomeView extends StatefulWidget {
  const SponsorHomeView({super.key});

  @override
  State<SponsorHomeView> createState() => _SponsorHomeViewState();
}

late NavigationServices _navigationServices;

class _SponsorHomeViewState extends State<SponsorHomeView> {
  //Defining Global Key to open the Drawer:
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late AuthService _authService;
  String? sponsorName, sponsorEmail, sponsorImageLink;

  _initializeValues() async {
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    sponsorName = await _authService.getSponsorName();
    sponsorEmail = await _authService.getSponsorEmail();
    sponsorImageLink = await _authService.getSponsorImageLink();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initializeValues();
    });
  }

  Future<void> _onRefresh() async {
    await Provider.of<DashboardUserProvider>(context, listen: false)
        .loginUserDashboard(context);

    await Provider.of<UserRadigonePointViewModel>(context, listen: false)
        .fetchUserRadigonePoint(context);

    await Provider.of<UserPointsViewModel>(context, listen: false)
        .fetchUserPoints(context);
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
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3.75,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: RefreshIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
                displacement: 40,
                strokeWidth: 1.5,
                onRefresh: _onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //MainContainers:
                      mainOutlinedContainer(context),
                      _monthlyCampaignResponse(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// This is the Main Container which stores the information of the Total Balance and ... Completed Survey etc....
Widget mainOutlinedContainer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 25),
    // height: MediaQuery.sizeOf(context).height * 0.42,
    width: MediaQuery.sizeOf(context).width / 1.15,
    // color: Colors.blue.withOpacity(0.5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Total Balance and Total Deposit
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Total Balance container
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Null");
              }
            }),

            //completed Deposit Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Total Transaction and Total Approved Campaign
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Null");
              }
            }),

            //completed Approved Campaign Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        //Pending Campaign and Rejected Campaign
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Pending Campaign
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Null");
              }
            }),

            //and Rejected Campaign
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        //Bought Views and pending Views
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Total Withdraw container
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Null");
              }
            }),

            //completed Transaction Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        Consumer<UserRadigonePointViewModel>(
            builder: (context, providerValue, _) {
          switch (providerValue.userRadigonePointViewModel.status) {
            case Status.LOADING:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Fetching..");

            case Status.ERROR:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Error");
            case Status.COMPLETED:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: providerValue
                      .userRadigonePointViewModel.data!.totalTransaction
                      .toString());
            case null:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Null");
          }
        }),
      ],
    ),
  );
}

Widget _monthlyCampaignResponse(BuildContext context) {
  return Column(
    children: [
      //Constant Text:
      Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Monthly Campaign Response",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      const SizedBox(
        height: 10,
      ),
      Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.3),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(180),
            ),
          ),
        ),
      )
    ],
  );
}
