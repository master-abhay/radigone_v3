import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../sponsor_view_model/sponsor_profile_information_viewModel.dart';
import '../user_view_model/dashboard_ads_list_view_model.dart';
import '../user_view_model/profile_view_model.dart';
import '../user_view_model/radigonePoint_view_model.dart';
import '../user_view_model/user_points_view_model.dart';
import 'auth_services.dart';
import 'navigation_services.dart';

class SplashServices {
  late NavigationServices _navigationServices;
  late AuthService _authService;

  SplashServices() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _authService = getIt.get<AuthService>();
  }

  Future<void> checkUserAuthentication(BuildContext context) async {
    final userToken = await _authService.getUserToken();
    final sponsorToken = await _authService.getSponsorToken();
    final agentToken = await _authService.getAgentToken();

    if (userToken != null && userToken.isNotEmpty) {
      await _initializeUserData(context);
      _navigationServices.pushReplacementNamed('/userMainView');
    } else if (sponsorToken != null && sponsorToken.isNotEmpty) {
      await _initializeSponsorData(context);
      _navigationServices.pushReplacementNamed('/sponsorMainView');
    } else if (agentToken != null && agentToken.isNotEmpty) {
      await _initializeAgentData(context);
      _navigationServices.pushReplacementNamed('/agentMainView');
    } else {
      _navigationServices.pushReplacementNamed('/loginRegistration');
    }
  }

  //<--------------------------------------------------------------User Initial Data start------------------------------------------------>
  Future<void> _initializeUserData(BuildContext context) async {
    await Provider.of<DashboardUserProvider>(context, listen: false)
        .loginUserDashboard(context);

    await Provider.of<UserRadigonePointViewModel>(context, listen: false)
        .fetchUserRadigonePoint(context);

    await Provider.of<UserPointsViewModel>(context, listen: false)
        .fetchUserPoints(context);

    await Provider.of<UserProfileInformationProvider>(context, listen: false)
        .profileInformation(context);
  }

//<----------------------------------------------------------------User Initial Data End---------------------------------------------------------------->

  //<--------------------------------------------------------------Sponsor Initial Data start------------------------------------------------>
  Future<void> _initializeSponsorData(BuildContext context) async {
    await Provider.of<SponsorProfileInformationViewModel>(context,
            listen: false)
        .fetchProfileInformation(context);
  }

//<----------------------------------------------------------------Sponsor Initial Data End---------------------------------------------------------------->

// <----------------------------------------------------------------Agent Initial Data Start---------------------------------------------------------------->
  Future<void> _initializeAgentData(BuildContext context) async {}
//<----------------------------------------------------------------Agent Initial Data End---------------------------------------------------------------->>
}
