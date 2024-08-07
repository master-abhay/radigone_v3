import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';
import '../../models/agent_models/authentication_models/agent_login_model.dart';
import '../../models/common/registration_fees_model.dart';
import '../../resources/app_urls.dart';

class AgentAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();


  //*------get Agent Registration Fees------*
  Future<RegistrationFeesModel> getRegistrationFees({required dynamic headers}) async {
    try {
      dynamic response =
      await _apiServices.getGetApiServices(url: AppUrls.agentRegistrationFees, headers: null,);
      return RegistrationFeesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AgentLoginModel> agentLoginApi(
      {required dynamic header, required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiServices(
          url: AppUrls.agentLoginUrl, headers: header, body: body);
      return AgentLoginModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  Future<dynamic> agentForgotPasswordApi({required dynamic headers,required dynamic body}) async {

  }

  Future<dynamic> agentOtpVerificationApi({required dynamic headers,required dynamic body}) async {

  }

  Future<dynamic> agentResetPasswordApi({required dynamic headers,required dynamic body}) async {

  }

}