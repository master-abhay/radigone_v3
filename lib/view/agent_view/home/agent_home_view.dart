import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_button.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/utils/constants.dart';
import 'package:radigone_v3/view/agent_view/agent_side_menubar.dart';
import 'package:radigone_v3/view_model/agent_view_model/agent_referralLink_viewModel.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/account_Status.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/dashboard_info_container.dart';
import '../../../view_model/services/auth_services.dart';
import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';

class AgentHomeView extends StatefulWidget {
  const AgentHomeView({super.key});

  @override
  State<AgentHomeView> createState() => _AgentHomeViewState();
}

late NavigationServices _navigationServices;

class _AgentHomeViewState extends State<AgentHomeView> {
  //Defining Global Key to open the Drawer:
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late AuthService _authService;
  String? _agentName, _agentEmail, _agentImageLink;

  _initializeValues() async {
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    _agentName = await _authService.getAgentName();
    _agentEmail = await _authService.getAgentEmail();
    _agentImageLink = await _authService.getAgentImageLink() ?? Constants.PLACEHOLDER_PFP;
  }

  @override
  void initState() {
    super.initState();

    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider3 =
          Provider.of<AgentReferralLinkViewModel>(context, listen: false);
      provider3.setTextControllerValue(
          "Providing the Custom Url Herefsdkfjdslf sdfjsdflksdf fj.. ..,//a f");

      final provider =
          Provider.of<DashboardUserProvider>(context, listen: false);
      await provider.setUsername();
      await provider.setPassword();
      await provider.setToken();
      await provider.loginUserDashboard(context);

      final provider1 =
          Provider.of<UserRadigonePointViewModel>(context, listen: false);
      await provider1.setUsername();
      await provider1.setPassword();
      await provider1.setToken();
      await provider1.fetchUserRadigonePoint(context);

      final provider2 =
          Provider.of<UserPointsViewModel>(context, listen: false);
      await provider2.setUsername();
      await provider2.setMobile();
      await provider2.fetchUserPoints(context);
    });
    _initializeValues();
  }

  Future<void> _onRefresh() async {
    // await Future.delayed(const Duration(seconds: 2));

    final provider = Provider.of<DashboardUserProvider>(context, listen: false);
    await provider.setUsername();
    await provider.setPassword();
    await provider.setToken();
    await provider.loginUserDashboard(context);

    final provider1 =
        Provider.of<UserRadigonePointViewModel>(context, listen: false);
    await provider1.setUsername();
    await provider1.setPassword();
    await provider1.setToken();
    await provider1.fetchUserRadigonePoint(context);

    final provider2 = Provider.of<UserPointsViewModel>(context, listen: false);
    await provider2.setUsername();
    await provider2.setMobile();
    await provider2.fetchUserPoints(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      // drawer:  SponsorSideBarView(sponsorName: sponsorName,sponsorEmail: sponsorEmail,sponsorProfileImageLink: sponsorImageLink,),

      drawer: FutureBuilder(
          future: _initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const AgentSideBar(
                agentName: "Fetching..",
                agentEmail: "Fetching..",
                agentProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              return const AgentSideBar(
                agentName: "Error..",
                agentEmail: "Error..",
                agentProfileImageLink: null,
              );
            }
            return AgentSideBar(
              agentName: 'Hi $_agentName',
              agentEmail: _agentEmail,
              agentProfileImageLink: null,
            );
          }),

      body: buildUI(),
    );
  }

  Widget buildUI() {
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
                      //To show the Status of the Account
                      const AccountStatus(), //To
                      // show App Bar of the app:
                      headerText(), //MainContainers:
                      mainOutlinedContainer(context),

                      //Referral Link
                      _referralLinkUI(context),

                      const SizedBox(
                        height: 20,
                      ), //ReferralLinkButtons
                      _referralLinkButtons(context),
                      const SizedBox(
                        height: 20,
                      ),

                      //Monthly Campaign Response:
//Monthly campaign Response
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

  //This is Header with hamburger icon App logo and coins details
  Widget headerText() {
    return Container(
      // color: Colors.purple,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hamburger:
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _drawerKey.currentState!.openDrawer();
                    //implement drawer Functionality:
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    // color:Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset("images/hamburger.svg"),
                  ),
                ),
              ),

              //Radigone Icon:

              Expanded(
                flex: 4,
                child: Image.asset(
                  "images/splash_logo.png",
                  height: 23,
                ),
              ),

              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 12,
                      color: Colors.transparent,
                      width: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 15,
                // alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(right: 10, left: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<UserPointsViewModel>(
                          builder: (context, providerValue, _) {
                        switch (providerValue.userPointsViewModel.status) {
                          case Status.LOADING:
                            return const Text(
                              'Fetching..',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );

                          case Status.ERROR:
                            return const Text(
                              'Error',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                          case Status.COMPLETED:
                            return Text(
                              providerValue.userPointsViewModel.data!.data
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                          case null:
                            return const Text(
                              "Null",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                        }
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(180)),
                child: Image.asset("images/coin.png"),
                // child: SvgPicture.asset("images/coin.svg"),
              )
            ],
          )
        ],
      ),
    );
  }

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
                        text: "Total\nReferrals",
                        containerValue: "Fetching..");

                  case Status.ERROR:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/total_balance.svg"),
                        iconRadius: 180,
                        text: "Total\nReferrals",
                        containerValue: "Error");
                  case Status.COMPLETED:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/total_balance.svg"),
                        iconRadius: 180,
                        text: "Total\nReferrals",
                        containerValue: providerValue
                            .userRadigonePointViewModel.data!.totalWithdraw
                            .toString());
                  case null:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/total_balance.svg"),
                        iconRadius: 180,
                        text: "Total\nReferrals",
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
                        text: "Pending\nSurvey",
                        containerValue: "Fetching..");

                  case Status.ERROR:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Pending\nSurvey",
                        containerValue: "Error");
                  case Status.COMPLETED:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Pending\nSurvey",
                        containerValue: providerValue
                            .userRadigonePointViewModel.data!.totalTransaction
                            .toString());
                  case null:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Pending\nSurvey",
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
                        text: "Total\nEarned",
                        containerValue: "Fetching..");

                  case Status.ERROR:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Total\nEarned",
                        containerValue: "Error");
                  case Status.COMPLETED:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Total\nEarned",
                        containerValue: providerValue
                            .userRadigonePointViewModel.data!.totalTransaction
                            .toString());
                  case null:
                    return DashboardInformationContainer(
                        icon: SvgPicture.asset("images/completed_survey.svg"),
                        iconRadius: 180,
                        text: "Total\nEarned",
                        containerValue: "Null");
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _referralLinkUI(BuildContext context) {
    return Consumer<AgentReferralLinkViewModel>(
        builder: (context, provider, _) {
      return CustomTextField(
          currentFocusNode: provider.currentFocusNode,
          controller: provider.textEditingController,
          obscureText: false,
          hintText: "Referral Link",
          maxLines: 1,
          filled: false,
          autofocus: false,
          onChanged: (value) {
            provider.setTextControllerValue(value!);
          });
    });
  }

  Widget _referralLinkButtons(BuildContext context) {
    return Consumer<AgentReferralLinkViewModel>(
      builder: (context, provider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: CustomButton(
                  buttonName: "Copy Url",
                  isLoading: false,
                  isGradient: true,
                  onTap: () {
                    provider.copyUrl(context);
                  }),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: CustomButton(
                  buttonName: "Share",
                  isLoading: false,
                  isGradient: true,
                  onTap: () {}),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: CustomButton(
                  buttonName: "SMS",
                  isLoading: false,
                  isGradient: true,
                  onTap: () {}),
            )
          ],
        );
      },
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
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
}

// This is the Main Container which stores the information of the Total Balance and ... Completed Survey etc....
