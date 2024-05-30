import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/src/multipart_file.dart';
import 'package:radigone_v3/data/network/BaseApiServices.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices(url, headers) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url),headers: headers).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getMultipartApiServices(
      dynamic url, Map<String, String> fields, List<http.MultipartFile> files) async {
    dynamic responseJson;

    var request = await http.MultipartRequest('POST', Uri.parse(url));

    // Add fields
    request.fields.addAll(fields);

    // Add files
    request.files.addAll(files);

    try {
      final response =
          await request.send().timeout(const Duration(seconds: 30));
      final responseString = await response.stream.bytesToString();
      responseJson =
          returnResponse(http.Response(responseString, response.statusCode));
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiBodyServices(url, body) async{
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: body).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiHeadersServices(url, headers) async{
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),headers: headers).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }


  @override
  Future getPostApiHeadersBodyServices(url, headers, body)async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: body,headers: headers).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }


}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 401:
      throw UnAuthorizedException("Authorization Error ${jsonDecode(response.body)['message']}");
    default:
      throw FetchDataException(
          'Error occurred while communicating with server ' +
              'with status code' +
              response.statusCode.toString());
  }
}
