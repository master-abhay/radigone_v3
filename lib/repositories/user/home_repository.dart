import 'package:flutter/cupertino.dart';
import 'package:radigone_v3/models/user_models/dashboard_ads_list_user.dart';
import 'package:radigone_v3/models/user_models/user_points.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';
import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';
import '../../models/user_models/user_radigone_point-model.dart';
import '../../resources/app_urls.dart';

class UserHomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<UserDashboard> userDashboardAdsListApi({required dynamic headers}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url:
          AppUrls.userDashboardAdsUrl,headers:  headers);
      return response = UserDashboard.fromJson(response['data']);
    } catch (e) {
      throw e;
    }
  }

  Future<UserRadigonePointModel> userRadigonePointApi({required dynamic headers}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url:
          AppUrls.userRadigonePointUrl,headers:  headers);
      return response = UserRadigonePointModel.fromJson(response);
    } catch (e) {

      throw e;
    }
  }


  Future<UserPointsModel> userUserPointsApi(
      {required dynamic header,required dynamic body})async{
    try {
      dynamic response =
      await _apiServices.getPostApiHeadersBodyServices(url: AppUrls.userUserPointUrl,headers:  header,body: body);
      return UserPointsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
