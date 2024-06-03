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
  // Future getMultipartApiServices(dynamic url, Map<String, String>? fields, List<http.MultipartFile>? files) async {
  //   dynamic responseJson;
  //
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //
  //   // Add fields
  //   if (fields != null) {
  //     request.fields.addAll(fields);
  //   }
  //
  //   // Add files
  //   if (files != null) {
  //     request.files.addAll(files);
  //   }
  //
  //   try {
  //     final response = await request.send().timeout(const Duration(seconds: 30));
  //     final responseString = await response.stream.bytesToString();
  //     responseJson = returnResponse(http.Response(responseString, response.statusCode));
  //   } on SocketException {
  //     throw FetchDataException("No Internet Connection");
  //   }
  //
  //   return responseJson;
  // }

  // @override
  // Future<dynamic> getMultipartApiServices({
  //   required String url,
  //  required Map<String, String> fields,
  //   required  List<http.MultipartFile> files,
  //   required  Map<String, String> headers,
  // }) async {
  //  print(url);
  //
  //   // Similar checks for other arguments (fields, files, headers)
  //
  //   final request = http.MultipartRequest('POST', Uri.parse(url));
  //
  //   request.headers.addAll(headers);
  //   print('Headers Added');
  //
  //   request.fields.addAll(fields);
  //   print('Fields Added');
  //
  //   request.files.addAll(files);
  //   print('Files Added');
  //
  //   try {
  //     final response = await request.send().timeout(const Duration(seconds: 30));
  //     print('----------printing the response---->>>>>>$response');
  //     final responseString = await response.stream.bytesToString();
  //     // Assuming returnResponse function is fixed to handle http.Response
  //     print('-------------->>>>>>>>printing the responseString$responseString');
  //     return returnResponse(http.Response(responseString, response.statusCode));
  //   } on SocketException {
  //     throw FetchDataException("No Internet Connection");
  //   }
  // }


  @override
  Future getPostApiBodyServices({required url,required body}) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiHeadersServices({required url,required headers}) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

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
      print('Headers Added');

      request.fields.addAll(field);
      print('Fields Added');

      request.files.addAll(file);
      print('Files Added');

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

// dynamic returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       dynamic responseJson = jsonDecode(response.body);
//       return responseJson;
//     case 401:
//       throw UnAuthorizedException(
//           "Authentication Failed ${jsonDecode(response.body)['message']}");
//     case 500:
//       throw UnAuthorizedException(
//           "Internal Server Error ${jsonDecode(response.body)['message']}");
//     default:
//       throw FetchDataException(
//           'Error occurred while communicating with server ' +
//               'with status code' +
//               response.statusCode.toString());
//   }
// }

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      try {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      } catch (e) {
        throw FormatException('Failed to parse response as JSON: ${response.body}');
      }
    case 401:
      throw UnAuthorizedException(
          "Authentication Failed ${jsonDecode(response.body)['message']}");
    case 500:
      throw UnAuthorizedException(
          "Internal Server Error ${jsonDecode(response.body)['message']}");
    default:
      throw FetchDataException(
          'Error occurred while communicating with server ' +
              'with status code' +
              response.statusCode.toString());
  }
}