/// success : true
/// message : "Password reset email sent successfully"

class UserForgetPasswordModel {
  UserForgetPasswordModel({
      bool? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  UserForgetPasswordModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  bool? _success;
  String? _message;
UserForgetPasswordModel copyWith({  bool? success,
  String? message,
}) => UserForgetPasswordModel(  success: success ?? _success,
  message: message ?? _message,
);
  bool? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

}