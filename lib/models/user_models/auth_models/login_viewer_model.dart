/// success : true
/// message : "User Logged In Successfully"
/// data : {"id":6,"firstname":"Abhay","percentage":0,"agent_id":null,"lastname":"Kumar","username":"username3","email":"test3@gmail.com","mobile":"1111111112","whatsaap":"1111111112","gander":"male","marital":"single","dob":null,"occupation":null,"anniversary_date":null,"annual_income":null,"pan":"KAJJS2333E","account_number":null,"re_account_number":null,"bank_ifsc":null,"age":0,"profession":null,"ref_by":null,"balance":"0.00000000","completed_survey":0,"image":null,"address":{"address":"Vpo lahar","state":"Ho","zip":"177044","country":"In","city":"Hmr"},"status":1,"ev":1,"sv":1,"rv":1,"ver_code":null,"ver_code_send_at":null,"ts":0,"tv":1,"tsc":null,"provider":null,"id_proof":"/uploads/user/pan_card/1723033120-pan_card.pdf","address_proof":"/uploads/user/address_proof/1723033120-address_proof.pdf","provider_id":null,"is_check":1,"created_at":"2024-08-07T12:18:41.000000Z","updated_at":"2024-08-08T05:59:09.000000Z","country_code":"91","whatsaap_country_code":"91","payment_type":"bank_account","upi_id":null,"affiliate_id":null}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3N0YWdpbmcucmFkaWdvbmUuY29tL2FwaS92MS91c2VyL2xvZ2luIiwiaWF0IjoxNzIzMTE2MjY0LCJleHAiOjE3MjMxMTk4NjQsIm5iZiI6MTcyMzExNjI2NCwianRpIjoiSGYyMWpkbDE0Z2h0UGx0eSIsInN1YiI6IjYiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.0w8xIxepDOCJI7a7pKXvSkxNtyyAniC2ykhat7i3Bgk"
/// user info : {"longitude":"76.7889","latitude":"30.7339","location":"Chandigarh - - India - IN ","country_code":"IN","country":"India","user_id":6,"user_ip":"223.178.208.54","browser":"Unknown Browser","os":"Unknown OS Platform","updated_at":"2024-08-08T11:24:24.000000Z","created_at":"2024-08-08T11:24:24.000000Z","id":15}
/// token_type : "Bearer"

class LoginViewerModel {
  LoginViewerModel({
      bool? success, 
      String? message, 
      Data? data, 
      String? token, 
      UserInfo? userinfo, 
      String? tokenType,}){
    _success = success;
    _message = message;
    _data = data;
    _token = token;
    _userinfo = userinfo;
    _tokenType = tokenType;
}

  LoginViewerModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _token = json['token'];
    _userinfo = json['user info'] != null ? UserInfo.fromJson(json['user info']) : null;
    _tokenType = json['token_type'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  String? _token;
  UserInfo? _userinfo;
  String? _tokenType;
LoginViewerModel copyWith({  bool? success,
  String? message,
  Data? data,
  String? token,
  UserInfo? userinfo,
  String? tokenType,
}) => LoginViewerModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  token: token ?? _token,
  userinfo: userinfo ?? _userinfo,
  tokenType: tokenType ?? _tokenType,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  String? get token => _token;
  UserInfo? get userinfo => _userinfo;
  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    if (_userinfo != null) {
      map['user info'] = _userinfo?.toJson();
    }
    map['token_type'] = _tokenType;
    return map;
  }

}

/// longitude : "76.7889"
/// latitude : "30.7339"
/// location : "Chandigarh - - India - IN "
/// country_code : "IN"
/// country : "India"
/// user_id : 6
/// user_ip : "223.178.208.54"
/// browser : "Unknown Browser"
/// os : "Unknown OS Platform"
/// updated_at : "2024-08-08T11:24:24.000000Z"
/// created_at : "2024-08-08T11:24:24.000000Z"
/// id : 15

class UserInfo {
  UserInfo({
      String? longitude, 
      String? latitude, 
      String? location, 
      String? countryCode, 
      String? country, 
      num? userId, 
      String? userIp, 
      String? browser, 
      String? os, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _longitude = longitude;
    _latitude = latitude;
    _location = location;
    _countryCode = countryCode;
    _country = country;
    _userId = userId;
    _userIp = userIp;
    _browser = browser;
    _os = os;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  UserInfo.fromJson(dynamic json) {
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _location = json['location'];
    _countryCode = json['country_code'];
    _country = json['country'];
    _userId = json['user_id'];
    _userIp = json['user_ip'];
    _browser = json['browser'];
    _os = json['os'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _longitude;
  String? _latitude;
  String? _location;
  String? _countryCode;
  String? _country;
  num? _userId;
  String? _userIp;
  String? _browser;
  String? _os;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
UserInfo copyWith({  String? longitude,
  String? latitude,
  String? location,
  String? countryCode,
  String? country,
  num? userId,
  String? userIp,
  String? browser,
  String? os,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => UserInfo(  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  location: location ?? _location,
  countryCode: countryCode ?? _countryCode,
  country: country ?? _country,
  userId: userId ?? _userId,
  userIp: userIp ?? _userIp,
  browser: browser ?? _browser,
  os: os ?? _os,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get location => _location;
  String? get countryCode => _countryCode;
  String? get country => _country;
  num? get userId => _userId;
  String? get userIp => _userIp;
  String? get browser => _browser;
  String? get os => _os;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['location'] = _location;
    map['country_code'] = _countryCode;
    map['country'] = _country;
    map['user_id'] = _userId;
    map['user_ip'] = _userIp;
    map['browser'] = _browser;
    map['os'] = _os;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}

/// id : 6
/// firstname : "Abhay"
/// percentage : 0
/// agent_id : null
/// lastname : "Kumar"
/// username : "username3"
/// email : "test3@gmail.com"
/// mobile : "1111111112"
/// whatsaap : "1111111112"
/// gander : "male"
/// marital : "single"
/// dob : null
/// occupation : null
/// anniversary_date : null
/// annual_income : null
/// pan : "KAJJS2333E"
/// account_number : null
/// re_account_number : null
/// bank_ifsc : null
/// age : 0
/// profession : null
/// ref_by : null
/// balance : "0.00000000"
/// completed_survey : 0
/// image : null
/// address : {"address":"Vpo lahar","state":"Ho","zip":"177044","country":"In","city":"Hmr"}
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
/// id_proof : "/uploads/user/pan_card/1723033120-pan_card.pdf"
/// address_proof : "/uploads/user/address_proof/1723033120-address_proof.pdf"
/// provider_id : null
/// is_check : 1
/// created_at : "2024-08-07T12:18:41.000000Z"
/// updated_at : "2024-08-08T05:59:09.000000Z"
/// country_code : "91"
/// whatsaap_country_code : "91"
/// payment_type : "bank_account"
/// upi_id : null
/// affiliate_id : null

class Data {
  Data({
      num? id, 
      String? firstname, 
      num? percentage, 
      dynamic agentId, 
      String? lastname, 
      String? username, 
      String? email, 
      String? mobile, 
      String? whatsaap, 
      String? gander, 
      String? marital, 
      dynamic dob, 
      dynamic occupation, 
      dynamic anniversaryDate, 
      dynamic annualIncome, 
      String? pan, 
      dynamic accountNumber, 
      dynamic reAccountNumber, 
      dynamic bankIfsc, 
      num? age, 
      dynamic profession, 
      dynamic refBy, 
      String? balance, 
      num? completedSurvey, 
      dynamic image, 
      Address? address, 
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
      String? idProof, 
      String? addressProof, 
      dynamic providerId, 
      num? isCheck, 
      String? createdAt, 
      String? updatedAt, 
      String? countryCode, 
      String? whatsaapCountryCode, 
      String? paymentType, 
      dynamic upiId, 
      dynamic affiliateId,}){
    _id = id;
    _firstname = firstname;
    _percentage = percentage;
    _agentId = agentId;
    _lastname = lastname;
    _username = username;
    _email = email;
    _mobile = mobile;
    _whatsaap = whatsaap;
    _gander = gander;
    _marital = marital;
    _dob = dob;
    _occupation = occupation;
    _anniversaryDate = anniversaryDate;
    _annualIncome = annualIncome;
    _pan = pan;
    _accountNumber = accountNumber;
    _reAccountNumber = reAccountNumber;
    _bankIfsc = bankIfsc;
    _age = age;
    _profession = profession;
    _refBy = refBy;
    _balance = balance;
    _completedSurvey = completedSurvey;
    _image = image;
    _address = address;
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
    _idProof = idProof;
    _addressProof = addressProof;
    _providerId = providerId;
    _isCheck = isCheck;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _countryCode = countryCode;
    _whatsaapCountryCode = whatsaapCountryCode;
    _paymentType = paymentType;
    _upiId = upiId;
    _affiliateId = affiliateId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _percentage = json['percentage'];
    _agentId = json['agent_id'];
    _lastname = json['lastname'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
    _whatsaap = json['whatsaap'];
    _gander = json['gander'];
    _marital = json['marital'];
    _dob = json['dob'];
    _occupation = json['occupation'];
    _anniversaryDate = json['anniversary_date'];
    _annualIncome = json['annual_income'];
    _pan = json['pan'];
    _accountNumber = json['account_number'];
    _reAccountNumber = json['re_account_number'];
    _bankIfsc = json['bank_ifsc'];
    _age = json['age'];
    _profession = json['profession'];
    _refBy = json['ref_by'];
    _balance = json['balance'];
    _completedSurvey = json['completed_survey'];
    _image = json['image'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
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
    _idProof = json['id_proof'];
    _addressProof = json['address_proof'];
    _providerId = json['provider_id'];
    _isCheck = json['is_check'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _countryCode = json['country_code'];
    _whatsaapCountryCode = json['whatsaap_country_code'];
    _paymentType = json['payment_type'];
    _upiId = json['upi_id'];
    _affiliateId = json['affiliate_id'];
  }
  num? _id;
  String? _firstname;
  num? _percentage;
  dynamic _agentId;
  String? _lastname;
  String? _username;
  String? _email;
  String? _mobile;
  String? _whatsaap;
  String? _gander;
  String? _marital;
  dynamic _dob;
  dynamic _occupation;
  dynamic _anniversaryDate;
  dynamic _annualIncome;
  String? _pan;
  dynamic _accountNumber;
  dynamic _reAccountNumber;
  dynamic _bankIfsc;
  num? _age;
  dynamic _profession;
  dynamic _refBy;
  String? _balance;
  num? _completedSurvey;
  dynamic _image;
  Address? _address;
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
  String? _idProof;
  String? _addressProof;
  dynamic _providerId;
  num? _isCheck;
  String? _createdAt;
  String? _updatedAt;
  String? _countryCode;
  String? _whatsaapCountryCode;
  String? _paymentType;
  dynamic _upiId;
  dynamic _affiliateId;
Data copyWith({  num? id,
  String? firstname,
  num? percentage,
  dynamic agentId,
  String? lastname,
  String? username,
  String? email,
  String? mobile,
  String? whatsaap,
  String? gander,
  String? marital,
  dynamic dob,
  dynamic occupation,
  dynamic anniversaryDate,
  dynamic annualIncome,
  String? pan,
  dynamic accountNumber,
  dynamic reAccountNumber,
  dynamic bankIfsc,
  num? age,
  dynamic profession,
  dynamic refBy,
  String? balance,
  num? completedSurvey,
  dynamic image,
  Address? address,
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
  String? idProof,
  String? addressProof,
  dynamic providerId,
  num? isCheck,
  String? createdAt,
  String? updatedAt,
  String? countryCode,
  String? whatsaapCountryCode,
  String? paymentType,
  dynamic upiId,
  dynamic affiliateId,
}) => Data(  id: id ?? _id,
  firstname: firstname ?? _firstname,
  percentage: percentage ?? _percentage,
  agentId: agentId ?? _agentId,
  lastname: lastname ?? _lastname,
  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  whatsaap: whatsaap ?? _whatsaap,
  gander: gander ?? _gander,
  marital: marital ?? _marital,
  dob: dob ?? _dob,
  occupation: occupation ?? _occupation,
  anniversaryDate: anniversaryDate ?? _anniversaryDate,
  annualIncome: annualIncome ?? _annualIncome,
  pan: pan ?? _pan,
  accountNumber: accountNumber ?? _accountNumber,
  reAccountNumber: reAccountNumber ?? _reAccountNumber,
  bankIfsc: bankIfsc ?? _bankIfsc,
  age: age ?? _age,
  profession: profession ?? _profession,
  refBy: refBy ?? _refBy,
  balance: balance ?? _balance,
  completedSurvey: completedSurvey ?? _completedSurvey,
  image: image ?? _image,
  address: address ?? _address,
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
  idProof: idProof ?? _idProof,
  addressProof: addressProof ?? _addressProof,
  providerId: providerId ?? _providerId,
  isCheck: isCheck ?? _isCheck,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  countryCode: countryCode ?? _countryCode,
  whatsaapCountryCode: whatsaapCountryCode ?? _whatsaapCountryCode,
  paymentType: paymentType ?? _paymentType,
  upiId: upiId ?? _upiId,
  affiliateId: affiliateId ?? _affiliateId,
);
  num? get id => _id;
  String? get firstname => _firstname;
  num? get percentage => _percentage;
  dynamic get agentId => _agentId;
  String? get lastname => _lastname;
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get whatsaap => _whatsaap;
  String? get gander => _gander;
  String? get marital => _marital;
  dynamic get dob => _dob;
  dynamic get occupation => _occupation;
  dynamic get anniversaryDate => _anniversaryDate;
  dynamic get annualIncome => _annualIncome;
  String? get pan => _pan;
  dynamic get accountNumber => _accountNumber;
  dynamic get reAccountNumber => _reAccountNumber;
  dynamic get bankIfsc => _bankIfsc;
  num? get age => _age;
  dynamic get profession => _profession;
  dynamic get refBy => _refBy;
  String? get balance => _balance;
  num? get completedSurvey => _completedSurvey;
  dynamic get image => _image;
  Address? get address => _address;
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
  String? get idProof => _idProof;
  String? get addressProof => _addressProof;
  dynamic get providerId => _providerId;
  num? get isCheck => _isCheck;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get countryCode => _countryCode;
  String? get whatsaapCountryCode => _whatsaapCountryCode;
  String? get paymentType => _paymentType;
  dynamic get upiId => _upiId;
  dynamic get affiliateId => _affiliateId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
    map['percentage'] = _percentage;
    map['agent_id'] = _agentId;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['whatsaap'] = _whatsaap;
    map['gander'] = _gander;
    map['marital'] = _marital;
    map['dob'] = _dob;
    map['occupation'] = _occupation;
    map['anniversary_date'] = _anniversaryDate;
    map['annual_income'] = _annualIncome;
    map['pan'] = _pan;
    map['account_number'] = _accountNumber;
    map['re_account_number'] = _reAccountNumber;
    map['bank_ifsc'] = _bankIfsc;
    map['age'] = _age;
    map['profession'] = _profession;
    map['ref_by'] = _refBy;
    map['balance'] = _balance;
    map['completed_survey'] = _completedSurvey;
    map['image'] = _image;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
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
    map['id_proof'] = _idProof;
    map['address_proof'] = _addressProof;
    map['provider_id'] = _providerId;
    map['is_check'] = _isCheck;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['country_code'] = _countryCode;
    map['whatsaap_country_code'] = _whatsaapCountryCode;
    map['payment_type'] = _paymentType;
    map['upi_id'] = _upiId;
    map['affiliate_id'] = _affiliateId;
    return map;
  }

}

/// address : "Vpo lahar"
/// state : "Ho"
/// zip : "177044"
/// country : "In"
/// city : "Hmr"

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