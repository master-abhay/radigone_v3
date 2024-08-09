import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/common/business_category_model.dart';
import 'package:radigone_v3/models/common/sms_verification_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';

class CommonRepository {
  final BaseApiServices _apiServices = NetworkApiServices();






  //*------Method for Logout-------*
  Future<dynamic> logoutApi(
      {required dynamic headers, required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(
          url: AppUrls.logoutUrl, headers: headers, body: body);
      return response;
    } catch (e) {
      throw e;
    }
  }

  //*------Method SMS Verification-------*
  Future<SmsVerificationModel> smsVerification(
      {required dynamic headers, required dynamic body,required String appUrl}) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(
          url: appUrl, headers: headers, body: body);
      return SmsVerificationModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  //*------Business category dropdown------*
  Future<BusinessCategoryModel> getBusinessCategories(
      {required dynamic headers, required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(
          url: AppUrls.getBusinessCategories, headers: headers);
      return BusinessCategoryModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
