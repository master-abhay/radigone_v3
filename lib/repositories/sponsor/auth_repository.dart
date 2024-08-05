import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';

class SponsorAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();



  Future<LoginSponsorModel> sponsorLoginApi({required dynamic header,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices( url: AppUrls.sponsorLoginUrl.toString(),headers: header,body:  body);
      return LoginSponsorModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> sponsorRegisterApi({
  //   required Map<String, String> fields,
  //   required  List<http.MultipartFile> files,
  //   required  Map<String, String> headers,
  // }) async {
  //   try {
  //     dynamic response =  await _apiServices.getMultipartApiServices(url: AppUrls.sponsorRegisterUrl, field: fields, file: files, header: headers);
  //
  //     return response;
  //   } catch (e) {
  //     debugPrint("Error thrown ........");
  //     debugPrint(e.toString());
  //     throw e;
  //   }
  // }
  Future<dynamic> sponsorRegisterApi({
    required Map<String, String> fields,
    required  List<http.MultipartFile> files,
    required  Map<String, String> headers,
  }) async {
    try {
      dynamic response =  await _apiServices.getMultipartApiServices(method: 'POST',url: AppUrls.sponsorRegisterUrl, fields: fields, files: files, headers: headers);

      return response;
    } catch (e) {
      debugPrint("Error thrown ........");
      debugPrint(e.toString());
      throw e;
    }
  }


  Future<dynamic> sponsorForgotPasswordApi({required dynamic headers,required dynamic body}) async {

  }

  Future<dynamic> sponsorOtpVerificationApi({required dynamic headers,required dynamic body}) async {

  }

  Future<dynamic> sponsorResetPasswordApi({required dynamic headers,required dynamic body}) async {

  }

}