import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';
import '../../models/agent_models/authentication_models/agent_login_model.dart';
import '../../resources/app_urls.dart';

class AgentAuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();


  Future<AgentLoginModel> agentLoginApi(
      {required dynamic header, required dynamic body}) async {
    try {
      dynamic response =
      await _apiServices.getPostApiHeadersBodyServices(
          url: AppUrls.agentLoginUrl, headers: header, body: body);
      return AgentLoginModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}