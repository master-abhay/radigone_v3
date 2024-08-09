/// success : true
/// message : "surveyor Registered Successfully"
/// data : {"firstname":"Abhay","lastname":"Kumar","email":"abhay@gmail.com","username":"abhay123","ref_by":null,"mobile":"0000000009","country_code":"91","agent_id":0,"is_check":1,"address":{"address":"sector 82 mohali,punjab","state":"Punjab","zip":"251001","country":"India","city":"Mohali"},"bought_views":100000,"total_views":0,"status":1,"ev":1,"sv":0,"ts":0,"tv":1,"ver_code":813599,"ver_code_send_at":"2024-08-09T08:28:33.000000Z","post_arrangement":0,"post_arrangement_mode":0,"title":"MR","business_cat":"3","business_subcat":"hockey","profiling_service":"ggwtwtrgwg","multi_login":1,"dynamic_login":3,"registration_fees":1,"firm_name":"grtgwer","firm_type":"Company","firm_gstin":"gerwgwvvrgwe","designation":"vrwgwg","pan":null,"isfirm":1,"user_id":"AbhKum251","updated_at":"2024-08-09T08:28:33.000000Z","created_at":"2024-08-09T08:28:33.000000Z","id":28,"id_proof":"/uploads/pan_card/1723192113-pan_card.jpg","address_proof":"/uploads/address_proof/1723192113-address_proof.jpg"}

class SponsorRegisterModel {
  SponsorRegisterModel({
    bool? success,
    String? message,
    Data? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  SponsorRegisterModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
  SponsorRegisterModel copyWith({  bool? success,
    String? message,
    Data? data,
  }) => SponsorRegisterModel(  success: success ?? _success,
    message: message ?? _message,
    data: data ?? _data,
  );
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// firstname : "Abhay"
/// lastname : "Kumar"
/// email : "abhay@gmail.com"
/// username : "abhay123"
/// ref_by : null
/// mobile : "0000000009"
/// country_code : "91"
/// agent_id : 0
/// is_check : 1
/// address : {"address":"sector 82 mohali,punjab","state":"Punjab","zip":"251001","country":"India","city":"Mohali"}
/// bought_views : 100000
/// total_views : 0
/// status : 1
/// ev : 1
/// sv : 0
/// ts : 0
/// tv : 1
/// ver_code : 813599
/// ver_code_send_at : "2024-08-09T08:28:33.000000Z"
/// post_arrangement : 0
/// post_arrangement_mode : 0
/// title : "MR"
/// business_cat : "3"
/// business_subcat : "hockey"
/// profiling_service : "ggwtwtrgwg"
/// multi_login : 1
/// dynamic_login : 3
/// registration_fees : 1
/// firm_name : "grtgwer"
/// firm_type : "Company"
/// firm_gstin : "gerwgwvvrgwe"
/// designation : "vrwgwg"
/// pan : null
/// isfirm : 1
/// user_id : "AbhKum251"
/// updated_at : "2024-08-09T08:28:33.000000Z"
/// created_at : "2024-08-09T08:28:33.000000Z"
/// id : 28
/// id_proof : "/uploads/pan_card/1723192113-pan_card.jpg"
/// address_proof : "/uploads/address_proof/1723192113-address_proof.jpg"

class Data {
  Data({
    String? firstname,
    String? lastname,
    String? email,
    String? username,
    dynamic refBy,
    String? mobile,
    String? countryCode,
    dynamic? agentId,
    dynamic? isCheck,
    Address? address,
    dynamic? boughtViews,
    dynamic? totalViews,
    dynamic? status,
    dynamic? ev,
    dynamic? sv,
    dynamic? ts,
    dynamic? tv,
    dynamic? verCode,
    String? verCodeSendAt,
    dynamic? postArrangement,
    dynamic? postArrangementMode,
    String? title,
    String? businessCat,
    String? businessSubcat,
    String? profilingService,
    dynamic? multiLogin,
    dynamic? dynamicLogin,
    dynamic? registrationFees,
    String? firmName,
    String? firmType,
    String? firmGstin,
    String? designation,
    dynamic pan,
    dynamic? isfirm,
    String? userId,
    String? updatedAt,
    String? createdAt,
    dynamic? id,
    String? idProof,
    String? addressProof,}){
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _username = username;
    _refBy = refBy;
    _mobile = mobile;
    _countryCode = countryCode;
    _agentId = agentId;
    _isCheck = isCheck;
    _address = address;
    _boughtViews = boughtViews;
    _totalViews = totalViews;
    _status = status;
    _ev = ev;
    _sv = sv;
    _ts = ts;
    _tv = tv;
    _verCode = verCode;
    _verCodeSendAt = verCodeSendAt;
    _postArrangement = postArrangement;
    _postArrangementMode = postArrangementMode;
    _title = title;
    _businessCat = businessCat;
    _businessSubcat = businessSubcat;
    _profilingService = profilingService;
    _multiLogin = multiLogin;
    _dynamicLogin = dynamicLogin;
    _registrationFees = registrationFees;
    _firmName = firmName;
    _firmType = firmType;
    _firmGstin = firmGstin;
    _designation = designation;
    _pan = pan;
    _isfirm = isfirm;
    _userId = userId;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
    _idProof = idProof;
    _addressProof = addressProof;
  }

  Data.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _username = json['username'];
    _refBy = json['ref_by'];
    _mobile = json['mobile'];
    _countryCode = json['country_code'];
    _agentId = json['agent_id'];
    _isCheck = json['is_check'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _boughtViews = json['bought_views'];
    _totalViews = json['total_views'];
    _status = json['status'];
    _ev = json['ev'];
    _sv = json['sv'];
    _ts = json['ts'];
    _tv = json['tv'];
    _verCode = json['ver_code'];
    _verCodeSendAt = json['ver_code_send_at'];
    _postArrangement = json['post_arrangement'];
    _postArrangementMode = json['post_arrangement_mode'];
    _title = json['title'];
    _businessCat = json['business_cat'];
    _businessSubcat = json['business_subcat'];
    _profilingService = json['profiling_service'];
    _multiLogin = json['multi_login'];
    _dynamicLogin = json['dynamic_login'];
    _registrationFees = json['registration_fees'];
    _firmName = json['firm_name'];
    _firmType = json['firm_type'];
    _firmGstin = json['firm_gstin'];
    _designation = json['designation'];
    _pan = json['pan'];
    _isfirm = json['isfirm'];
    _userId = json['user_id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _idProof = json['id_proof'];
    _addressProof = json['address_proof'];
  }
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _username;
  dynamic _refBy;
  String? _mobile;
  String? _countryCode;
  dynamic? _agentId;
  dynamic? _isCheck;
  Address? _address;
  dynamic? _boughtViews;
  dynamic? _totalViews;
  dynamic? _status;
  dynamic? _ev;
  dynamic? _sv;
  dynamic? _ts;
  dynamic? _tv;
  dynamic? _verCode;
  String? _verCodeSendAt;
  dynamic? _postArrangement;
  dynamic? _postArrangementMode;
  String? _title;
  String? _businessCat;
  String? _businessSubcat;
  String? _profilingService;
  dynamic? _multiLogin;
  dynamic? _dynamicLogin;
  dynamic? _registrationFees;
  String? _firmName;
  String? _firmType;
  String? _firmGstin;
  String? _designation;
  dynamic _pan;
  dynamic? _isfirm;
  String? _userId;
  String? _updatedAt;
  String? _createdAt;
  dynamic? _id;
  String? _idProof;
  String? _addressProof;
  Data copyWith({  String? firstname,
    String? lastname,
    String? email,
    String? username,
    dynamic refBy,
    String? mobile,
    String? countryCode,
    dynamic? agentId,
    dynamic? isCheck,
    Address? address,
    dynamic? boughtViews,
    dynamic? totalViews,
    dynamic? status,
    dynamic? ev,
    dynamic? sv,
    dynamic? ts,
    dynamic? tv,
    dynamic? verCode,
    String? verCodeSendAt,
    dynamic? postArrangement,
    dynamic? postArrangementMode,
    String? title,
    String? businessCat,
    String? businessSubcat,
    String? profilingService,
    dynamic? multiLogin,
    dynamic? dynamicLogin,
    dynamic? registrationFees,
    String? firmName,
    String? firmType,
    String? firmGstin,
    String? designation,
    dynamic pan,
    dynamic? isfirm,
    String? userId,
    String? updatedAt,
    String? createdAt,
    dynamic? id,
    String? idProof,
    String? addressProof,
  }) => Data(  firstname: firstname ?? _firstname,
    lastname: lastname ?? _lastname,
    email: email ?? _email,
    username: username ?? _username,
    refBy: refBy ?? _refBy,
    mobile: mobile ?? _mobile,
    countryCode: countryCode ?? _countryCode,
    agentId: agentId ?? _agentId,
    isCheck: isCheck ?? _isCheck,
    address: address ?? _address,
    boughtViews: boughtViews ?? _boughtViews,
    totalViews: totalViews ?? _totalViews,
    status: status ?? _status,
    ev: ev ?? _ev,
    sv: sv ?? _sv,
    ts: ts ?? _ts,
    tv: tv ?? _tv,
    verCode: verCode ?? _verCode,
    verCodeSendAt: verCodeSendAt ?? _verCodeSendAt,
    postArrangement: postArrangement ?? _postArrangement,
    postArrangementMode: postArrangementMode ?? _postArrangementMode,
    title: title ?? _title,
    businessCat: businessCat ?? _businessCat,
    businessSubcat: businessSubcat ?? _businessSubcat,
    profilingService: profilingService ?? _profilingService,
    multiLogin: multiLogin ?? _multiLogin,
    dynamicLogin: dynamicLogin ?? _dynamicLogin,
    registrationFees: registrationFees ?? _registrationFees,
    firmName: firmName ?? _firmName,
    firmType: firmType ?? _firmType,
    firmGstin: firmGstin ?? _firmGstin,
    designation: designation ?? _designation,
    pan: pan ?? _pan,
    isfirm: isfirm ?? _isfirm,
    userId: userId ?? _userId,
    updatedAt: updatedAt ?? _updatedAt,
    createdAt: createdAt ?? _createdAt,
    id: id ?? _id,
    idProof: idProof ?? _idProof,
    addressProof: addressProof ?? _addressProof,
  );
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get email => _email;
  String? get username => _username;
  dynamic get refBy => _refBy;
  String? get mobile => _mobile;
  String? get countryCode => _countryCode;
  dynamic? get agentId => _agentId;
  dynamic? get isCheck => _isCheck;
  Address? get address => _address;
  dynamic? get boughtViews => _boughtViews;
  dynamic? get totalViews => _totalViews;
  dynamic? get status => _status;
  dynamic? get ev => _ev;
  dynamic? get sv => _sv;
  dynamic? get ts => _ts;
  dynamic? get tv => _tv;
  dynamic? get verCode => _verCode;
  String? get verCodeSendAt => _verCodeSendAt;
  dynamic? get postArrangement => _postArrangement;
  dynamic? get postArrangementMode => _postArrangementMode;
  String? get title => _title;
  String? get businessCat => _businessCat;
  String? get businessSubcat => _businessSubcat;
  String? get profilingService => _profilingService;
  dynamic? get multiLogin => _multiLogin;
  dynamic? get dynamicLogin => _dynamicLogin;
  dynamic? get registrationFees => _registrationFees;
  String? get firmName => _firmName;
  String? get firmType => _firmType;
  String? get firmGstin => _firmGstin;
  String? get designation => _designation;
  dynamic get pan => _pan;
  dynamic? get isfirm => _isfirm;
  String? get userId => _userId;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  dynamic? get id => _id;
  String? get idProof => _idProof;
  String? get addressProof => _addressProof;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['email'] = _email;
    map['username'] = _username;
    map['ref_by'] = _refBy;
    map['mobile'] = _mobile;
    map['country_code'] = _countryCode;
    map['agent_id'] = _agentId;
    map['is_check'] = _isCheck;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['bought_views'] = _boughtViews;
    map['total_views'] = _totalViews;
    map['status'] = _status;
    map['ev'] = _ev;
    map['sv'] = _sv;
    map['ts'] = _ts;
    map['tv'] = _tv;
    map['ver_code'] = _verCode;
    map['ver_code_send_at'] = _verCodeSendAt;
    map['post_arrangement'] = _postArrangement;
    map['post_arrangement_mode'] = _postArrangementMode;
    map['title'] = _title;
    map['business_cat'] = _businessCat;
    map['business_subcat'] = _businessSubcat;
    map['profiling_service'] = _profilingService;
    map['multi_login'] = _multiLogin;
    map['dynamic_login'] = _dynamicLogin;
    map['registration_fees'] = _registrationFees;
    map['firm_name'] = _firmName;
    map['firm_type'] = _firmType;
    map['firm_gstin'] = _firmGstin;
    map['designation'] = _designation;
    map['pan'] = _pan;
    map['isfirm'] = _isfirm;
    map['user_id'] = _userId;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['id_proof'] = _idProof;
    map['address_proof'] = _addressProof;
    return map;
  }

}

/// address : "sector 82 mohali,punjab"
/// state : "Punjab"
/// zip : "251001"
/// country : "India"
/// city : "Mohali"

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