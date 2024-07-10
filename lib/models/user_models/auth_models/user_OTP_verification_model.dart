/// success : true
/// message : "You can change your password."
/// token : "152622"

class UserOtpVerificationModel {
  UserOtpVerificationModel({
      bool? success, 
      String? message, 
      String? token,}){
    _success = success;
    _message = message;
    _token = token;
}

  UserOtpVerificationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _token = json['token'];
  }
  bool? _success;
  String? _message;
  String? _token;
UserOtpVerificationModel copyWith({  bool? success,
  String? message,
  String? token,
}) => UserOtpVerificationModel(  success: success ?? _success,
  message: message ?? _message,
  token: token ?? _token,
);
  bool? get success => _success;
  String? get message => _message;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['token'] = _token;
    return map;
  }

}