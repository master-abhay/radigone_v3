// import 'dart:convert';
//
// class UserRadigonePointModel {
//   bool? success;
//   String? message;
//   User? user;
//   dynamic totalWithdraw;
//   dynamic totalTransaction;
//   List<dynamic>? withdrawChartData;
//   Surveys? surveys;
//   String? emptyMessage;
//
//   UserRadigonePointModel({
//     this.success,
//     this.message,
//     this.user,
//     this.totalWithdraw,
//     this.totalTransaction,
//     this.withdrawChartData,
//     this.surveys,
//     this.emptyMessage,
//   });
//
//   factory UserRadigonePointModel.fromJson(dynamic json) {
//     return UserRadigonePointModel(
//       success: json['success'],
//       message: json['message'],
//       user: json['user'] != null ? User.fromJson(json['user']) : null,
//       totalWithdraw: json['totalWithdraw'],
//       totalTransaction: json['totalTransaction'],
//       withdrawChartData: json['withdraw_chart_data'] != null ? List<dynamic>.from(json['withdraw_chart_data']) : null,
//       surveys: json['surveys'] != null ? Surveys.fromJson(json['surveys']) : null,
//       emptyMessage: json['empty_message'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'message': message,
//       'user': user?.toJson(),
//       'totalWithdraw': totalWithdraw,
//       'totalTransaction': totalTransaction,
//       'withdraw_chart_data': withdrawChartData,
//       'surveys': surveys?.toJson(),
//       'empty_message': emptyMessage,
//     };
//   }
// }
//
// class User {
//   dynamic id;
//   String? firstname;
//   dynamic percentage;
//   dynamic agentId;
//   String? lastname;
//   String? username;
//   String? email;
//   String? mobile;
//   String? whatsaap;
//   String? gander;
//   String? marital;
//   String? dob;
//   String? occupation;
//   String? anniversaryDate;
//   String? annualIncome;
//   String? pan;
//   String? accountNumber;
//   String? reAccountNumber;
//   String? bankIfsc;
//   dynamic age;
//   String? profession;
//   String? refBy;
//   String? balance;
//   dynamic completedSurvey;
//   String? image;
//   Address? address;
//   dynamic status;
//   dynamic ev;
//   dynamic sv;
//   dynamic rv;
//   String? verCode;
//   String? verCodeSendAt;
//   dynamic ts;
//   dynamic tv;
//   String? tsc;
//   String? provider;
//   String? idProof;
//   String? addressProof;
//   dynamic providerId;
//   dynamic isCheck;
//   String? createdAt;
//   String? updatedAt;
//
//   User({
//     this.id,
//     this.firstname,
//     this.percentage,
//     this.agentId,
//     this.lastname,
//     this.username,
//     this.email,
//     this.mobile,
//     this.whatsaap,
//     this.gander,
//     this.marital,
//     this.dob,
//     this.occupation,
//     this.anniversaryDate,
//     this.annualIncome,
//     this.pan,
//     this.accountNumber,
//     this.reAccountNumber,
//     this.bankIfsc,
//     this.age,
//     this.profession,
//     this.refBy,
//     this.balance,
//     this.completedSurvey,
//     this.image,
//     this.address,
//     this.status,
//     this.ev,
//     this.sv,
//     this.rv,
//     this.verCode,
//     this.verCodeSendAt,
//     this.ts,
//     this.tv,
//     this.tsc,
//     this.provider,
//     this.idProof,
//     this.addressProof,
//     this.providerId,
//     this.isCheck,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory User.fromJson(dynamic json) {
//     return User(
//       id: json['id'],
//       firstname: json['firstname'],
//       percentage: json['percentage'],
//       agentId: json['agent_id'],
//       lastname: json['lastname'],
//       username: json['username'],
//       email: json['email'],
//       mobile: json['mobile'],
//       whatsaap: json['whatsaap'],
//       gander: json['gander'],
//       marital: json['marital'],
//       dob: json['dob'],
//       occupation: json['occupation'],
//       anniversaryDate: json['anniversary_date'],
//       annualIncome: json['annual_income'],
//       pan: json['pan'],
//       accountNumber: json['account_number'],
//       reAccountNumber: json['re_account_number'],
//       bankIfsc: json['bank_ifsc'],
//       age: json['age'],
//       profession: json['profession'],
//       refBy: json['ref_by'],
//       balance: json['balance'],
//       completedSurvey: json['completed_survey'],
//       image: json['image'],
//       address: json['address'] != null ? Address.fromJson(json['address']) : null,
//       status: json['status'],
//       ev: json['ev'],
//       sv: json['sv'],
//       rv: json['rv'],
//       verCode: json['ver_code'],
//       verCodeSendAt: json['ver_code_send_at'],
//       ts: json['ts'],
//       tv: json['tv'],
//       tsc: json['tsc'],
//       provider: json['provider'],
//       idProof: json['id_proof'],
//       addressProof: json['address_proof'],
//       providerId: json['provider_id'],
//       isCheck: json['is_check'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firstname': firstname,
//       'percentage': percentage,
//       'agent_id': agentId,
//       'lastname': lastname,
//       'username': username,
//       'email': email,
//       'mobile': mobile,
//       'whatsaap': whatsaap,
//       'gander': gander,
//       'marital': marital,
//       'dob': dob,
//       'occupation': occupation,
//       'anniversary_date': anniversaryDate,
//       'annual_income': annualIncome,
//       'pan': pan,
//       'account_number': accountNumber,
//       're_account_number': reAccountNumber,
//       'bank_ifsc': bankIfsc,
//       'age': age,
//       'profession': profession,
//       'ref_by': refBy,
//       'balance': balance,
//       'completed_survey': completedSurvey,
//       'image': image,
//       'address': address?.toJson(),
//       'status': status,
//       'ev': ev,
//       'sv': sv,
//       'rv': rv,
//       'ver_code': verCode,
//       'ver_code_send_at': verCodeSendAt,
//       'ts': ts,
//       'tv': tv,
//       'tsc': tsc,
//       'provider': provider,
//       'id_proof': idProof,
//       'address_proof': addressProof,
//       'provider_id': providerId,
//       'is_check': isCheck,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//     };
//   }
// }
//
// class Address {
//   String? address;
//   String? state;
//   String? zip;
//   String? country;
//   String? city;
//
//   Address({
//     this.address,
//     this.state,
//     this.zip,
//     this.country,
//     this.city,
//   });
//
//   factory Address.fromJson(dynamic json) {
//     return Address(
//       address: json['address'],
//       state: json['state'],
//       zip: json['zip'],
//       country: json['country'],
//       city: json['city'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'address': address,
//       'state': state,
//       'zip': zip,
//       'country': country,
//       'city': city,
//     };
//   }
// }
//
// class Surveys {
//   dynamic currentPage;
//   List<SurveyData>? data;
//   String? firstPageUrl;
//   dynamic from;
//   dynamic lastPage;
//   String? lastPageUrl;
//   String? nextPageUrl;
//   String? path;
//   dynamic perPage;
//   String? prevPageUrl;
//   dynamic to;
//   dynamic total;
//
//   Surveys({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   factory Surveys.fromJson(dynamic json) {
//     return Surveys(
//       currentPage: json['current_page'],
//       data: json['data'] != null
//           ? List<SurveyData>.from(json['data'].map((x) => SurveyData.fromJson(x)))
//           : null,
//       firstPageUrl: json['first_page_url'],
//       from: json['from'],
//       lastPage: json['last_page'],
//       lastPageUrl: json['last_page_url'],
//       nextPageUrl: json['next_page_url'],
//       path: json['path'],
//       perPage: json['per_page'],
//       prevPageUrl: json['prev_page_url'],
//       to: json['to'],
//       total: json['total'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'current_page': currentPage,
//       'data': data?.map((x) => x.toJson()).toList(),
//       'first_page_url': firstPageUrl,
//       'from': from,
//       'last_page': lastPage,
//       'last_page_url': lastPageUrl,
//       'next_page_url': nextPageUrl,
//       'path': path,
//       'per_page': perPage,
//       'prev_page_url': prevPageUrl,
//       'to': to,
//       'total': total,
//     };
//   }
// }
//
// class SurveyData {
//   dynamic id;
//   dynamic surveyorId;
//   dynamic adType;
//   dynamic totalprice;
//   dynamic totalWithoutGst;
//   String? txn;
//   dynamic perUser;
//   String? rejectAnswer;
//   String? pName;
//   String? pSpecification;
//   String? pMrp;
//   dynamic discount;
//   String? requiredData;
//   String? offerType;
//   dynamic totalViews;
//   String? publish;
//   dynamic targetMarketCategory;
//   dynamic totalSlides;
//   dynamic slidesTime;
//   dynamic adDuration;
//   dynamic onlinePurchase;
//   String? storeFile;
//   dynamic categoryId;
//   String? name;
//   String? image;
//   dynamic ageLimit;
//   dynamic repeatedViewers;
//   dynamic countryLimit;
//   dynamic startAge;
//   dynamic endAge;
//   String? country;
//   String? template;
//   dynamic status;
//   String? users;
//   dynamic targetMarketId;
//   String? createdAt;
//   String? updatedAt;
//   String? videoUrl;
//   String? scheduleAd;
//   String? purchasUrl;
//   String? postpaid;
//   Surveyor? surveyor;
//   Adtype? adtype;
//
//   SurveyData({
//     this.id,
//     this.surveyorId,
//     this.adType,
//     this.totalprice,
//     this.totalWithoutGst,
//     this.txn,
//     this.perUser,
//     this.rejectAnswer,
//     this.pName,
//     this.pSpecification,
//     this.pMrp,
//     this.discount,
//     this.requiredData,
//     this.offerType,
//     this.totalViews,
//     this.publish,
//     this.targetMarketCategory,
//     this.totalSlides,
//     this.slidesTime,
//     this.adDuration,
//     this.onlinePurchase,
//     this.storeFile,
//     this.categoryId,
//     this.name,
//     this.image,
//     this.ageLimit,
//     this.repeatedViewers,
//     this.countryLimit,
//     this.startAge,
//     this.endAge,
//     this.country,
//     this.template,
//     this.status,
//     this.users,
//     this.targetMarketId,
//     this.createdAt,
//     this.updatedAt,
//     this.videoUrl,
//     this.scheduleAd,
//     this.purchasUrl,
//     this.postpaid,
//     this.surveyor,
//     this.adtype,
//   });
//
//   factory SurveyData.fromJson(dynamic json) {
//     return SurveyData(
//       id: json['id'],
//       surveyorId: json['surveyor_id'],
//       adType: json['ad_type'],
//       totalprice: json['totalprice'],
//       totalWithoutGst: json['total_without_gst'],
//       txn: json['txn'],
//       perUser: json['per_user'],
//       rejectAnswer: json['reject_answer'],
//       pName: json['p_name'],
//       pSpecification: json['p_specification'],
//       pMrp: json['p_mrp'],
//       discount: json['discount'],
//       requiredData: json['required_data'],
//       offerType: json['offer_type'],
//       totalViews: json['total_views'],
//       publish: json['publish'],
//       targetMarketCategory: json['target_market_category'],
//       totalSlides: json['total_slides'],
//       slidesTime: json['slides_time'],
//       adDuration: json['ad_duration'],
//       onlinePurchase: json['online_purchase'],
//       storeFile: json['store_file'],
//       categoryId: json['category_id'],
//       name: json['name'],
//       image: json['image'],
//       ageLimit: json['age_limit'],
//       repeatedViewers: json['repeated_viewers'],
//       countryLimit: json['country_limit'],
//       startAge: json['start_age'],
//       endAge: json['end_age'],
//       country: json['country'],
//       template: json['template'],
//       status: json['status'],
//       users: json['users'],
//       targetMarketId: json['target_market_id'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       videoUrl: json['video_url'],
//       scheduleAd: json['schedule_ad'],
//       purchasUrl: json['purchas_url'],
//       postpaid: json['postpaid'],
//       surveyor: json['surveyor'] != null ? Surveyor.fromJson(json['surveyor']) : null,
//       adtype: json['adtype'] != null ? Adtype.fromJson(json['adtype']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'surveyor_id': surveyorId,
//       'ad_type': adType,
//       'totalprice': totalprice,
//       'total_without_gst': totalWithoutGst,
//       'txn': txn,
//       'per_user': perUser,
//       'reject_answer': rejectAnswer,
//       'p_name': pName,
//       'p_specification': pSpecification,
//       'p_mrp': pMrp,
//       'discount': discount,
//       'required_data': requiredData,
//       'offer_type': offerType,
//       'total_views': totalViews,
//       'publish': publish,
//       'target_market_category': targetMarketCategory,
//       'total_slides': totalSlides,
//       'slides_time': slidesTime,
//       'ad_duration': adDuration,
//       'online_purchase': onlinePurchase,
//       'store_file': storeFile,
//       'category_id': categoryId,
//       'name': name,
//       'image': image,
//       'age_limit': ageLimit,
//       'repeated_viewers': repeatedViewers,
//       'country_limit': countryLimit,
//       'start_age': startAge,
//       'end_age': endAge,
//       'country': country,
//       'template': template,
//       'status': status,
//       'users': users,
//       'target_market_id': targetMarketId,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'video_url': videoUrl,
//       'schedule_ad': scheduleAd,
//       'purchas_url': purchasUrl,
//       'postpaid': postpaid,
//       'surveyor': surveyor?.toJson(),
//       'adtype': adtype?.toJson(),
//     };
//   }
// }
//
// class Surveyor {
//   dynamic id;
//   String? userId;
//   String? firstname;
//   String? lastname;
//   String? username;
//   String? email;
//   String? mobile;
//   String? refBy;
//   String? balance;
//   String? image;
//   Address? address;
//   dynamic av;
//   dynamic status;
//   dynamic ev;
//   dynamic sv;
//   dynamic rv;
//   String? verCode;
//   String? verCodeSendAt;
//   dynamic ts;
//   dynamic tv;
//   String? tsc;
//   String? provider;
//   dynamic agentId;
//   dynamic providerId;
//   dynamic boughtViews;
//   dynamic totalViews;
//   dynamic postArrangement;
//   dynamic postArrangementMode;
//   String? postArrangementDoc;
//   String? createdAt;
//   String? updatedAt;
//   String? title;
//   dynamic businessCat;
//   String? businessSubcat;
//   String? profilingService;
//   dynamic multiLogin;
//   dynamic numLogin;
//   dynamic registrationFees;
//   String? firmName;
//   String? firmType;
//   String? firmGstin;
//   String? designation;
//   String? pan;
//   String? idProof;
//   String? addressProof;
//   String? optOutMsg;
//   dynamic isfirm;
//   String? creditAmount;
//   dynamic adminApprovedAmount;
//   String? billingDate;
//   String? prevBillingDate;
//   dynamic grossDay;
//   String? paymentDate;
//   dynamic depositeAmount;
//   String? isCheck;
//   String? accountState;
//   dynamic prepaidPostpaidStatus;
//   String? paymentDue;
//
//   Surveyor({
//     this.id,
//     this.userId,
//     this.firstname,
//     this.lastname,
//     this.username,
//     this.email,
//     this.mobile,
//     this.refBy,
//     this.balance,
//     this.image,
//     this.address,
//     this.av,
//     this.status,
//     this.ev,
//     this.sv,
//     this.rv,
//     this.verCode,
//     this.verCodeSendAt,
//     this.ts,
//     this.tv,
//     this.tsc,
//     this.provider,
//     this.agentId,
//     this.providerId,
//     this.boughtViews,
//     this.totalViews,
//     this.postArrangement,
//     this.postArrangementMode,
//     this.postArrangementDoc,
//     this.createdAt,
//     this.updatedAt,
//     this.title,
//     this.businessCat,
//     this.businessSubcat,
//     this.profilingService,
//     this.multiLogin,
//     this.numLogin,
//     this.registrationFees,
//     this.firmName,
//     this.firmType,
//     this.firmGstin,
//     this.designation,
//     this.pan,
//     this.idProof,
//     this.addressProof,
//     this.optOutMsg,
//     this.isfirm,
//     this.creditAmount,
//     this.adminApprovedAmount,
//     this.billingDate,
//     this.prevBillingDate,
//     this.grossDay,
//     this.paymentDate,
//     this.depositeAmount,
//     this.isCheck,
//     this.accountState,
//     this.prepaidPostpaidStatus,
//     this.paymentDue,
//   });
//
//   factory Surveyor.fromJson(dynamic json) {
//     return Surveyor(
//       id: json['id'],
//       userId: json['user_id'],
//       firstname: json['firstname'],
//       lastname: json['lastname'],
//       username: json['username'],
//       email: json['email'],
//       mobile: json['mobile'],
//       refBy: json['ref_by'],
//       balance: json['balance'],
//       image: json['image'],
//       address: json['address'] != null ? Address.fromJson(json['address']) : null,
//       av: json['av'],
//       status: json['status'],
//       ev: json['ev'],
//       sv: json['sv'],
//       rv: json['rv'],
//       verCode: json['ver_code'],
//       verCodeSendAt: json['ver_code_send_at'],
//       ts: json['ts'],
//       tv: json['tv'],
//       tsc: json['tsc'],
//       provider: json['provider'],
//       agentId: json['agent_id'],
//       providerId: json['provider_id'],
//       boughtViews: json['bought_views'],
//       totalViews: json['total_views'],
//       postArrangement: json['post_arrangement'],
//       postArrangementMode: json['post_arrangement_mode'],
//       postArrangementDoc: json['post_arrangement_doc'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       title: json['title'],
//       businessCat: json['business_cat'],
//       businessSubcat: json['business_subcat'],
//       profilingService: json['profiling_service'],
//       multiLogin: json['multi_login'],
//       numLogin: json['num_login'],
//       registrationFees: json['registration_fees'],
//       firmName: json['firm_name'],
//       firmType: json['firm_type'],
//       firmGstin: json['firm_gstin'],
//       designation: json['designation'],
//       pan: json['pan'],
//       idProof: json['id_proof'],
//       addressProof: json['address_proof'],
//       optOutMsg: json['opt_out_msg'],
//       isfirm: json['isfirm'],
//       creditAmount: json['credit_amount'],
//       adminApprovedAmount: json['admin_approved_amount'],
//       billingDate: json['billing_date'],
//       prevBillingDate: json['prev_billing_date'],
//       grossDay: json['gross_day'],
//       paymentDate: json['payment_date'],
//       depositeAmount: json['deposite_amount'],
//       isCheck: json['is_check'],
//       accountState: json['account_state'],
//       prepaidPostpaidStatus: json['prepaid_postpaid_status'],
//       paymentDue: json['payment_due'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'firstname': firstname,
//       'lastname': lastname,
//       'username': username,
//       'email': email,
//       'mobile': mobile,
//       'ref_by': refBy,
//       'balance': balance,
//       'image': image,
//       'address': address?.toJson(),
//       'av': av,
//       'status': status,
//       'ev': ev,
//       'sv': sv,
//       'rv': rv,
//       'ver_code': verCode,
//       'ver_code_send_at': verCodeSendAt,
//       'ts': ts,
//       'tv': tv,
//       'tsc': tsc,
//       'provider': provider,
//       'agent_id': agentId,
//       'provider_id': providerId,
//       'bought_views': boughtViews,
//       'total_views': totalViews,
//       'post_arrangement': postArrangement,
//       'post_arrangement_mode': postArrangementMode,
//       'post_arrangement_doc': postArrangementDoc,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'title': title,
//       'business_cat': businessCat,
//       'business_subcat': businessSubcat,
//       'profiling_service': profilingService,
//       'multi_login': multiLogin,
//       'num_login': numLogin,
//       'registration_fees': registrationFees,
//       'firm_name': firmName,
//       'firm_type': firmType,
//       'firm_gstin': firmGstin,
//       'designation': designation,
//       'pan': pan,
//       'id_proof': idProof,
//       'address_proof': addressProof,
//       'opt_out_msg': optOutMsg,
//       'isfirm': isfirm,
//       'credit_amount': creditAmount,
//       'admin_approved_amount': adminApprovedAmount,
//       'billing_date': billingDate,
//       'prev_billing_date': prevBillingDate,
//       'gross_day': grossDay,
//       'payment_date': paymentDate,
//       'deposite_amount': depositeAmount,
//       'is_check': isCheck,
//       'account_state': accountState,
//       'prepaid_postpaid_status': prepaidPostpaidStatus,
//       'payment_due': paymentDue,
//     };
//   }
// }
//
// class Adtype {
//   dynamic id;
//   String? type;
//
//   Adtype({
//     this.id,
//     this.type,
//   });
//
//   factory Adtype.fromJson(dynamic json) {
//     return Adtype(
//       id: json['id'],
//       type: json['type'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'type': type,
//     };
//   }
// }



// To parse this JSON data, do
//
//     final userRadigonePointModel = userRadigonePointModelFromJson(jsonString);

import 'dart:convert';

UserRadigonePointModel userRadigonePointModelFromJson(String str) => UserRadigonePointModel.fromJson(json.decode(str));

String userRadigonePointModelToJson(UserRadigonePointModel data) => json.encode(data.toJson());

class UserRadigonePointModel {
  bool? success;
  String? message;
  User? user;
  int? totalWithdraw;
  int? totalTransaction;
  List<dynamic>? withdrawChartData;
  Surveys? surveys;
  String? emptyMessage;

  UserRadigonePointModel({
    this.success,
    this.message,
    this.user,
    this.totalWithdraw,
    this.totalTransaction,
    this.withdrawChartData,
    this.surveys,
    this.emptyMessage,
  });

  UserRadigonePointModel copyWith({
    bool? success,
    String? message,
    User? user,
    int? totalWithdraw,
    int? totalTransaction,
    List<dynamic>? withdrawChartData,
    Surveys? surveys,
    String? emptyMessage,
  }) =>
      UserRadigonePointModel(
        success: success ?? this.success,
        message: message ?? this.message,
        user: user ?? this.user,
        totalWithdraw: totalWithdraw ?? this.totalWithdraw,
        totalTransaction: totalTransaction ?? this.totalTransaction,
        withdrawChartData: withdrawChartData ?? this.withdrawChartData,
        surveys: surveys ?? this.surveys,
        emptyMessage: emptyMessage ?? this.emptyMessage,
      );

  factory UserRadigonePointModel.fromJson(Map<String, dynamic> json) => UserRadigonePointModel(
    success: json["success"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    totalWithdraw: json["totalWithdraw"],
    totalTransaction: json["totalTransaction"],
    withdrawChartData: json["withdraw_chart_data"] == null ? [] : List<dynamic>.from(json["withdraw_chart_data"]!.map((x) => x)),
    surveys: json["surveys"] == null ? null : Surveys.fromJson(json["surveys"]),
    emptyMessage: json["empty_message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user?.toJson(),
    "totalWithdraw": totalWithdraw,
    "totalTransaction": totalTransaction,
    "withdraw_chart_data": withdrawChartData == null ? [] : List<dynamic>.from(withdrawChartData!.map((x) => x)),
    "surveys": surveys?.toJson(),
    "empty_message": emptyMessage,
  };
}

class Surveys {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Surveys({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Surveys copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      Surveys(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Surveys.fromJson(Map<String, dynamic> json) => Surveys(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int? id;
  int? surveyorId;
  int? adType;
  int? totalprice;
  int? totalWithoutGst;
  String? txn;
  int? perUser;
  dynamic rejectAnswer;
  String? pName;
  String? pSpecification;
  String? pMrp;
  int? discount;
  String? requiredData;
  String? offerType;
  int? totalViews;
  String? publish;
  dynamic targetMarketCategory;
  int? totalSlides;
  int? slidesTime;
  int? adDuration;
  int? onlinePurchase;
  String? storeFile;
  int? categoryId;
  dynamic name;
  String? image;
  int? ageLimit;
  int? repeatedViewers;
  int? countryLimit;
  dynamic startAge;
  dynamic endAge;
  dynamic country;
  dynamic template;
  int? status;
  dynamic users;
  dynamic targetMarketId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? videoUrl;
  String? scheduleAd;
  dynamic purchasUrl;
  String? postpaid;
  Surveyor? surveyor;
  Adtype? adtype;

  Datum({
    this.id,
    this.surveyorId,
    this.adType,
    this.totalprice,
    this.totalWithoutGst,
    this.txn,
    this.perUser,
    this.rejectAnswer,
    this.pName,
    this.pSpecification,
    this.pMrp,
    this.discount,
    this.requiredData,
    this.offerType,
    this.totalViews,
    this.publish,
    this.targetMarketCategory,
    this.totalSlides,
    this.slidesTime,
    this.adDuration,
    this.onlinePurchase,
    this.storeFile,
    this.categoryId,
    this.name,
    this.image,
    this.ageLimit,
    this.repeatedViewers,
    this.countryLimit,
    this.startAge,
    this.endAge,
    this.country,
    this.template,
    this.status,
    this.users,
    this.targetMarketId,
    this.createdAt,
    this.updatedAt,
    this.videoUrl,
    this.scheduleAd,
    this.purchasUrl,
    this.postpaid,
    this.surveyor,
    this.adtype,
  });

  Datum copyWith({
    int? id,
    int? surveyorId,
    int? adType,
    int? totalprice,
    int? totalWithoutGst,
    String? txn,
    int? perUser,
    dynamic rejectAnswer,
    String? pName,
    String? pSpecification,
    String? pMrp,
    int? discount,
    String? requiredData,
    String? offerType,
    int? totalViews,
    String? publish,
    dynamic targetMarketCategory,
    int? totalSlides,
    int? slidesTime,
    int? adDuration,
    int? onlinePurchase,
    String? storeFile,
    int? categoryId,
    dynamic name,
    String? image,
    int? ageLimit,
    int? repeatedViewers,
    int? countryLimit,
    dynamic startAge,
    dynamic endAge,
    dynamic country,
    dynamic template,
    int? status,
    dynamic users,
    dynamic targetMarketId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? videoUrl,
    String? scheduleAd,
    dynamic purchasUrl,
    String? postpaid,
    Surveyor? surveyor,
    Adtype? adtype,
  }) =>
      Datum(
        id: id ?? this.id,
        surveyorId: surveyorId ?? this.surveyorId,
        adType: adType ?? this.adType,
        totalprice: totalprice ?? this.totalprice,
        totalWithoutGst: totalWithoutGst ?? this.totalWithoutGst,
        txn: txn ?? this.txn,
        perUser: perUser ?? this.perUser,
        rejectAnswer: rejectAnswer ?? this.rejectAnswer,
        pName: pName ?? this.pName,
        pSpecification: pSpecification ?? this.pSpecification,
        pMrp: pMrp ?? this.pMrp,
        discount: discount ?? this.discount,
        requiredData: requiredData ?? this.requiredData,
        offerType: offerType ?? this.offerType,
        totalViews: totalViews ?? this.totalViews,
        publish: publish ?? this.publish,
        targetMarketCategory: targetMarketCategory ?? this.targetMarketCategory,
        totalSlides: totalSlides ?? this.totalSlides,
        slidesTime: slidesTime ?? this.slidesTime,
        adDuration: adDuration ?? this.adDuration,
        onlinePurchase: onlinePurchase ?? this.onlinePurchase,
        storeFile: storeFile ?? this.storeFile,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        image: image ?? this.image,
        ageLimit: ageLimit ?? this.ageLimit,
        repeatedViewers: repeatedViewers ?? this.repeatedViewers,
        countryLimit: countryLimit ?? this.countryLimit,
        startAge: startAge ?? this.startAge,
        endAge: endAge ?? this.endAge,
        country: country ?? this.country,
        template: template ?? this.template,
        status: status ?? this.status,
        users: users ?? this.users,
        targetMarketId: targetMarketId ?? this.targetMarketId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        videoUrl: videoUrl ?? this.videoUrl,
        scheduleAd: scheduleAd ?? this.scheduleAd,
        purchasUrl: purchasUrl ?? this.purchasUrl,
        postpaid: postpaid ?? this.postpaid,
        surveyor: surveyor ?? this.surveyor,
        adtype: adtype ?? this.adtype,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    surveyorId: json["surveyor_id"],
    adType: json["ad_type"],
    totalprice: json["totalprice"],
    totalWithoutGst: json["total_without_gst"],
    txn: json["txn"],
    perUser: json["per_user"],
    rejectAnswer: json["reject_answer"],
    pName: json["p_name"],
    pSpecification: json["p_specification"],
    pMrp: json["p_mrp"],
    discount: json["discount"],
    requiredData: json["required_data"],
    offerType: json["offer_type"],
    totalViews: json["total_views"],
    publish: json["publish"],
    targetMarketCategory: json["target_market_category"],
    totalSlides: json["total_slides"],
    slidesTime: json["slides_time"],
    adDuration: json["ad_duration"],
    onlinePurchase: json["online_purchase"],
    storeFile: json["store_file"],
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
    ageLimit: json["age_limit"],
    repeatedViewers: json["repeated_viewers"],
    countryLimit: json["country_limit"],
    startAge: json["start_age"],
    endAge: json["end_age"],
    country: json["country"],
    template: json["template"],
    status: json["status"],
    users: json["users"],
    targetMarketId: json["target_market_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    videoUrl: json["video_url"],
    scheduleAd: json["schedule_ad"],
    purchasUrl: json["purchas_url"],
    postpaid: json["postpaid"],
    surveyor: json["surveyor"] == null ? null : Surveyor.fromJson(json["surveyor"]),
    adtype: json["adtype"] == null ? null : Adtype.fromJson(json["adtype"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "surveyor_id": surveyorId,
    "ad_type": adType,
    "totalprice": totalprice,
    "total_without_gst": totalWithoutGst,
    "txn": txn,
    "per_user": perUser,
    "reject_answer": rejectAnswer,
    "p_name": pName,
    "p_specification": pSpecification,
    "p_mrp": pMrp,
    "discount": discount,
    "required_data": requiredData,
    "offer_type": offerType,
    "total_views": totalViews,
    "publish": publish,
    "target_market_category": targetMarketCategory,
    "total_slides": totalSlides,
    "slides_time": slidesTime,
    "ad_duration": adDuration,
    "online_purchase": onlinePurchase,
    "store_file": storeFile,
    "category_id": categoryId,
    "name": name,
    "image": image,
    "age_limit": ageLimit,
    "repeated_viewers": repeatedViewers,
    "country_limit": countryLimit,
    "start_age": startAge,
    "end_age": endAge,
    "country": country,
    "template": template,
    "status": status,
    "users": users,
    "target_market_id": targetMarketId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "video_url": videoUrl,
    "schedule_ad": scheduleAd,
    "purchas_url": purchasUrl,
    "postpaid": postpaid,
    "surveyor": surveyor?.toJson(),
    "adtype": adtype?.toJson(),
  };
}

class Adtype {
  int? id;
  String? name;
  int? price;
  int? order;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Adtype({
    this.id,
    this.name,
    this.price,
    this.order,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Adtype copyWith({
    int? id,
    String? name,
    int? price,
    int? order,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Adtype(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        order: order ?? this.order,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Adtype.fromJson(Map<String, dynamic> json) => Adtype(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    order: json["order"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "order": order,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Surveyor {
  int? id;
  String? userId;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? mobile;
  dynamic refBy;
  String? balance;
  String? image;
  Address? address;
  int? av;
  int? status;
  int? ev;
  int? sv;
  int? rv;
  String? verCode;
  DateTime? verCodeSendAt;
  int? ts;
  int? tv;
  dynamic tsc;
  dynamic provider;
  int? agentId;
  dynamic providerId;
  int? boughtViews;
  int? totalViews;
  int? postArrangement;
  int? postArrangementMode;
  String? postArrangementDoc;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  int? businessCat;
  String? businessSubcat;
  String? profilingService;
  int? multiLogin;
  int? numLogin;
  int? registrationFees;
  String? firmName;
  String? firmType;
  String? firmGstin;
  String? designation;
  String? pan;
  String? idProof;
  String? addressProof;
  String? optOutMsg;
  int? isfirm;
  String? creditAmount;
  String? adminApprovedAmount;
  String? billingDate;
  dynamic prevBillingDate;
  int? grossDay;
  dynamic paymentDate;
  int? depositeAmount;
  int? isCheck;
  dynamic accountState;
  int? prepaidPostpaidStatus;
  dynamic paymentDue;

  Surveyor({
    this.id,
    this.userId,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.mobile,
    this.refBy,
    this.balance,
    this.image,
    this.address,
    this.av,
    this.status,
    this.ev,
    this.sv,
    this.rv,
    this.verCode,
    this.verCodeSendAt,
    this.ts,
    this.tv,
    this.tsc,
    this.provider,
    this.agentId,
    this.providerId,
    this.boughtViews,
    this.totalViews,
    this.postArrangement,
    this.postArrangementMode,
    this.postArrangementDoc,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.businessCat,
    this.businessSubcat,
    this.profilingService,
    this.multiLogin,
    this.numLogin,
    this.registrationFees,
    this.firmName,
    this.firmType,
    this.firmGstin,
    this.designation,
    this.pan,
    this.idProof,
    this.addressProof,
    this.optOutMsg,
    this.isfirm,
    this.creditAmount,
    this.adminApprovedAmount,
    this.billingDate,
    this.prevBillingDate,
    this.grossDay,
    this.paymentDate,
    this.depositeAmount,
    this.isCheck,
    this.accountState,
    this.prepaidPostpaidStatus,
    this.paymentDue,
  });

  Surveyor copyWith({
    int? id,
    String? userId,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? mobile,
    dynamic refBy,
    String? balance,
    String? image,
    Address? address,
    int? av,
    int? status,
    int? ev,
    int? sv,
    int? rv,
    String? verCode,
    DateTime? verCodeSendAt,
    int? ts,
    int? tv,
    dynamic tsc,
    dynamic provider,
    int? agentId,
    dynamic providerId,
    int? boughtViews,
    int? totalViews,
    int? postArrangement,
    int? postArrangementMode,
    String? postArrangementDoc,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    int? businessCat,
    String? businessSubcat,
    String? profilingService,
    int? multiLogin,
    int? numLogin,
    int? registrationFees,
    String? firmName,
    String? firmType,
    String? firmGstin,
    String? designation,
    String? pan,
    String? idProof,
    String? addressProof,
    String? optOutMsg,
    int? isfirm,
    String? creditAmount,
    String? adminApprovedAmount,
    String? billingDate,
    dynamic prevBillingDate,
    int? grossDay,
    dynamic paymentDate,
    int? depositeAmount,
    int? isCheck,
    dynamic accountState,
    int? prepaidPostpaidStatus,
    dynamic paymentDue,
  }) =>
      Surveyor(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        refBy: refBy ?? this.refBy,
        balance: balance ?? this.balance,
        image: image ?? this.image,
        address: address ?? this.address,
        av: av ?? this.av,
        status: status ?? this.status,
        ev: ev ?? this.ev,
        sv: sv ?? this.sv,
        rv: rv ?? this.rv,
        verCode: verCode ?? this.verCode,
        verCodeSendAt: verCodeSendAt ?? this.verCodeSendAt,
        ts: ts ?? this.ts,
        tv: tv ?? this.tv,
        tsc: tsc ?? this.tsc,
        provider: provider ?? this.provider,
        agentId: agentId ?? this.agentId,
        providerId: providerId ?? this.providerId,
        boughtViews: boughtViews ?? this.boughtViews,
        totalViews: totalViews ?? this.totalViews,
        postArrangement: postArrangement ?? this.postArrangement,
        postArrangementMode: postArrangementMode ?? this.postArrangementMode,
        postArrangementDoc: postArrangementDoc ?? this.postArrangementDoc,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title,
        businessCat: businessCat ?? this.businessCat,
        businessSubcat: businessSubcat ?? this.businessSubcat,
        profilingService: profilingService ?? this.profilingService,
        multiLogin: multiLogin ?? this.multiLogin,
        numLogin: numLogin ?? this.numLogin,
        registrationFees: registrationFees ?? this.registrationFees,
        firmName: firmName ?? this.firmName,
        firmType: firmType ?? this.firmType,
        firmGstin: firmGstin ?? this.firmGstin,
        designation: designation ?? this.designation,
        pan: pan ?? this.pan,
        idProof: idProof ?? this.idProof,
        addressProof: addressProof ?? this.addressProof,
        optOutMsg: optOutMsg ?? this.optOutMsg,
        isfirm: isfirm ?? this.isfirm,
        creditAmount: creditAmount ?? this.creditAmount,
        adminApprovedAmount: adminApprovedAmount ?? this.adminApprovedAmount,
        billingDate: billingDate ?? this.billingDate,
        prevBillingDate: prevBillingDate ?? this.prevBillingDate,
        grossDay: grossDay ?? this.grossDay,
        paymentDate: paymentDate ?? this.paymentDate,
        depositeAmount: depositeAmount ?? this.depositeAmount,
        isCheck: isCheck ?? this.isCheck,
        accountState: accountState ?? this.accountState,
        prepaidPostpaidStatus: prepaidPostpaidStatus ?? this.prepaidPostpaidStatus,
        paymentDue: paymentDue ?? this.paymentDue,
      );

  factory Surveyor.fromJson(Map<String, dynamic> json) => Surveyor(
    id: json["id"],
    userId: json["user_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    refBy: json["ref_by"],
    balance: json["balance"],
    image: json["image"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    av: json["av"],
    status: json["status"],
    ev: json["ev"],
    sv: json["sv"],
    rv: json["rv"],
    verCode: json["ver_code"],
    verCodeSendAt: json["ver_code_send_at"] == null ? null : DateTime.parse(json["ver_code_send_at"]),
    ts: json["ts"],
    tv: json["tv"],
    tsc: json["tsc"],
    provider: json["provider"],
    agentId: json["agent_id"],
    providerId: json["provider_id"],
    boughtViews: json["bought_views"],
    totalViews: json["total_views"],
    postArrangement: json["post_arrangement"],
    postArrangementMode: json["post_arrangement_mode"],
    postArrangementDoc: json["post_arrangement_doc"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    title: json["title"],
    businessCat: json["business_cat"],
    businessSubcat: json["business_subcat"],
    profilingService: json["profiling_service"],
    multiLogin: json["multi_login"],
    numLogin: json["num_login"],
    registrationFees: json["registration_fees"],
    firmName: json["firm_name"],
    firmType: json["firm_type"],
    firmGstin: json["firm_gstin"],
    designation: json["designation"],
    pan: json["pan"],
    idProof: json["id_proof"],
    addressProof: json["address_proof"],
    optOutMsg: json["opt_out_msg"],
    isfirm: json["isfirm"],
    creditAmount: json["credit_amount"],
    adminApprovedAmount: json["admin_approved_amount"],
    billingDate: json["billing_date"],
    prevBillingDate: json["prev_billing_date"],
    grossDay: json["gross_day"],
    paymentDate: json["payment_date"],
    depositeAmount: json["deposite_amount"],
    isCheck: json["is_check"],
    accountState: json["account_state"],
    prepaidPostpaidStatus: json["prepaid_postpaid_status"],
    paymentDue: json["payment_due"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
    "email": email,
    "mobile": mobile,
    "ref_by": refBy,
    "balance": balance,
    "image": image,
    "address": address?.toJson(),
    "av": av,
    "status": status,
    "ev": ev,
    "sv": sv,
    "rv": rv,
    "ver_code": verCode,
    "ver_code_send_at": verCodeSendAt?.toIso8601String(),
    "ts": ts,
    "tv": tv,
    "tsc": tsc,
    "provider": provider,
    "agent_id": agentId,
    "provider_id": providerId,
    "bought_views": boughtViews,
    "total_views": totalViews,
    "post_arrangement": postArrangement,
    "post_arrangement_mode": postArrangementMode,
    "post_arrangement_doc": postArrangementDoc,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "title": title,
    "business_cat": businessCat,
    "business_subcat": businessSubcat,
    "profiling_service": profilingService,
    "multi_login": multiLogin,
    "num_login": numLogin,
    "registration_fees": registrationFees,
    "firm_name": firmName,
    "firm_type": firmType,
    "firm_gstin": firmGstin,
    "designation": designation,
    "pan": pan,
    "id_proof": idProof,
    "address_proof": addressProof,
    "opt_out_msg": optOutMsg,
    "isfirm": isfirm,
    "credit_amount": creditAmount,
    "admin_approved_amount": adminApprovedAmount,
    "billing_date": billingDate,
    "prev_billing_date": prevBillingDate,
    "gross_day": grossDay,
    "payment_date": paymentDate,
    "deposite_amount": depositeAmount,
    "is_check": isCheck,
    "account_state": accountState,
    "prepaid_postpaid_status": prepaidPostpaidStatus,
    "payment_due": paymentDue,
  };
}

class Address {
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.zip,
    this.country,
  });

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? zip,
    String? country,
  }) =>
      Address(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        zip: zip ?? this.zip,
        country: country ?? this.country,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "state": state,
    "zip": zip,
    "country": country,
  };
}

class User {
  int? id;
  String? firstname;
  int? percentage;
  dynamic agentId;
  String? lastname;
  String? username;
  String? email;
  String? mobile;
  String? whatsaap;
  String? gander;
  String? marital;
  DateTime? dob;
  String? occupation;
  DateTime? anniversaryDate;
  String? annualIncome;
  String? pan;
  String? accountNumber;
  String? reAccountNumber;
  String? bankIfsc;
  int? age;
  String? profession;
  dynamic refBy;
  String? balance;
  int? completedSurvey;
  String? image;
  Address? address;
  int? status;
  int? ev;
  int? sv;
  int? rv;
  String? verCode;
  DateTime? verCodeSendAt;
  int? ts;
  int? tv;
  String? tsc;
  dynamic provider;
  String? idProof;
  String? addressProof;
  dynamic providerId;
  int? isCheck;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.firstname,
    this.percentage,
    this.agentId,
    this.lastname,
    this.username,
    this.email,
    this.mobile,
    this.whatsaap,
    this.gander,
    this.marital,
    this.dob,
    this.occupation,
    this.anniversaryDate,
    this.annualIncome,
    this.pan,
    this.accountNumber,
    this.reAccountNumber,
    this.bankIfsc,
    this.age,
    this.profession,
    this.refBy,
    this.balance,
    this.completedSurvey,
    this.image,
    this.address,
    this.status,
    this.ev,
    this.sv,
    this.rv,
    this.verCode,
    this.verCodeSendAt,
    this.ts,
    this.tv,
    this.tsc,
    this.provider,
    this.idProof,
    this.addressProof,
    this.providerId,
    this.isCheck,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? id,
    String? firstname,
    int? percentage,
    dynamic agentId,
    String? lastname,
    String? username,
    String? email,
    String? mobile,
    String? whatsaap,
    String? gander,
    String? marital,
    DateTime? dob,
    String? occupation,
    DateTime? anniversaryDate,
    String? annualIncome,
    String? pan,
    String? accountNumber,
    String? reAccountNumber,
    String? bankIfsc,
    int? age,
    String? profession,
    dynamic refBy,
    String? balance,
    int? completedSurvey,
    String? image,
    Address? address,
    int? status,
    int? ev,
    int? sv,
    int? rv,
    String? verCode,
    DateTime? verCodeSendAt,
    int? ts,
    int? tv,
    String? tsc,
    dynamic provider,
    String? idProof,
    String? addressProof,
    dynamic providerId,
    int? isCheck,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        percentage: percentage ?? this.percentage,
        agentId: agentId ?? this.agentId,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        whatsaap: whatsaap ?? this.whatsaap,
        gander: gander ?? this.gander,
        marital: marital ?? this.marital,
        dob: dob ?? this.dob,
        occupation: occupation ?? this.occupation,
        anniversaryDate: anniversaryDate ?? this.anniversaryDate,
        annualIncome: annualIncome ?? this.annualIncome,
        pan: pan ?? this.pan,
        accountNumber: accountNumber ?? this.accountNumber,
        reAccountNumber: reAccountNumber ?? this.reAccountNumber,
        bankIfsc: bankIfsc ?? this.bankIfsc,
        age: age ?? this.age,
        profession: profession ?? this.profession,
        refBy: refBy ?? this.refBy,
        balance: balance ?? this.balance,
        completedSurvey: completedSurvey ?? this.completedSurvey,
        image: image ?? this.image,
        address: address ?? this.address,
        status: status ?? this.status,
        ev: ev ?? this.ev,
        sv: sv ?? this.sv,
        rv: rv ?? this.rv,
        verCode: verCode ?? this.verCode,
        verCodeSendAt: verCodeSendAt ?? this.verCodeSendAt,
        ts: ts ?? this.ts,
        tv: tv ?? this.tv,
        tsc: tsc ?? this.tsc,
        provider: provider ?? this.provider,
        idProof: idProof ?? this.idProof,
        addressProof: addressProof ?? this.addressProof,
        providerId: providerId ?? this.providerId,
        isCheck: isCheck ?? this.isCheck,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstname: json["firstname"],
    percentage: json["percentage"],
    agentId: json["agent_id"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    whatsaap: json["whatsaap"],
    gander: json["gander"],
    marital: json["marital"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    occupation: json["occupation"],
    anniversaryDate: json["anniversary_date"] == null ? null : DateTime.parse(json["anniversary_date"]),
    annualIncome: json["annual_income"],
    pan: json["pan"],
    accountNumber: json["account_number"],
    reAccountNumber: json["re_account_number"],
    bankIfsc: json["bank_ifsc"],
    age: json["age"],
    profession: json["profession"],
    refBy: json["ref_by"],
    balance: json["balance"],
    completedSurvey: json["completed_survey"],
    image: json["image"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    status: json["status"],
    ev: json["ev"],
    sv: json["sv"],
    rv: json["rv"],
    verCode: json["ver_code"],
    verCodeSendAt: json["ver_code_send_at"] == null ? null : DateTime.parse(json["ver_code_send_at"]),
    ts: json["ts"],
    tv: json["tv"],
    tsc: json["tsc"],
    provider: json["provider"],
    idProof: json["id_proof"],
    addressProof: json["address_proof"],
    providerId: json["provider_id"],
    isCheck: json["is_check"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "percentage": percentage,
    "agent_id": agentId,
    "lastname": lastname,
    "username": username,
    "email": email,
    "mobile": mobile,
    "whatsaap": whatsaap,
    "gander": gander,
    "marital": marital,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "occupation": occupation,
    "anniversary_date": "${anniversaryDate!.year.toString().padLeft(4, '0')}-${anniversaryDate!.month.toString().padLeft(2, '0')}-${anniversaryDate!.day.toString().padLeft(2, '0')}",
    "annual_income": annualIncome,
    "pan": pan,
    "account_number": accountNumber,
    "re_account_number": reAccountNumber,
    "bank_ifsc": bankIfsc,
    "age": age,
    "profession": profession,
    "ref_by": refBy,
    "balance": balance,
    "completed_survey": completedSurvey,
    "image": image,
    "address": address?.toJson(),
    "status": status,
    "ev": ev,
    "sv": sv,
    "rv": rv,
    "ver_code": verCode,
    "ver_code_send_at": verCodeSendAt?.toIso8601String(),
    "ts": ts,
    "tv": tv,
    "tsc": tsc,
    "provider": provider,
    "id_proof": idProof,
    "address_proof": addressProof,
    "provider_id": providerId,
    "is_check": isCheck,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
