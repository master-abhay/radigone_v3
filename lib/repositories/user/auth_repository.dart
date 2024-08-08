import 'package:http/http.dart';
import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/common/user_reset_password_model.dart';
import 'package:radigone_v3/models/common/registration_fees_model.dart';
import 'package:radigone_v3/models/user_models/auth_models/login_viewer_model.dart';
import 'package:radigone_v3/models/user_models/auth_models/viewer_registration_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';
import 'package:radigone_v3/view_model/user_view_model/user_auth_viewModels/viewer_registration_viewModel.dart';

import '../../models/common/user_OTP_verification_model.dart';
import '../../models/common/user_forget_password_model.dart';

class UserAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();




  //*------get Viewer Registration Fees------*
  Future<RegistrationFeesModel> getRegistrationFees({required dynamic headers}) async {
    try {
      dynamic response =
      await _apiServices.getGetApiServices(url: AppUrls.viewerRegistrationFees, headers: null,);
      return RegistrationFeesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  //*------Register User-------*
  Future<ViewerRegistrationModel> viewerRegistration(
      {
        required Map<String, String> headers,
        required Map<String, String> fields,
        required List<MultipartFile> files,
      }) async {
    dynamic response = await _apiServices.getMultipartApiServices(
        method: 'POST',
        url: AppUrls.viewerRegister,
        headers: headers,
        files: files,
        fields: fields);
    return ViewerRegistrationModel.fromJson(response);
  }


  Future<LoginViewerModel> userLoginApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices(url: AppUrls.userLoginUrl, headers: headers, body: body);
      return LoginViewerModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserForgetPasswordModel> userForgotPasswordApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices(url: AppUrls.userForgetPasswordUrl, headers: headers, body: body);
      return UserForgetPasswordModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  Future<UserOtpVerificationModel> userOtpVerificationApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices(url: AppUrls.userVerifyCode, headers: headers, body: body);
      return UserOtpVerificationModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserResetPasswordModel> userResetPasswordApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices(url: AppUrls.userResetPassword, headers: headers, body: body);
      return UserResetPasswordModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  // Future<dynamic> userLogoutApi(dynamic headers) async {
  //   try {
  //     dynamic response = await _apiServices.getPostApiHeadersServices(url:
  //         AppUrls.userLogoutUrl,headers:  headers);
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }


  Future<dynamic> userLogoutApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(url:
      AppUrls.logoutUrl,headers:  headers,body: body);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userChangePasswordApi({required dynamic headers,required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiServices(url : AppUrls.userChangePasswordUrl, headers: headers,body:  body);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
