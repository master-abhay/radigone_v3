import 'package:radigone_v3/data/network/BaseApiServices.dart';
import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/resources/app_urls.dart';

class CommonRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> logoutApi(
      {required dynamic headers, required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersBodyServices(
          url: AppUrls.logoutUrl, headers: headers, body: body);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
