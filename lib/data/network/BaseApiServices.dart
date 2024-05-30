
import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<dynamic> getGetApiServices(dynamic url, dynamic headers);
  Future<dynamic> getPostApiBodyServices(dynamic url,dynamic body);
  Future<dynamic> getPostApiHeadersServices(dynamic url,dynamic headers);
  Future<dynamic> getPostApiHeadersBodyServices(dynamic url, dynamic headers, dynamic body);
  Future<dynamic> getMultipartApiServices(dynamic url, Map<String, String> fields, List<http.MultipartFile> files);

}
