import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/user_models/profile_user.dart';

import '../../data/network/BaseApiServices.dart';
import '../../resources/app_urls.dart';

class UserProfileRepository{


  final BaseApiServices _apiServices = NetworkApiServices();

  Future<UserProfileInformation> userProfileApi(dynamic headers) async {
    try {
      dynamic response =
      await _apiServices.getGetApiServices(AppUrls.userProfileUrl, headers);
      return response = UserProfileInformation.fromJson(response['data']);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userProfileUpdateApi(dynamic headers, dynamic body) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersBodyServices(
          AppUrls.userProfileUpdateUrl, headers, body);
      return response;
    } catch (e) {
      throw e;
    }
  }



}