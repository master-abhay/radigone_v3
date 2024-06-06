import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:radigone_v3/data/network/BaseApiServices.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices({required url, required headers}) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }




  // @override
  // Future getPostApiBodyServices({required url,required body}) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(Uri.parse(url), body: body)
  //         .timeout(const Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException("No Internet Connection");
  //   }
  //
  //   return responseJson;
  // }

  // @override
  // Future getPostApiHeadersServices({required url,required headers}) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http
  //         .post(Uri.parse(url), headers: headers)
  //         .timeout(const Duration(seconds: 10));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException("No Internet Connection");
  //   }
  //
  //   return responseJson;
  // }

  @override
  Future getPostApiHeadersBodyServices({required url,required headers,required body}) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getMultipartApiServices({required String url, required Map<String, String> field, required List<MultipartFile> file, required Map<String, String> header}) async{
      // Similar checks for other arguments (fields, files, headers)

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(header);
      if(kDebugMode){
        print('Headers Added');

      }

      request.fields.addAll(field);
      if(kDebugMode){
        print('Fields Added');

      }

      request.files.addAll(file);
      if(kDebugMode){
        print('Files Added');
      }

      try {
        final response = await request.send().timeout(const Duration(seconds: 30));
        if(kDebugMode){
          print('----------printing the response---->>>>>>$response');
        }
        final responseString = await response.stream.bytesToString();
        // Assuming returnResponse function is fixed to handle http.Response
        if(kDebugMode){
          print('-------------->>>>>>>>printing the responseString$responseString');
        }
        return returnResponse(http.Response(responseString, response.statusCode));
      } on SocketException {
        throw FetchDataException("No Internet Connection");
      } on FormatException {
        throw const FormatException("Format Exception: Response received is not of Correct Type to Decode using JsonDecode");
      }
  }
}



dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      try {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      } catch (e) {
        throw FormatException('Failed to parse response as JSON: ${response.body}');
      }

    case 400:
      throw BadRequestException(
          "${jsonDecode(response.body)['message']}");
    case 401:
      throw UnAuthorizedException(
          "${jsonDecode(response.body)['message']}");
    case 404:
      throw UserNotFoundException(
          "${jsonDecode(response.body)['message']}");
    case 500:
      throw InternalServerErrorException(
          "${jsonDecode(response.body)['message']}");
    default:
      throw FetchDataException(
          'Error occurred while communicating with server ' +
              'with status code' +
              response.statusCode.toString());
  }
}