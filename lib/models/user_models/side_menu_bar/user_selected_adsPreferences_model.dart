/// success : true
/// message : null
/// data : [{"id":260,"name":"Movies"},{"id":259,"name":"Tour & Travel"},{"id":258,"name":"Gold & Jewellery"},{"id":257,"name":"Clothing"},{"id":261,"name":"Online Services"}]

class UserSelectedAdsPreferencesModel {
  UserSelectedAdsPreferencesModel({
      bool? success, 
      dynamic message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UserSelectedAdsPreferencesModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  dynamic _message;
  List<Data>? _data;
UserSelectedAdsPreferencesModel copyWith({  bool? success,
  dynamic message,
  List<Data>? data,
}) => UserSelectedAdsPreferencesModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  dynamic get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 260
/// name : "Movies"

class Data {
  Data({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Data copyWith({  num? id,
  String? name,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}