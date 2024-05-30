

import 'package:radigone_v3/data/response/status.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;


  ApiResponse(this.status,this.data,this.message);

}
