/// success : true
/// message : "Agent Logged In Successfully"
/// data : {"id":13,"user_id":"AbhKum177","firstname":"Abhay","lastname":"Kumar","username":"AbhayKumar11","email":"master.abhay71052@gmail.com","mobile":"918091771052","ref_by":null,"balance":"0.00000000","image":null,"address":{"address":"VPO Lahar","state":"HP","zip":"177044","country":"India","city":"Hamirpur"},"av":0,"status":1,"ev":1,"sv":1,"rv":1,"ver_code":null,"ver_code_send_at":null,"ts":0,"tv":1,"tsc":null,"provider":null,"provider_id":null,"bought_views":0,"total_views":0,"created_at":"2024-06-13T10:49:47.000000Z","updated_at":"2024-06-13T10:51:12.000000Z","title":"MR","business_cat":15,"business_subcat":null,"profiling_service":null,"multi_login":0,"num_login":0,"registration_fees":0,"firm_name":"Master","firm_type":"Partnership","firm_gstin":null,"id_proof":"/uploads/agent/pan_card/1718275787-pan_card.png","is_check":1,"pan":null,"address_proof":"/uploads/agent/address_proof/1718275787-address_proof.png","designation":"Authorized person","isfirm":1}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTY3MzJlZmQ1OTE5Njc0YWM1NjRhYzBjMTI1MTVlYTcwZWViYTJkZjM5NjgzZjA5YjYxNTUwNGNhODRkY2FkMzA2YWRkN2M3OGRmNjA4OWEiLCJpYXQiOjE3MTgyNzU4ODcuNzAzMjc0OTY1Mjg2MjU0ODgyODEyNSwibmJmIjoxNzE4Mjc1ODg3LjcwMzI3OTAxODQwMjA5OTYwOTM3NSwiZXhwIjoxNzQ5ODExODg3LjY2MTQ2MTExNDg4MzQyMjg1MTU2MjUsInN1YiI6IjEzIiwic2NvcGVzIjpbXX0.gy2amBpaag8Yq0blFLWoaAAQOOw2v2DSUOUib8OUAvcisshRfPreRr7aVXRdw_D3Z6e45_QdH4tWRaJGT0Au7u6KRF5_KBuucEHP8XU0gF2RpelrO8kNKyfBVxfTwSekiA9fpHmtzAX66XB6zMB5xQ45cLlhnYzFgQ66XTEV2yyQUiJWbG2w5F-TXBffc70SE0nkHG5x_4EN9OrC6lnKgXjOeVgYCiTZX2XONtpalAJiEObgJGXJ7yDCjK5MXYpTjQu6L904sH4LiiYMMEpZ5q4S1kNQonyg7868Y6r-YTESLKzM1yOJuNfdzwybLOy_v40bwA-k0jCHQShyF8jWD3b7QK1mzGiQVh8G1FPu1AuUcL_AZLgKhi1cLuGjOmKM7WQfpQqbcZMriXk1N3G4rVmPtzHoJz3MMIRd4qGvRNqBFzsbjqcqrcCh-w1zZjEHzevQLFJICG75hlYs1RikP7JTJ0UrN_BlrhkE_6Ci1gKDkJgrb0g36ve5CVlctslIXIS49xmymZ4lBuVJ6QYvkXzktPENBnbyAunhoAo37UCC4Aor4V_UBZtzoxWiSBc5fcodkqIfpgi7SL6Y24eriYITPmb9zNWm_2OGsw1uB353V5WinLciRDNhcfPDiST32uWa7EA2lOZdByEgiU4sMz49Yp_nGZg7_K7y_XCuqU8"
/// token_type : "Bearer"

class AgentLoginModel {
  AgentLoginModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? token, 
      String? tokenType,}){
    _success = success;
    _message = message;
    _data = data;
    _token = token;
    _tokenType = tokenType;
}

  AgentLoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _token = json['token'];
    _tokenType = json['token_type'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _token;
  String? _tokenType;
AgentLoginModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? token,
  String? tokenType,
}) => AgentLoginModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  token: token ?? _token,
  tokenType: tokenType ?? _tokenType,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  String? get token => _token;
  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    map['token_type'] = _tokenType;
    return map;
  }

}

/// id : 13
/// user_id : "AbhKum177"
/// firstname : "Abhay"
/// lastname : "Kumar"
/// username : "AbhayKumar11"
/// email : "master.abhay71052@gmail.com"
/// mobile : "918091771052"
/// ref_by : null
/// balance : "0.00000000"
/// image : null
/// address : {"address":"VPO Lahar","state":"HP","zip":"177044","country":"India","city":"Hamirpur"}
/// av : 0
/// status : 1
/// ev : 1
/// sv : 1
/// rv : 1
/// ver_code : null
/// ver_code_send_at : null
/// ts : 0
/// tv : 1
/// tsc : null
/// provider : null
/// provider_id : null
/// bought_views : 0
/// total_views : 0
/// created_at : "2024-06-13T10:49:47.000000Z"
/// updated_at : "2024-06-13T10:51:12.000000Z"
/// title : "MR"
/// business_cat : 15
/// business_subcat : null
/// profiling_service : null
/// multi_login : 0
/// num_login : 0
/// registration_fees : 0
/// firm_name : "Master"
/// firm_type : "Partnership"
/// firm_gstin : null
/// id_proof : "/uploads/agent/pan_card/1718275787-pan_card.png"
/// is_check : 1
/// pan : null
/// address_proof : "/uploads/agent/address_proof/1718275787-address_proof.png"
/// designation : "Authorized person"
/// isfirm : 1

class Data {
  Data({
      num? id, 
      String? userId, 
      String? firstname, 
      String? lastname, 
      String? username, 
      String? email, 
      String? mobile, 
      dynamic refBy, 
      String? balance, 
      dynamic image, 
      Address? address, 
      num? av, 
      num? status, 
      num? ev, 
      num? sv, 
      num? rv, 
      dynamic verCode, 
      dynamic verCodeSendAt, 
      num? ts, 
      num? tv, 
      dynamic tsc, 
      dynamic provider, 
      dynamic providerId, 
      num? boughtViews, 
      num? totalViews, 
      String? createdAt, 
      String? updatedAt, 
      String? title, 
      num? businessCat, 
      dynamic businessSubcat, 
      dynamic profilingService, 
      num? multiLogin, 
      num? numLogin, 
      num? registrationFees, 
      String? firmName, 
      String? firmType, 
      dynamic firmGstin, 
      String? idProof, 
      num? isCheck, 
      dynamic pan, 
      String? addressProof, 
      String? designation, 
      num? isfirm,}){
    _id = id;
    _userId = userId;
    _firstname = firstname;
    _lastname = lastname;
    _username = username;
    _email = email;
    _mobile = mobile;
    _refBy = refBy;
    _balance = balance;
    _image = image;
    _address = address;
    _av = av;
    _status = status;
    _ev = ev;
    _sv = sv;
    _rv = rv;
    _verCode = verCode;
    _verCodeSendAt = verCodeSendAt;
    _ts = ts;
    _tv = tv;
    _tsc = tsc;
    _provider = provider;
    _providerId = providerId;
    _boughtViews = boughtViews;
    _totalViews = totalViews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _title = title;
    _businessCat = businessCat;
    _businessSubcat = businessSubcat;
    _profilingService = profilingService;
    _multiLogin = multiLogin;
    _numLogin = numLogin;
    _registrationFees = registrationFees;
    _firmName = firmName;
    _firmType = firmType;
    _firmGstin = firmGstin;
    _idProof = idProof;
    _isCheck = isCheck;
    _pan = pan;
    _addressProof = addressProof;
    _designation = designation;
    _isfirm = isfirm;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
    _refBy = json['ref_by'];
    _balance = json['balance'];
    _image = json['image'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _av = json['av'];
    _status = json['status'];
    _ev = json['ev'];
    _sv = json['sv'];
    _rv = json['rv'];
    _verCode = json['ver_code'];
    _verCodeSendAt = json['ver_code_send_at'];
    _ts = json['ts'];
    _tv = json['tv'];
    _tsc = json['tsc'];
    _provider = json['provider'];
    _providerId = json['provider_id'];
    _boughtViews = json['bought_views'];
    _totalViews = json['total_views'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _title = json['title'];
    _businessCat = json['business_cat'];
    _businessSubcat = json['business_subcat'];
    _profilingService = json['profiling_service'];
    _multiLogin = json['multi_login'];
    _numLogin = json['num_login'];
    _registrationFees = json['registration_fees'];
    _firmName = json['firm_name'];
    _firmType = json['firm_type'];
    _firmGstin = json['firm_gstin'];
    _idProof = json['id_proof'];
    _isCheck = json['is_check'];
    _pan = json['pan'];
    _addressProof = json['address_proof'];
    _designation = json['designation'];
    _isfirm = json['isfirm'];
  }
  num? _id;
  String? _userId;
  String? _firstname;
  String? _lastname;
  String? _username;
  String? _email;
  String? _mobile;
  dynamic _refBy;
  String? _balance;
  dynamic _image;
  Address? _address;
  num? _av;
  num? _status;
  num? _ev;
  num? _sv;
  num? _rv;
  dynamic _verCode;
  dynamic _verCodeSendAt;
  num? _ts;
  num? _tv;
  dynamic _tsc;
  dynamic _provider;
  dynamic _providerId;
  num? _boughtViews;
  num? _totalViews;
  String? _createdAt;
  String? _updatedAt;
  String? _title;
  num? _businessCat;
  dynamic _businessSubcat;
  dynamic _profilingService;
  num? _multiLogin;
  num? _numLogin;
  num? _registrationFees;
  String? _firmName;
  String? _firmType;
  dynamic _firmGstin;
  String? _idProof;
  num? _isCheck;
  dynamic _pan;
  String? _addressProof;
  String? _designation;
  num? _isfirm;
Data copyWith({  num? id,
  String? userId,
  String? firstname,
  String? lastname,
  String? username,
  String? email,
  String? mobile,
  dynamic refBy,
  String? balance,
  dynamic image,
  Address? address,
  num? av,
  num? status,
  num? ev,
  num? sv,
  num? rv,
  dynamic verCode,
  dynamic verCodeSendAt,
  num? ts,
  num? tv,
  dynamic tsc,
  dynamic provider,
  dynamic providerId,
  num? boughtViews,
  num? totalViews,
  String? createdAt,
  String? updatedAt,
  String? title,
  num? businessCat,
  dynamic businessSubcat,
  dynamic profilingService,
  num? multiLogin,
  num? numLogin,
  num? registrationFees,
  String? firmName,
  String? firmType,
  dynamic firmGstin,
  String? idProof,
  num? isCheck,
  dynamic pan,
  String? addressProof,
  String? designation,
  num? isfirm,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  refBy: refBy ?? _refBy,
  balance: balance ?? _balance,
  image: image ?? _image,
  address: address ?? _address,
  av: av ?? _av,
  status: status ?? _status,
  ev: ev ?? _ev,
  sv: sv ?? _sv,
  rv: rv ?? _rv,
  verCode: verCode ?? _verCode,
  verCodeSendAt: verCodeSendAt ?? _verCodeSendAt,
  ts: ts ?? _ts,
  tv: tv ?? _tv,
  tsc: tsc ?? _tsc,
  provider: provider ?? _provider,
  providerId: providerId ?? _providerId,
  boughtViews: boughtViews ?? _boughtViews,
  totalViews: totalViews ?? _totalViews,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  title: title ?? _title,
  businessCat: businessCat ?? _businessCat,
  businessSubcat: businessSubcat ?? _businessSubcat,
  profilingService: profilingService ?? _profilingService,
  multiLogin: multiLogin ?? _multiLogin,
  numLogin: numLogin ?? _numLogin,
  registrationFees: registrationFees ?? _registrationFees,
  firmName: firmName ?? _firmName,
  firmType: firmType ?? _firmType,
  firmGstin: firmGstin ?? _firmGstin,
  idProof: idProof ?? _idProof,
  isCheck: isCheck ?? _isCheck,
  pan: pan ?? _pan,
  addressProof: addressProof ?? _addressProof,
  designation: designation ?? _designation,
  isfirm: isfirm ?? _isfirm,
);
  num? get id => _id;
  String? get userId => _userId;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;
  dynamic get refBy => _refBy;
  String? get balance => _balance;
  dynamic get image => _image;
  Address? get address => _address;
  num? get av => _av;
  num? get status => _status;
  num? get ev => _ev;
  num? get sv => _sv;
  num? get rv => _rv;
  dynamic get verCode => _verCode;
  dynamic get verCodeSendAt => _verCodeSendAt;
  num? get ts => _ts;
  num? get tv => _tv;
  dynamic get tsc => _tsc;
  dynamic get provider => _provider;
  dynamic get providerId => _providerId;
  num? get boughtViews => _boughtViews;
  num? get totalViews => _totalViews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get title => _title;
  num? get businessCat => _businessCat;
  dynamic get businessSubcat => _businessSubcat;
  dynamic get profilingService => _profilingService;
  num? get multiLogin => _multiLogin;
  num? get numLogin => _numLogin;
  num? get registrationFees => _registrationFees;
  String? get firmName => _firmName;
  String? get firmType => _firmType;
  dynamic get firmGstin => _firmGstin;
  String? get idProof => _idProof;
  num? get isCheck => _isCheck;
  dynamic get pan => _pan;
  String? get addressProof => _addressProof;
  String? get designation => _designation;
  num? get isfirm => _isfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['ref_by'] = _refBy;
    map['balance'] = _balance;
    map['image'] = _image;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['av'] = _av;
    map['status'] = _status;
    map['ev'] = _ev;
    map['sv'] = _sv;
    map['rv'] = _rv;
    map['ver_code'] = _verCode;
    map['ver_code_send_at'] = _verCodeSendAt;
    map['ts'] = _ts;
    map['tv'] = _tv;
    map['tsc'] = _tsc;
    map['provider'] = _provider;
    map['provider_id'] = _providerId;
    map['bought_views'] = _boughtViews;
    map['total_views'] = _totalViews;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['title'] = _title;
    map['business_cat'] = _businessCat;
    map['business_subcat'] = _businessSubcat;
    map['profiling_service'] = _profilingService;
    map['multi_login'] = _multiLogin;
    map['num_login'] = _numLogin;
    map['registration_fees'] = _registrationFees;
    map['firm_name'] = _firmName;
    map['firm_type'] = _firmType;
    map['firm_gstin'] = _firmGstin;
    map['id_proof'] = _idProof;
    map['is_check'] = _isCheck;
    map['pan'] = _pan;
    map['address_proof'] = _addressProof;
    map['designation'] = _designation;
    map['isfirm'] = _isfirm;
    return map;
  }

}

/// address : "VPO Lahar"
/// state : "HP"
/// zip : "177044"
/// country : "India"
/// city : "Hamirpur"

class Address {
  Address({
      String? address, 
      String? state, 
      String? zip, 
      String? country, 
      String? city,}){
    _address = address;
    _state = state;
    _zip = zip;
    _country = country;
    _city = city;
}

  Address.fromJson(dynamic json) {
    _address = json['address'];
    _state = json['state'];
    _zip = json['zip'];
    _country = json['country'];
    _city = json['city'];
  }
  String? _address;
  String? _state;
  String? _zip;
  String? _country;
  String? _city;
Address copyWith({  String? address,
  String? state,
  String? zip,
  String? country,
  String? city,
}) => Address(  address: address ?? _address,
  state: state ?? _state,
  zip: zip ?? _zip,
  country: country ?? _country,
  city: city ?? _city,
);
  String? get address => _address;
  String? get state => _state;
  String? get zip => _zip;
  String? get country => _country;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['state'] = _state;
    map['zip'] = _zip;
    map['country'] = _country;
    map['city'] = _city;
    return map;
  }

}