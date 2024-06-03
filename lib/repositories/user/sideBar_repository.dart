import 'package:radigone_v3/models/user_models/side_menu_bar/redeem_radigone_points.dart';
import 'package:radigone_v3/resources/app_urls.dart';

import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';

class userSidebarRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<RedeemRadigonePointsModel> userRedeemRadigonePointsApi(
      {required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiBodyServices(
          url: AppUrls.userRedeemRadigonePointsUrl, body: body);
      return response = RedeemRadigonePointsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
