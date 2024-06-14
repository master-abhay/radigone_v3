/// success : true
/// message : "Survey Logged In Successfully"
/// data : {"id":26,"user_id":"AbhKum000","firstname":"Abhay","lastname":"Kumar","username":"abhayKumarMaster","email":"abhay71052@gmail.com","mobile":"+918091771052","ref_by":null,"balance":"0.00000000","image":null,"address":{"address":null,"state":null,"zip":null,"country":null,"city":null},"av":0,"status":1,"ev":1,"sv":0,"rv":0,"ver_code":null,"ver_code_send_at":null,"ts":0,"tv":1,"tsc":null,"provider":null,"agent_id":0,"provider_id":null,"bought_views":100000,"total_views":0,"post_arrangement":0,"post_arrangement_mode":0,"post_arrangement_doc":null,"created_at":"2024-05-21T08:58:03.000000Z","updated_at":"2024-05-21T08:58:04.000000Z","title":null,"business_cat":null,"business_subcat":null,"profiling_service":null,"multi_login":0,"num_login":0,"registration_fees":1,"firm_name":"","firm_type":null,"firm_gstin":null,"designation":null,"pan":null,"id_proof":"/uploads/pan_card/1716281883-pan_card.png","address_proof":"/uploads/address_proof/1716281883-address_proof.png","opt_out_msg":null,"isfirm":0,"credit_amount":null,"admin_approved_amount":null,"billing_date":null,"prev_billing_date":null,"gross_day":null,"payment_date":null,"deposite_amount":null,"is_check":1,"account_state":null,"prepaid_postpaid_status":null,"payment_due":null}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGYwMjU2M2M4ZGEyNWYzMjc0YTFkZmI4OWM3ZDRhMmFlZTkyZWZiMWEwYWE1ZGFmYjE1YzNjZGJjMTUxOGU0ZWI0M2QwMmMwODlhNzJiMjUiLCJpYXQiOjE3MTgzNTIzMDUuMzA0NjczOTEwMTQwOTkxMjEwOTM3NSwibmJmIjoxNzE4MzUyMzA1LjMwNDY3NzAwOTU4MjUxOTUzMTI1LCJleHAiOjE3NDk4ODgzMDUuMjcwMTU4MDUyNDQ0NDU4MDA3ODEyNSwic3ViIjoiMjYiLCJzY29wZXMiOltdfQ.GtLBkKHLwo__vwiKC9a77XSkI3YoGcXVskRPGHGG1jH86rY9IOcj0ua4u7PXrrLnxkKeeXJLllhk31MX_yVXF4Rvt6h6vcc5m_WHZY0yx4f2XKOGtJkNFL1ZPPCI7GHwSKNrgslzt3IRxga0sGEzH5oJuQuwUOmGXPMysBB4vm0YijEGfm62Werfu4EM8tc5FQxc4RGMgGN4RPNiY9ut3-OxWSgkgMeOnR9D9bojv4ZXqcK8xh-jJhETWB48rOyVyFuTKgxuUPFsnDEYQqhUsAS-5wdZYHt0eBcNVmxdvDLIDIPAVZpoOqNDNoebr_WZZahxr7iP43pPYBvA4EvkpSnzyZ9dAUaqISQ675xhoYmXoPbz67xgnBGVpKD_igTE6-pogTyUhbVuL_CUwRLgyPrl2-PC8Rwrjrgu1qChQP16T8bDooS5GCm_F7TIVN_FI6cAaJ9mk8LCEv93U90eqNYwwN0pLKC82ghLvzJUy6LV34laKXY61u3jvcPUf4eKB2pbJJZ7oBzXj8yyKOaJdF6_PKAVvZhvz6_J4--eswA3R_YccFM_PirZ3rlVWDN9IERnIfEd5aK4fKklCyro5t1dXqETqaZT4JfS7VNiXY3mjm9lS-dgixbLophMdcD5d0Oj8PXpSQp9DzqIRdHdBon10ALqd9eFy3NR6402AfQ"
/// token_type : "Bearer"

class LoginSponsorModel {
  LoginSponsorModel({
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

  LoginSponsorModel.fromJson(dynamic json) {
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
  LoginSponsorModel copyWith({  bool? success,
    String? message,
    Data? data,
    String? token,
    String? tokenType,
  }) => LoginSponsorModel(  success: success ?? _success,
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

/// id : 26
/// user_id : "AbhKum000"
/// firstname : "Abhay"
/// lastname : "Kumar"
/// username : "abhayKumarMaster"
/// email : "abhay71052@gmail.com"
/// mobile : "+918091771052"
/// ref_by : null
/// balance : "0.00000000"
/// image : null
/// address : {"address":null,"state":null,"zip":null,"country":null,"city":null}
/// av : 0
/// status : 1
/// ev : 1
/// sv : 0
/// rv : 0
/// ver_code : null
/// ver_code_send_at : null
/// ts : 0
/// tv : 1
/// tsc : null
/// provider : null
/// agent_id : 0
/// provider_id : null
/// bought_views : 100000
/// total_views : 0
/// post_arrangement : 0
/// post_arrangement_mode : 0
/// post_arrangement_doc : null
/// created_at : "2024-05-21T08:58:03.000000Z"
/// updated_at : "2024-05-21T08:58:04.000000Z"
/// title : null
/// business_cat : null
/// business_subcat : null
/// profiling_service : null
/// multi_login : 0
/// num_login : 0
/// registration_fees : 1
/// firm_name : ""
/// firm_type : null
/// firm_gstin : null
/// designation : null
/// pan : null
/// id_proof : "/uploads/pan_card/1716281883-pan_card.png"
/// address_proof : "/uploads/address_proof/1716281883-address_proof.png"
/// opt_out_msg : null
/// isfirm : 0
/// credit_amount : null
/// admin_approved_amount : null
/// billing_date : null
/// prev_billing_date : null
/// gross_day : null
/// payment_date : null
/// deposite_amount : null
/// is_check : 1
/// account_state : null
/// prepaid_postpaid_status : null
/// payment_due : null

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
    num? agentId,
    dynamic providerId,
    num? boughtViews,
    num? totalViews,
    num? postArrangement,
    num? postArrangementMode,
    dynamic postArrangementDoc,
    String? createdAt,
    String? updatedAt,
    dynamic title,
    dynamic businessCat,
    dynamic businessSubcat,
    dynamic profilingService,
    num? multiLogin,
    num? numLogin,
    num? registrationFees,
    String? firmName,
    dynamic firmType,
    dynamic firmGstin,
    dynamic designation,
    dynamic pan,
    String? idProof,
    String? addressProof,
    dynamic optOutMsg,
    num? isfirm,
    dynamic creditAmount,
    dynamic adminApprovedAmount,
    dynamic billingDate,
    dynamic prevBillingDate,
    dynamic grossDay,
    dynamic paymentDate,
    dynamic depositeAmount,
    num? isCheck,
    dynamic accountState,
    dynamic prepaidPostpaidStatus,
    dynamic paymentDue,}){
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
    _agentId = agentId;
    _providerId = providerId;
    _boughtViews = boughtViews;
    _totalViews = totalViews;
    _postArrangement = postArrangement;
    _postArrangementMode = postArrangementMode;
    _postArrangementDoc = postArrangementDoc;
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
    _designation = designation;
    _pan = pan;
    _idProof = idProof;
    _addressProof = addressProof;
    _optOutMsg = optOutMsg;
    _isfirm = isfirm;
    _creditAmount = creditAmount;
    _adminApprovedAmount = adminApprovedAmount;
    _billingDate = billingDate;
    _prevBillingDate = prevBillingDate;
    _grossDay = grossDay;
    _paymentDate = paymentDate;
    _depositeAmount = depositeAmount;
    _isCheck = isCheck;
    _accountState = accountState;
    _prepaidPostpaidStatus = prepaidPostpaidStatus;
    _paymentDue = paymentDue;
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
    _agentId = json['agent_id'];
    _providerId = json['provider_id'];
    _boughtViews = json['bought_views'];
    _totalViews = json['total_views'];
    _postArrangement = json['post_arrangement'];
    _postArrangementMode = json['post_arrangement_mode'];
    _postArrangementDoc = json['post_arrangement_doc'];
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
    _designation = json['designation'];
    _pan = json['pan'];
    _idProof = json['id_proof'];
    _addressProof = json['address_proof'];
    _optOutMsg = json['opt_out_msg'];
    _isfirm = json['isfirm'];
    _creditAmount = json['credit_amount'];
    _adminApprovedAmount = json['admin_approved_amount'];
    _billingDate = json['billing_date'];
    _prevBillingDate = json['prev_billing_date'];
    _grossDay = json['gross_day'];
    _paymentDate = json['payment_date'];
    _depositeAmount = json['deposite_amount'];
    _isCheck = json['is_check'];
    _accountState = json['account_state'];
    _prepaidPostpaidStatus = json['prepaid_postpaid_status'];
    _paymentDue = json['payment_due'];
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
  num? _agentId;
  dynamic _providerId;
  num? _boughtViews;
  num? _totalViews;
  num? _postArrangement;
  num? _postArrangementMode;
  dynamic _postArrangementDoc;
  String? _createdAt;
  String? _updatedAt;
  dynamic _title;
  dynamic _businessCat;
  dynamic _businessSubcat;
  dynamic _profilingService;
  num? _multiLogin;
  num? _numLogin;
  num? _registrationFees;
  String? _firmName;
  dynamic _firmType;
  dynamic _firmGstin;
  dynamic _designation;
  dynamic _pan;
  String? _idProof;
  String? _addressProof;
  dynamic _optOutMsg;
  num? _isfirm;
  dynamic _creditAmount;
  dynamic _adminApprovedAmount;
  dynamic _billingDate;
  dynamic _prevBillingDate;
  dynamic _grossDay;
  dynamic _paymentDate;
  dynamic _depositeAmount;
  num? _isCheck;
  dynamic _accountState;
  dynamic _prepaidPostpaidStatus;
  dynamic _paymentDue;
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
    num? agentId,
    dynamic providerId,
    num? boughtViews,
    num? totalViews,
    num? postArrangement,
    num? postArrangementMode,
    dynamic postArrangementDoc,
    String? createdAt,
    String? updatedAt,
    dynamic title,
    dynamic businessCat,
    dynamic businessSubcat,
    dynamic profilingService,
    num? multiLogin,
    num? numLogin,
    num? registrationFees,
    String? firmName,
    dynamic firmType,
    dynamic firmGstin,
    dynamic designation,
    dynamic pan,
    String? idProof,
    String? addressProof,
    dynamic optOutMsg,
    num? isfirm,
    dynamic creditAmount,
    dynamic adminApprovedAmount,
    dynamic billingDate,
    dynamic prevBillingDate,
    dynamic grossDay,
    dynamic paymentDate,
    dynamic depositeAmount,
    num? isCheck,
    dynamic accountState,
    dynamic prepaidPostpaidStatus,
    dynamic paymentDue,
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
    agentId: agentId ?? _agentId,
    providerId: providerId ?? _providerId,
    boughtViews: boughtViews ?? _boughtViews,
    totalViews: totalViews ?? _totalViews,
    postArrangement: postArrangement ?? _postArrangement,
    postArrangementMode: postArrangementMode ?? _postArrangementMode,
    postArrangementDoc: postArrangementDoc ?? _postArrangementDoc,
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
    designation: designation ?? _designation,
    pan: pan ?? _pan,
    idProof: idProof ?? _idProof,
    addressProof: addressProof ?? _addressProof,
    optOutMsg: optOutMsg ?? _optOutMsg,
    isfirm: isfirm ?? _isfirm,
    creditAmount: creditAmount ?? _creditAmount,
    adminApprovedAmount: adminApprovedAmount ?? _adminApprovedAmount,
    billingDate: billingDate ?? _billingDate,
    prevBillingDate: prevBillingDate ?? _prevBillingDate,
    grossDay: grossDay ?? _grossDay,
    paymentDate: paymentDate ?? _paymentDate,
    depositeAmount: depositeAmount ?? _depositeAmount,
    isCheck: isCheck ?? _isCheck,
    accountState: accountState ?? _accountState,
    prepaidPostpaidStatus: prepaidPostpaidStatus ?? _prepaidPostpaidStatus,
    paymentDue: paymentDue ?? _paymentDue,
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
  num? get agentId => _agentId;
  dynamic get providerId => _providerId;
  num? get boughtViews => _boughtViews;
  num? get totalViews => _totalViews;
  num? get postArrangement => _postArrangement;
  num? get postArrangementMode => _postArrangementMode;
  dynamic get postArrangementDoc => _postArrangementDoc;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get title => _title;
  dynamic get businessCat => _businessCat;
  dynamic get businessSubcat => _businessSubcat;
  dynamic get profilingService => _profilingService;
  num? get multiLogin => _multiLogin;
  num? get numLogin => _numLogin;
  num? get registrationFees => _registrationFees;
  String? get firmName => _firmName;
  dynamic get firmType => _firmType;
  dynamic get firmGstin => _firmGstin;
  dynamic get designation => _designation;
  dynamic get pan => _pan;
  String? get idProof => _idProof;
  String? get addressProof => _addressProof;
  dynamic get optOutMsg => _optOutMsg;
  num? get isfirm => _isfirm;
  dynamic get creditAmount => _creditAmount;
  dynamic get adminApprovedAmount => _adminApprovedAmount;
  dynamic get billingDate => _billingDate;
  dynamic get prevBillingDate => _prevBillingDate;
  dynamic get grossDay => _grossDay;
  dynamic get paymentDate => _paymentDate;
  dynamic get depositeAmount => _depositeAmount;
  num? get isCheck => _isCheck;
  dynamic get accountState => _accountState;
  dynamic get prepaidPostpaidStatus => _prepaidPostpaidStatus;
  dynamic get paymentDue => _paymentDue;

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
    map['agent_id'] = _agentId;
    map['provider_id'] = _providerId;
    map['bought_views'] = _boughtViews;
    map['total_views'] = _totalViews;
    map['post_arrangement'] = _postArrangement;
    map['post_arrangement_mode'] = _postArrangementMode;
    map['post_arrangement_doc'] = _postArrangementDoc;
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
    map['designation'] = _designation;
    map['pan'] = _pan;
    map['id_proof'] = _idProof;
    map['address_proof'] = _addressProof;
    map['opt_out_msg'] = _optOutMsg;
    map['isfirm'] = _isfirm;
    map['credit_amount'] = _creditAmount;
    map['admin_approved_amount'] = _adminApprovedAmount;
    map['billing_date'] = _billingDate;
    map['prev_billing_date'] = _prevBillingDate;
    map['gross_day'] = _grossDay;
    map['payment_date'] = _paymentDate;
    map['deposite_amount'] = _depositeAmount;
    map['is_check'] = _isCheck;
    map['account_state'] = _accountState;
    map['prepaid_postpaid_status'] = _prepaidPostpaidStatus;
    map['payment_due'] = _paymentDue;
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