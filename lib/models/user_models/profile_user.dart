/// id : 26
/// firstname : "Abhay"
/// percentage : 50
/// agent_id : null
/// lastname : "Don"
/// username : "abhaykumar"
/// email : "master.abhay71052@gmail.com"
/// mobile : "918091771052"
/// whatsaap : "8091771052"
/// gander : ""
/// marital : ""
/// dob : null
/// occupation : null
/// anniversary_date : null
/// annual_income : null
/// pan : null
/// account_number : "2342234224"
/// re_account_number : "2342234224"
/// bank_ifsc : null
/// age : 0
/// profession : null
/// ref_by : null
/// balance : "0.00000000"
/// completed_survey : 0
/// image : null
/// address : {"address":null,"state":null,"zip":null,"country":"India","city":null}
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
/// id_proof : "/uploads/user/pan_card/1715062512-pan_card.png"
/// address_proof : "/uploads/user/address_proof/1715062512-address_proof.png"
/// provider_id : null
/// is_check : 1
/// created_at : "2024-05-07T06:15:12.000000Z"
/// updated_at : "2024-05-27T09:05:20.000000Z"

class UserProfileInformation {
  UserProfileInformation({
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
    dynamic pan,
    String? accountNumber,
    String? reAccountNumber,
    dynamic bankIfsc,
    num? age,
    dynamic profession,
    dynamic refBy,
    dynamic balance,
    num? completedSurvey,
    dynamic image,
    Address? address,
    dynamic status,
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
    String? updatedAt,}){
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
  }

  UserProfileInformation.fromJson(dynamic json) {
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
  dynamic _pan;
  String? _accountNumber;
  String? _reAccountNumber;
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
  UserProfileInformation copyWith({  num? id,
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
    dynamic pan,
    String? accountNumber,
    String? reAccountNumber,
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
  }) => UserProfileInformation(  id: id ?? _id,
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
  dynamic get pan => _pan;
  String? get accountNumber => _accountNumber;
  String? get reAccountNumber => _reAccountNumber;
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
    return map;
  }

}

/// address : null
/// state : null
/// zip : null
/// country : "India"
/// city : null

class Address {
  Address({
    dynamic address,
    dynamic state,
    dynamic zip,
    String? country,
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
  String? _country;
  dynamic _city;
  Address copyWith({  dynamic address,
    dynamic state,
    dynamic zip,
    String? country,
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
  String? get country => _country;
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