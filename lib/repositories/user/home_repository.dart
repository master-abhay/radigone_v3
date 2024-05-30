import 'package:radigone_v3/models/user_models/dashboard_ads_list_user.dart';

import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';
import '../../resources/app_urls.dart';

class UserHomeRepository{


  final BaseApiServices _apiServices = NetworkApiServices();



  Future<UserDashboard> userDashboardAdsListApi(dynamic headers) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(
          AppUrls.userDashboardAdsUrl, headers);
      return response = UserDashboard.fromJson(response['data']);
    } catch (e) {
      throw e;
    }
  }
}