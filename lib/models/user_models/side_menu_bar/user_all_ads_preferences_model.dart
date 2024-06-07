/// success : true
/// message : null
/// data : [{"id":1,"name":"Other","price":10,"subcategories":"a,b,c","status":1,"created_at":"2022-01-09T23:20:59.000000Z","updated_at":"2023-06-14T20:12:23.000000Z"},{"id":2,"name":"Health","price":10,"subcategories":"wealth","status":1,"created_at":"2022-03-17T21:09:40.000000Z","updated_at":"2023-06-14T20:12:07.000000Z"},{"id":3,"name":"Real Estate","price":15,"subcategories":"Commercial,Residential,Rent,Other","status":1,"created_at":"2022-03-17T21:10:49.000000Z","updated_at":"2022-11-09T11:42:46.000000Z"},{"id":4,"name":"Accessories","price":20,"subcategories":"access,to","status":1,"created_at":"2022-03-17T21:14:23.000000Z","updated_at":"2023-06-14T20:11:49.000000Z"},{"id":5,"name":"Clothing","price":30,"subcategories":"Men,Woman,Kids","status":1,"created_at":"2022-03-17T21:15:22.000000Z","updated_at":"2022-11-09T11:44:06.000000Z"},{"id":6,"name":"Gold & Jewellery","price":35,"subcategories":"abc","status":1,"created_at":"2022-03-17T21:15:52.000000Z","updated_at":"2023-06-14T20:10:35.000000Z"},{"id":7,"name":"Tour & Travel","price":40,"subcategories":"tour,travel","status":1,"created_at":"2022-03-17T21:16:41.000000Z","updated_at":"2023-06-14T20:11:20.000000Z"},{"id":8,"name":"Loans","price":45,"subcategories":"Home Loan,Vehicle Loan,Other","status":1,"created_at":"2022-03-17T21:17:33.000000Z","updated_at":"2022-11-09T11:43:28.000000Z"},{"id":9,"name":"Mobile & Laptops","price":10,"subcategories":"456","status":1,"created_at":"2022-03-17T21:18:07.000000Z","updated_at":"2023-06-14T20:10:57.000000Z"},{"id":10,"name":"demo","price":30,"subcategories":null,"status":1,"created_at":"2022-05-31T10:21:58.000000Z","updated_at":"2022-06-27T11:50:57.000000Z"},{"id":11,"name":"Sports","price":10,"subcategories":"Cricket,Football,Tennis,Basketball,Hockey,Other","status":1,"created_at":"2022-06-28T14:41:26.000000Z","updated_at":"2022-11-09T11:41:58.000000Z"},{"id":12,"name":"OTT Platform","price":15,"subcategories":"Netflix,Hotstar,Prime Video,Other","status":1,"created_at":"2022-07-26T12:04:07.000000Z","updated_at":"2022-10-20T12:30:56.000000Z"},{"id":13,"name":"Movies","price":35,"subcategories":null,"status":1,"created_at":"2022-07-26T12:32:35.000000Z","updated_at":"2022-07-26T12:32:35.000000Z"},{"id":14,"name":"Online Services","price":1,"subcategories":"123","status":1,"created_at":"2023-05-16T16:59:28.000000Z","updated_at":"2023-06-14T20:10:45.000000Z"},{"id":15,"name":"Test11","price":11,"subcategories":"test1,test2,test3","status":1,"created_at":"2023-06-13T19:13:30.000000Z","updated_at":"2023-06-14T18:55:23.000000Z"}]

class UserAllAdsPreferencesModel {
  UserAllAdsPreferencesModel({
      bool? success, 
      dynamic message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UserAllAdsPreferencesModel.fromJson(dynamic json) {
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
UserAllAdsPreferencesModel copyWith({  bool? success,
  dynamic message,
  List<Data>? data,
}) => UserAllAdsPreferencesModel(  success: success ?? _success,
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

/// id : 1
/// name : "Other"
/// price : 10
/// subcategories : "a,b,c"
/// status : 1
/// created_at : "2022-01-09T23:20:59.000000Z"
/// updated_at : "2023-06-14T20:12:23.000000Z"

class Data {
  Data({
      num? id, 
      String? name, 
      num? price, 
      String? subcategories, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _price = price;
    _subcategories = subcategories;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _subcategories = json['subcategories'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _price;
  String? _subcategories;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? name,
  num? price,
  String? subcategories,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  subcategories: subcategories ?? _subcategories,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get price => _price;
  String? get subcategories => _subcategories;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['subcategories'] = _subcategories;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}