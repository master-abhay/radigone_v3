import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_auth_viewModel/sponsor_register_viewModel.dart';

import '../../models/common/registration_fees_model.dart';
import '../../models/sponsor_models/sponsor_register_model.dart';

class SponsorAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  //*------get Sponsor Registration Fees------*
  Future<RegistrationFeesModel> getRegistrationFees(
      {required dynamic headers}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(
        url: AppUrls.sponsorRegistrationFees,
        headers: null,
      );
      return RegistrationFeesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<LoginSponsorModel> sponsorLoginApi(
      {required dynamic header, required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(
          url: AppUrls.sponsorLoginUrl.toString(), headers: header, body: body);
      return LoginSponsorModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<SponsorRegisterModel> registerSponsor({
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    required Map<String, String> headers,
  }) async {
    try {
      dynamic response = await _apiServices.getMultipartApiServices(
          method: 'POST',
          url: AppUrls.registerSponsor,
          fields: fields,
          files: files,
          headers: headers);

      return SponsorRegisterModel.fromJson(response);
    } catch (e) {
      debugPrint("Error thrown ........");
      debugPrint(e.toString());
      throw e;
    }
  }

  Future<dynamic> sponsorForgotPasswordApi(
      {required dynamic headers, required dynamic body}) async {}

  Future<dynamic> sponsorOtpVerificationApi(
      {required dynamic headers, required dynamic body}) async {}

  Future<dynamic> sponsorResetPasswordApi(
      {required dynamic headers, required dynamic body}) async {}
}
