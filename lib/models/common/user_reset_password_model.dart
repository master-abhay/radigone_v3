/// success : false
/// message : "Invalid Verification Code"
/// errors : "Invalid token"

class UserResetPasswordModel {
  UserResetPasswordModel({
      bool? success, 
      String? message, 
      String? errors,}){
    _success = success;
    _message = message;
    _errors = errors;
}

  UserResetPasswordModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  bool? _success;
  String? _message;
  String? _errors;
UserResetPasswordModel copyWith({  bool? success,
  String? message,
  String? errors,
}) => UserResetPasswordModel(  success: success ?? _success,
  message: message ?? _message,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  String? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }

}