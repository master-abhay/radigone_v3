import 'package:radigone_v3/data/network/NetworkApiServices.dart';
import 'package:radigone_v3/models/sponsor_models/sponsor_profile_information_model.dart';

import '../../data/network/BaseApiServices.dart';
import '../../resources/app_urls.dart';

class SponsorProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SponsorProfileInformationModel> sponsorProfileApi(
      {required dynamic headers}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(
          url: AppUrls.sponsorProfileInformationUrl, headers: headers);
      return response =
          SponsorProfileInformationModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
