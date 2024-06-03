/// success : true
/// message : "surveyor Registered Successfully"
/// data : {"firstname":"Abhay","lastname":"Kumar","email":"abhay71052@gmail.com","username":"abhayKumarMaster","ref_by":null,"mobile":"+918091771052","agent_id":0,"is_check":1,"address":{"address":null,"state":null,"zip":null,"country":null,"city":null},"bought_views":100000,"total_views":0,"status":1,"ev":1,"sv":0,"ts":0,"tv":1,"post_arrangement":0,"post_arrangement_mode":0,"title":null,"business_cat":null,"business_subcat":null,"profiling_service":null,"multi_login":0,"num_login":0,"registration_fees":1,"firm_name":null,"firm_type":null,"firm_gstin":null,"designation":null,"pan":null,"isfirm":0,"user_id":"AbhKum000","updated_at":"2024-05-21T08:58:03.000000Z","created_at":"2024-05-21T08:58:03.000000Z","id":26,"id_proof":"/uploads/pan_card/1716281883-pan_card.png","address_proof":"/uploads/address_proof/1716281883-address_proof.png"}
library;

class SponserRegistrationModel {
  SponserRegistrationModel({
    bool? success,
    String? message,
    Data? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  SponserRegistrationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
  SponserRegistrationModel copyWith({  bool? success,
    String? message,
    Data? data,
  }) => SponserRegistrationModel(  success: success ?? _success,
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
/// email : "abhay71052@gmail.com"
/// username : "abhayKumarMaster"
/// ref_by : null
/// mobile : "+918091771052"
/// agent_id : 0
/// is_check : 1
/// address : {"address":null,"state":null,"zip":null,"country":null,"city":null}
/// bought_views : 100000
/// total_views : 0
/// status : 1
/// ev : 1
/// sv : 0
/// ts : 0
/// tv : 1
/// post_arrangement : 0
/// post_arrangement_mode : 0
/// title : null
/// business_cat : null
/// business_subcat : null
/// profiling_service : null
/// multi_login : 0
/// num_login : 0
/// registration_fees : 1
/// firm_name : null
/// firm_type : null
/// firm_gstin : null
/// designation : null
/// pan : null
/// isfirm : 0
/// user_id : "AbhKum000"
/// updated_at : "2024-05-21T08:58:03.000000Z"
/// created_at : "2024-05-21T08:58:03.000000Z"
/// id : 26
/// id_proof : "/uploads/pan_card/1716281883-pan_card.png"
/// address_proof : "/uploads/address_proof/1716281883-address_proof.png"

class Data {
  Data({
    String? firstname,
    String? lastname,
    String? email,
    String? username,
    dynamic refBy,
    String? mobile,
    num? agentId,
    num? isCheck,
    Address? address,
    num? boughtViews,
    num? totalViews,
    num? status,
    num? ev,
    num? sv,
    num? ts,
    num? tv,
    num? postArrangement,
    num? postArrangementMode,
    dynamic title,
    dynamic businessCat,
    dynamic businessSubcat,
    dynamic profilingService,
    num? multiLogin,
    num? numLogin,
    num? registrationFees,
    dynamic firmName,
    dynamic firmType,
    dynamic firmGstin,
    dynamic designation,
    dynamic pan,
    num? isfirm,
    String? userId,
    String? updatedAt,
    String? createdAt,
    num? id,
    String? idProof,
    String? addressProof,}){
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _username = username;
    _refBy = refBy;
    _mobile = mobile;
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
    _postArrangement = postArrangement;
    _postArrangementMode = postArrangementMode;
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
    _postArrangement = json['post_arrangement'];
    _postArrangementMode = json['post_arrangement_mode'];
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
  num? _agentId;
  num? _isCheck;
  Address? _address;
  num? _boughtViews;
  num? _totalViews;
  num? _status;
  num? _ev;
  num? _sv;
  num? _ts;
  num? _tv;
  num? _postArrangement;
  num? _postArrangementMode;
  dynamic _title;
  dynamic _businessCat;
  dynamic _businessSubcat;
  dynamic _profilingService;
  num? _multiLogin;
  num? _numLogin;
  num? _registrationFees;
  dynamic _firmName;
  dynamic _firmType;
  dynamic _firmGstin;
  dynamic _designation;
  dynamic _pan;
  num? _isfirm;
  String? _userId;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
  String? _idProof;
  String? _addressProof;
  Data copyWith({  String? firstname,
    String? lastname,
    String? email,
    String? username,
    dynamic refBy,
    String? mobile,
    num? agentId,
    num? isCheck,
    Address? address,
    num? boughtViews,
    num? totalViews,
    num? status,
    num? ev,
    num? sv,
    num? ts,
    num? tv,
    num? postArrangement,
    num? postArrangementMode,
    dynamic title,
    dynamic businessCat,
    dynamic businessSubcat,
    dynamic profilingService,
    num? multiLogin,
    num? numLogin,
    num? registrationFees,
    dynamic firmName,
    dynamic firmType,
    dynamic firmGstin,
    dynamic designation,
    dynamic pan,
    num? isfirm,
    String? userId,
    String? updatedAt,
    String? createdAt,
    num? id,
    String? idProof,
    String? addressProof,
  }) => Data(  firstname: firstname ?? _firstname,
    lastname: lastname ?? _lastname,
    email: email ?? _email,
    username: username ?? _username,
    refBy: refBy ?? _refBy,
    mobile: mobile ?? _mobile,
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
    postArrangement: postArrangement ?? _postArrangement,
    postArrangementMode: postArrangementMode ?? _postArrangementMode,
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
  num? get agentId => _agentId;
  num? get isCheck => _isCheck;
  Address? get address => _address;
  num? get boughtViews => _boughtViews;
  num? get totalViews => _totalViews;
  num? get status => _status;
  num? get ev => _ev;
  num? get sv => _sv;
  num? get ts => _ts;
  num? get tv => _tv;
  num? get postArrangement => _postArrangement;
  num? get postArrangementMode => _postArrangementMode;
  dynamic get title => _title;
  dynamic get businessCat => _businessCat;
  dynamic get businessSubcat => _businessSubcat;
  dynamic get profilingService => _profilingService;
  num? get multiLogin => _multiLogin;
  num? get numLogin => _numLogin;
  num? get registrationFees => _registrationFees;
  dynamic get firmName => _firmName;
  dynamic get firmType => _firmType;
  dynamic get firmGstin => _firmGstin;
  dynamic get designation => _designation;
  dynamic get pan => _pan;
  num? get isfirm => _isfirm;
  String? get userId => _userId;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;
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
    map['post_arrangement'] = _postArrangement;
    map['post_arrangement_mode'] = _postArrangementMode;
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

/// address : null
/// state : null
/// zip : null
/// country : null
/// city : null

class Address {
  Address({
    dynamic address,
    dynamic state,
    dynamic zip,
    dynamic country,
    dynamic city,}){
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
  dynamic _address;
  dynamic _state;
  dynamic _zip;
  dynamic _country;
  dynamic _city;
  Address copyWith({  dynamic address,
    dynamic state,
    dynamic zip,
    dynamic country,
    dynamic city,
  }) => Address(  address: address ?? _address,
    state: state ?? _state,
    zip: zip ?? _zip,
    country: country ?? _country,
    city: city ?? _city,
  );
  dynamic get address => _address;
  dynamic get state => _state;
  dynamic get zip => _zip;
  dynamic get country => _country;
  dynamic get city => _city;

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