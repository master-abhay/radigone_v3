/// success : "true"
/// message : null
/// current_page : 1
/// data : [{"id":916,"user_id":53,"admin_id":null,"surveyor_id":null,"agent_id":null,"amount":"1.00000000","charge":"0.00000000","post_balance":"0.00000000","trx_type":"+","trx":"EPJKN3H9C2CY","is_refundable":0,"details":"Payment For Registration Fee","is_postpaid":null,"created_at":"2024-05-29T05:46:21.000000Z","updated_at":"2024-05-29T05:46:21.000000Z"}]
/// first_page_url : "http://radigone.com/api/v1/user/transaction/history?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://radigone.com/api/v1/user/transaction/history?page=1"
/// next_page_url : null
/// path : "http://radigone.com/api/v1/user/transaction/history"
/// per_page : 20
/// prev_page_url : null
/// to : 1
/// total : 1

class UserTransactionModel {
  UserTransactionModel({
      String? success, 
      dynamic message, 
      num? currentPage, 
      List<Data>? data, 
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      dynamic nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _success = success;
    _message = message;
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  UserTransactionModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  String? _success;
  dynamic _message;
  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
UserTransactionModel copyWith({  String? success,
  dynamic message,
  num? currentPage,
  List<Data>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => UserTransactionModel(  success: success ?? _success,
  message: message ?? _message,
  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  String? get success => _success;
  dynamic get message => _message;
  num? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// id : 916
/// user_id : 53
/// admin_id : null
/// surveyor_id : null
/// agent_id : null
/// amount : "1.00000000"
/// charge : "0.00000000"
/// post_balance : "0.00000000"
/// trx_type : "+"
/// trx : "EPJKN3H9C2CY"
/// is_refundable : 0
/// details : "Payment For Registration Fee"
/// is_postpaid : null
/// created_at : "2024-05-29T05:46:21.000000Z"
/// updated_at : "2024-05-29T05:46:21.000000Z"

class Data {
  Data({
      num? id, 
      num? userId, 
      dynamic adminId, 
      dynamic surveyorId, 
      dynamic agentId, 
      String? amount, 
      String? charge, 
      String? postBalance, 
      String? trxType, 
      String? trx, 
      num? isRefundable, 
      String? details, 
      dynamic isPostpaid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _adminId = adminId;
    _surveyorId = surveyorId;
    _agentId = agentId;
    _amount = amount;
    _charge = charge;
    _postBalance = postBalance;
    _trxType = trxType;
    _trx = trx;
    _isRefundable = isRefundable;
    _details = details;
    _isPostpaid = isPostpaid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _adminId = json['admin_id'];
    _surveyorId = json['surveyor_id'];
    _agentId = json['agent_id'];
    _amount = json['amount'];
    _charge = json['charge'];
    _postBalance = json['post_balance'];
    _trxType = json['trx_type'];
    _trx = json['trx'];
    _isRefundable = json['is_refundable'];
    _details = json['details'];
    _isPostpaid = json['is_postpaid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  dynamic _adminId;
  dynamic _surveyorId;
  dynamic _agentId;
  String? _amount;
  String? _charge;
  String? _postBalance;
  String? _trxType;
  String? _trx;
  num? _isRefundable;
  String? _details;
  dynamic _isPostpaid;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? userId,
  dynamic adminId,
  dynamic surveyorId,
  dynamic agentId,
  String? amount,
  String? charge,
  String? postBalance,
  String? trxType,
  String? trx,
  num? isRefundable,
  String? details,
  dynamic isPostpaid,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  adminId: adminId ?? _adminId,
  surveyorId: surveyorId ?? _surveyorId,
  agentId: agentId ?? _agentId,
  amount: amount ?? _amount,
  charge: charge ?? _charge,
  postBalance: postBalance ?? _postBalance,
  trxType: trxType ?? _trxType,
  trx: trx ?? _trx,
  isRefundable: isRefundable ?? _isRefundable,
  details: details ?? _details,
  isPostpaid: isPostpaid ?? _isPostpaid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  dynamic get adminId => _adminId;
  dynamic get surveyorId => _surveyorId;
  dynamic get agentId => _agentId;
  String? get amount => _amount;
  String? get charge => _charge;
  String? get postBalance => _postBalance;
  String? get trxType => _trxType;
  String? get trx => _trx;
  num? get isRefundable => _isRefundable;
  String? get details => _details;
  dynamic get isPostpaid => _isPostpaid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['admin_id'] = _adminId;
    map['surveyor_id'] = _surveyorId;
    map['agent_id'] = _agentId;
    map['amount'] = _amount;
    map['charge'] = _charge;
    map['post_balance'] = _postBalance;
    map['trx_type'] = _trxType;
    map['trx'] = _trx;
    map['is_refundable'] = _isRefundable;
    map['details'] = _details;
    map['is_postpaid'] = _isPostpaid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}