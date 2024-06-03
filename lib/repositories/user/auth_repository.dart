import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/resources/app_urls.dart';

class UserAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> userLoginApi(dynamic body) async {
    try {
      dynamic response =
          await _apiServices.getPostApiBodyServices( url:  AppUrls.userLoginUrl,body:  body);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userLogoutApi(dynamic headers) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersServices(url:
          AppUrls.userLogoutUrl,headers:  headers);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userChangePasswordApi(dynamic headers, dynamic body) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersBodyServices(url : AppUrls.userChangePasswordUrl, headers: headers,body:  body);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
