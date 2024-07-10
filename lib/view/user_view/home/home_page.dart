
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/app_bar/custom_app_bar.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/view/common_view/video_player_view.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/account_Status.dart';
import '../../../resources/components/dashboard_info_container.dart';
import '../../../view_model/services/auth_services.dart';
import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';
import '../user_side_menubar.dart';
import 'Ad_Container.dart';
import 'Ad_Specification_with_download.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late NavigationServices _navigationServices;

class _HomePageState extends State<HomePage> {

  late AuthService _authService;

  String? _userName, _userEmail, _userImageLink;
  Future<void> _initializeValues() async {
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    _userName = await _authService.getUserName();
    _userEmail = await _authService.getUserEmail();
    _userImageLink = await _authService.getUserImageLink();
  }

  @override
  void initState() {
    super.initState();

    // _initialRadigonePointsData = _initializeData();

    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
      drawer: FutureBuilder(
          future: _initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const UserSideBar(
                userName: "Fetching..",
                userEmail: "Fetching..",
                userProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              return const UserSideBar(
                userName: "Error..",
                userEmail: "Error..",
                userProfileImageLink: null,
              );
            }
            return UserSideBar(
              userName: 'Hi $_userName', userEmail: _userEmail,
              // userProfileImageLink: _userImageLink,
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
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              // height: double.infinity,
              // width: double.infinity,
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
                      // const AccountStatus(), //To show App Bar of the app:
                      // headerText(),

                      const SizedBox(
                        height: 10,
                      ),

                      //MainContainers:
                      mainOutlinedContainer(context),

                      //Ads Section:
                      AdsSection(context),
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Total Balance container:
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
                        .userRadigonePointViewModel.data!.user!.balance!);
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_balance.svg"),
                    iconRadius: 180,
                    text: "Total\nBalance",
                    containerValue: "Null");
            }
          }),

          //Completed Survey container:
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.user!.completedSurvey
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Null");
            }
          }),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Total Withdraw container
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.totalWithdraw
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Null");
            }
          }),

          //completed Transaction Container:
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.totalTransaction
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Null");
            }
          }),
        ],
      ),
    ],
  );
}

// Specified Ads Screen
Widget AdsSection(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Showing the Ad_specification: Upcoming specified:
      AdSpecification(
        specificationName: "Upcoming Next",
        onTap: () {},
      ),

      Consumer<DashboardUserProvider>(
          builder: (context, providerValue, Widget? child) {
        switch (providerValue.adsList.status) {
          case Status.LOADING:
            return SizedBox(
                height: MediaQuery.of(context).size.width * 0.60,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ));

          case Status.ERROR:
            return SizedBox(
                height: MediaQuery.of(context).size.width * 0.60,
                child: const Center(
                    child: Text('Check Your Internet Connection')));
          case Status.COMPLETED:
            return SizedBox(
              height: MediaQuery.of(context).size.width * 0.60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: UserDashboardModelObject.userDashboard.data?.length,
                  itemCount: providerValue.adsList.data!.data!.length,
                  itemBuilder: (context, index) {
                    var item = providerValue.adsList.data!.data?[index];
                    return Container(
                        margin: const EdgeInsets.only(right: 13),
                        child: AdContainer(
                          imageUrl: 'https://radigone.com${item?.image}',
                          title: item?.name,
                          subtitle: item?.pName,
                          radigonePoints: item?.pMrp,
                          onTap: () {
                            _navigationServices.push(MaterialPageRoute(
                                builder: (context) => VideoPlayerPage(
                                      videoUrl: item?.videoUrl,
                                      thumbnail:
                                          'https://radigone.com${item?.image}',
                                    )));
                          },
                        ));
                  }),
            );

          case null:
            return const Text('Null Value Returned');
        }
      }),

      // Currently of No Use so Commented.
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      //Showing the Ad_specification: Upcoming specified:
      AdSpecification(
        specificationName: "Birthday Month",
        onTap: () {},
      ),

      SizedBox(
        height: MediaQuery.of(context).size.width * 0.60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(right: 13),
                  child: AdContainer(
                    onTap: () {},
                  ));
            }),
      ),

      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      //Showing the Ad_specification: Anniversary specified:
      AdSpecification(
        specificationName: "Anniversary Month",
        onTap: () {},
      ),

      SizedBox(
        height: MediaQuery.of(context).size.width * 0.60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(right: 13),
                  child: AdContainer(
                    onTap: () {},
                  ));
            }),
      ),
    ],
  );
}
