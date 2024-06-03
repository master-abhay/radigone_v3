
class RedeemRadigonePointsModel {
  RedeemRadigonePointsModel({
      bool? success, 
      num? status, 
      String? message, 
      dynamic data,}){
    _success = success;
    _status = status;
    _message = message;
    _data = data;
}

  RedeemRadigonePointsModel.fromJson(dynamic json) {
    _success = json['success'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _success;
  num? _status;
  String? _message;
  dynamic _data;
RedeemRadigonePointsModel copyWith({  bool? success,
  num? status,
  String? message,
  dynamic data,
}) => RedeemRadigonePointsModel(  success: success ?? _success,
  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  num? get status => _status;
  String? get message => _message;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}