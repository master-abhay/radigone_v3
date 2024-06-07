import 'package:http/http.dart' as http;
import 'package:radigone_v3/models/user_models/side_menu_bar/User_myTickets_model.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/User_transaction_model.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/redeem_radigone_points.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/user_all_ads_preferences_model.dart';
import 'package:radigone_v3/models/user_models/side_menu_bar/user_selected_adsPreferences_model.dart';
import 'package:radigone_v3/resources/app_urls.dart';

import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiServices.dart';

class userSidebarRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  // Future<RedeemRadigonePointsModel> userRedeemRadigonePointsApi(
  //     {required dynamic body}) async {
  //   try {
  //     dynamic response = await _apiServices.getPostApiBodyServices(
  //         url: AppUrls.userRedeemRadigonePointsUrl, body: body);
  //     return response = RedeemRadigonePointsModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<RedeemRadigonePointsModel> userRedeemRadigonePointsApi(
      {required dynamic header,required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersBodyServices(
          url: AppUrls.userRedeemRadigonePointsUrl,headers: header, body: body);
      return response = RedeemRadigonePointsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  Future<UserTransactionModel> userTransactionApi(
      {required dynamic header}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url: AppUrls.userTransactionUrl, headers: header);
      return response = UserTransactionModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userCreateTicket({
    required Map<String, String> fields,
    required  List<http.MultipartFile> files,
    required  Map<String, String> headers,
  }) async {
    try {
      dynamic response =  await _apiServices.getMultipartApiServices(url: AppUrls.userCreateSupportTicketUrl, field: fields, file: files, header: headers);

      return response;
    } catch (e) {
      print("Error thrown ........");
      print(e.toString());
      throw e;
    }
  }

  Future<UserMyTicketsModel> userMyTicketsApi(
      {required dynamic header}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url: AppUrls.userMyTicketsUrl, headers: header);
      return response = UserMyTicketsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> userCloseTicketsApi(
      {required dynamic ticketId,required dynamic header,required dynamic body}) async {
    try {
      dynamic response = await _apiServices.getPostApiHeadersBodyServices(url: AppUrls.userCloseTicketUrl+ticketId, headers: header,body: body);
      return response = response;
    } catch (e) {
      throw e;
    }
  }

  Future<UserAllAdsPreferencesModel> userAllAdsPreferencesApi(
      {required dynamic header}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url: AppUrls.userAllAdsPreferencesUrl, headers: header);
      return response = UserAllAdsPreferencesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  Future<UserSelectedAdsPreferencesModel> userSelectedAdsPreferencesApi(
      {required dynamic header}) async {
    try {
      dynamic response = await _apiServices.getGetApiServices(url: AppUrls.userSelectedAdsPreferencesUrl, headers: header);
      return response = UserSelectedAdsPreferencesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


}
