class ViewerRegistrationModel {
  ViewerRegistrationModel({
    bool? success,
    String? message,
    Data? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  ViewerRegistrationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
  ViewerRegistrationModel copyWith({  bool? success,
    String? message,
    Data? data,
  }) => ViewerRegistrationModel(  success: success ?? _success,
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
/// username : "abhayKumar"
/// ref_by : null
/// mobile : "8091771052"
/// age : 0
/// is_check : 1
/// profession : null
/// whatsaap : "8091771052"
/// gander : "Male"
/// marital : "Single"
/// country_code : "91"
/// whatsaap_country_code : "91"
/// pan : "BYZAM5070L"
/// address : {"address":"sector 42,Mohali punjab","state":"Punjab","zip":"251001","country":"India","city":"Mohali"}
/// status : 1
/// ev : 1
/// sv : 0
/// ts : 0
/// tv : 1
/// ver_code : 613449
/// ver_code_send_at : "2024-08-07T07:42:57.000000Z"
/// updated_at : "2024-08-07T07:42:57.000000Z"
/// created_at : "2024-08-07T07:42:57.000000Z"
/// id : 1
/// id_proof : "/uploads/user/pan_card/1723016577-pan_card.jpg"
/// address_proof : "/uploads/user/address_proof/1723016577-address_proof.jpg"

class Data {
  Data({
    String? firstname,
    String? lastname,
    String? email,
    String? username,
    dynamic refBy,
    String? mobile,
    num? age,
    num? isCheck,
    dynamic profession,
    String? whatsaap,
    String? gander,
    String? marital,
    String? countryCode,
    String? whatsaapCountryCode,
    String? pan,
    Address? address,
    num? status,
    num? ev,
    num? sv,
    num? ts,
    num? tv,
    num? verCode,
    String? verCodeSendAt,
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
    _age = age;
    _isCheck = isCheck;
    _profession = profession;
    _whatsaap = whatsaap;
    _gander = gander;
    _marital = marital;
    _countryCode = countryCode;
    _whatsaapCountryCode = whatsaapCountryCode;
    _pan = pan;
    _address = address;
    _status = status;
    _ev = ev;
    _sv = sv;
    _ts = ts;
    _tv = tv;
    _verCode = verCode;
    _verCodeSendAt = verCodeSendAt;
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
    _age = json['age'];
    _isCheck = json['is_check'];
    _profession = json['profession'];
    _whatsaap = json['whatsaap'];
    _gander = json['gander'];
    _marital = json['marital'];
    _countryCode = json['country_code'];
    _whatsaapCountryCode = json['whatsaap_country_code'];
    _pan = json['pan'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _status = json['status'];
    _ev = json['ev'];
    _sv = json['sv'];
    _ts = json['ts'];
    _tv = json['tv'];
    _verCode = json['ver_code'];
    _verCodeSendAt = json['ver_code_send_at'];
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
  num? _age;
  num? _isCheck;
  dynamic _profession;
  String? _whatsaap;
  String? _gander;
  String? _marital;
  String? _countryCode;
  String? _whatsaapCountryCode;
  String? _pan;
  Address? _address;
  num? _status;
  num? _ev;
  num? _sv;
  num? _ts;
  num? _tv;
  num? _verCode;
  String? _verCodeSendAt;
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
    num? age,
    num? isCheck,
    dynamic profession,
    String? whatsaap,
    String? gander,
    String? marital,
    String? countryCode,
    String? whatsaapCountryCode,
    String? pan,
    Address? address,
    num? status,
    num? ev,
    num? sv,
    num? ts,
    num? tv,
    num? verCode,
    String? verCodeSendAt,
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
    age: age ?? _age,
    isCheck: isCheck ?? _isCheck,
    profession: profession ?? _profession,
    whatsaap: whatsaap ?? _whatsaap,
    gander: gander ?? _gander,
    marital: marital ?? _marital,
    countryCode: countryCode ?? _countryCode,
    whatsaapCountryCode: whatsaapCountryCode ?? _whatsaapCountryCode,
    pan: pan ?? _pan,
    address: address ?? _address,
    status: status ?? _status,
    ev: ev ?? _ev,
    sv: sv ?? _sv,
    ts: ts ?? _ts,
    tv: tv ?? _tv,
    verCode: verCode ?? _verCode,
    verCodeSendAt: verCodeSendAt ?? _verCodeSendAt,
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
  num? get age => _age;
  num? get isCheck => _isCheck;
  dynamic get profession => _profession;
  String? get whatsaap => _whatsaap;
  String? get gander => _gander;
  String? get marital => _marital;
  String? get countryCode => _countryCode;
  String? get whatsaapCountryCode => _whatsaapCountryCode;
  String? get pan => _pan;
  Address? get address => _address;
  num? get status => _status;
  num? get ev => _ev;
  num? get sv => _sv;
  num? get ts => _ts;
  num? get tv => _tv;
  num? get verCode => _verCode;
  String? get verCodeSendAt => _verCodeSendAt;
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
    map['age'] = _age;
    map['is_check'] = _isCheck;
    map['profession'] = _profession;
    map['whatsaap'] = _whatsaap;
    map['gander'] = _gander;
    map['marital'] = _marital;
    map['country_code'] = _countryCode;
    map['whatsaap_country_code'] = _whatsaapCountryCode;
    map['pan'] = _pan;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['status'] = _status;
    map['ev'] = _ev;
    map['sv'] = _sv;
    map['ts'] = _ts;
    map['tv'] = _tv;
    map['ver_code'] = _verCode;
    map['ver_code_send_at'] = _verCodeSendAt;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['id_proof'] = _idProof;
    map['address_proof'] = _addressProof;
    return map;
  }

}

/// address : "sector 42,Mohali punjab"
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