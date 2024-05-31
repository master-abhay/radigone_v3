
import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<dynamic> getGetApiServices(dynamic url, dynamic headers);
  Future<dynamic> getPostApiBodyServices(dynamic url,dynamic body);
  Future<dynamic> getPostApiHeadersServices(dynamic url,dynamic headers);
  Future<dynamic> getPostApiHeadersBodyServices(dynamic url, dynamic headers, dynamic body);
  Future<dynamic> getMultipartApiServices({required String url,
    required Map<String, String> field,
    required List<http.MultipartFile> file,
    required Map<String, String> header,});
}
