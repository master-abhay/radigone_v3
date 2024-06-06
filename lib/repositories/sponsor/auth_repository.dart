import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';

class SponsorAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  // Future<LoginSponsorModel> sponsorLoginApi({required dynamic body}) async {
  //   try {
  //     dynamic response =
  //     await _apiServices.getPostApiBodyServices( url:  AppUrls.sponsorLoginUrl,body:  body);
  //     return LoginSponsorModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<LoginSponsorModel> sponsorLoginApi({required dynamic header,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiHeadersBodyServices( url:  AppUrls.sponsorLoginUrl,headers: header,body:  body);
      return LoginSponsorModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}