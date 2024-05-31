import 'dart:convert';

class UserRadigonePointModel {
  bool? success;
  String? message;
  User? user;
  dynamic totalWithdraw;
  dynamic totalTransaction;
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

  factory UserRadigonePointModel.fromJson(dynamic json) {
    return UserRadigonePointModel(
      success: json['success'],
      message: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      totalWithdraw: json['totalWithdraw'],
      totalTransaction: json['totalTransaction'],
      withdrawChartData: json['withdraw_chart_data'] != null ? List<dynamic>.from(json['withdraw_chart_data']) : null,
      surveys: json['surveys'] != null ? Surveys.fromJson(json['surveys']) : null,
      emptyMessage: json['empty_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'user': user?.toJson(),
      'totalWithdraw': totalWithdraw,
      'totalTransaction': totalTransaction,
      'withdraw_chart_data': withdrawChartData,
      'surveys': surveys?.toJson(),
      'empty_message': emptyMessage,
    };
  }
}

class User {
  dynamic id;
  String? firstname;
  dynamic percentage;
  dynamic agentId;
  String? lastname;
  String? username;
  String? email;
  String? mobile;
  String? whatsaap;
  String? gander;
  String? marital;
  String? dob;
  String? occupation;
  String? anniversaryDate;
  String? annualIncome;
  String? pan;
  String? accountNumber;
  String? reAccountNumber;
  String? bankIfsc;
  dynamic age;
  String? profession;
  String? refBy;
  String? balance;
  dynamic completedSurvey;
  String? image;
  Address? address;
  dynamic status;
  dynamic ev;
  dynamic sv;
  dynamic rv;
  String? verCode;
  String? verCodeSendAt;
  dynamic ts;
  dynamic tv;
  String? tsc;
  String? provider;
  String? idProof;
  String? addressProof;
  dynamic providerId;
  dynamic isCheck;
  String? createdAt;
  String? updatedAt;

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

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      percentage: json['percentage'],
      agentId: json['agent_id'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      whatsaap: json['whatsaap'],
      gander: json['gander'],
      marital: json['marital'],
      dob: json['dob'],
      occupation: json['occupation'],
      anniversaryDate: json['anniversary_date'],
      annualIncome: json['annual_income'],
      pan: json['pan'],
      accountNumber: json['account_number'],
      reAccountNumber: json['re_account_number'],
      bankIfsc: json['bank_ifsc'],
      age: json['age'],
      profession: json['profession'],
      refBy: json['ref_by'],
      balance: json['balance'],
      completedSurvey: json['completed_survey'],
      image: json['image'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      status: json['status'],
      ev: json['ev'],
      sv: json['sv'],
      rv: json['rv'],
      verCode: json['ver_code'],
      verCodeSendAt: json['ver_code_send_at'],
      ts: json['ts'],
      tv: json['tv'],
      tsc: json['tsc'],
      provider: json['provider'],
      idProof: json['id_proof'],
      addressProof: json['address_proof'],
      providerId: json['provider_id'],
      isCheck: json['is_check'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'percentage': percentage,
      'agent_id': agentId,
      'lastname': lastname,
      'username': username,
      'email': email,
      'mobile': mobile,
      'whatsaap': whatsaap,
      'gander': gander,
      'marital': marital,
      'dob': dob,
      'occupation': occupation,
      'anniversary_date': anniversaryDate,
      'annual_income': annualIncome,
      'pan': pan,
      'account_number': accountNumber,
      're_account_number': reAccountNumber,
      'bank_ifsc': bankIfsc,
      'age': age,
      'profession': profession,
      'ref_by': refBy,
      'balance': balance,
      'completed_survey': completedSurvey,
      'image': image,
      'address': address?.toJson(),
      'status': status,
      'ev': ev,
      'sv': sv,
      'rv': rv,
      'ver_code': verCode,
      'ver_code_send_at': verCodeSendAt,
      'ts': ts,
      'tv': tv,
      'tsc': tsc,
      'provider': provider,
      'id_proof': idProof,
      'address_proof': addressProof,
      'provider_id': providerId,
      'is_check': isCheck,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Address {
  String? address;
  String? state;
  String? zip;
  String? country;
  String? city;

  Address({
    this.address,
    this.state,
    this.zip,
    this.country,
    this.city,
  });

  factory Address.fromJson(dynamic json) {
    return Address(
      address: json['address'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'state': state,
      'zip': zip,
      'country': country,
      'city': city,
    };
  }
}

class Surveys {
  dynamic currentPage;
  List<SurveyData>? data;
  String? firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  dynamic perPage;
  String? prevPageUrl;
  dynamic to;
  dynamic total;

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

  factory Surveys.fromJson(dynamic json) {
    return Surveys(
      currentPage: json['current_page'],
      data: json['data'] != null
          ? List<SurveyData>.from(json['data'].map((x) => SurveyData.fromJson(x)))
          : null,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': data?.map((x) => x.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }
}

class SurveyData {
  dynamic id;
  dynamic surveyorId;
  dynamic adType;
  dynamic totalprice;
  dynamic totalWithoutGst;
  String? txn;
  dynamic perUser;
  String? rejectAnswer;
  String? pName;
  String? pSpecification;
  String? pMrp;
  dynamic discount;
  String? requiredData;
  String? offerType;
  dynamic totalViews;
  String? publish;
  dynamic targetMarketCategory;
  dynamic totalSlides;
  dynamic slidesTime;
  dynamic adDuration;
  dynamic onlinePurchase;
  String? storeFile;
  dynamic categoryId;
  String? name;
  String? image;
  dynamic ageLimit;
  dynamic repeatedViewers;
  dynamic countryLimit;
  dynamic startAge;
  dynamic endAge;
  String? country;
  String? template;
  dynamic status;
  String? users;
  dynamic targetMarketId;
  String? createdAt;
  String? updatedAt;
  String? videoUrl;
  String? scheduleAd;
  String? purchasUrl;
  String? postpaid;
  Surveyor? surveyor;
  Adtype? adtype;

  SurveyData({
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

  factory SurveyData.fromJson(dynamic json) {
    return SurveyData(
      id: json['id'],
      surveyorId: json['surveyor_id'],
      adType: json['ad_type'],
      totalprice: json['totalprice'],
      totalWithoutGst: json['total_without_gst'],
      txn: json['txn'],
      perUser: json['per_user'],
      rejectAnswer: json['reject_answer'],
      pName: json['p_name'],
      pSpecification: json['p_specification'],
      pMrp: json['p_mrp'],
      discount: json['discount'],
      requiredData: json['required_data'],
      offerType: json['offer_type'],
      totalViews: json['total_views'],
      publish: json['publish'],
      targetMarketCategory: json['target_market_category'],
      totalSlides: json['total_slides'],
      slidesTime: json['slides_time'],
      adDuration: json['ad_duration'],
      onlinePurchase: json['online_purchase'],
      storeFile: json['store_file'],
      categoryId: json['category_id'],
      name: json['name'],
      image: json['image'],
      ageLimit: json['age_limit'],
      repeatedViewers: json['repeated_viewers'],
      countryLimit: json['country_limit'],
      startAge: json['start_age'],
      endAge: json['end_age'],
      country: json['country'],
      template: json['template'],
      status: json['status'],
      users: json['users'],
      targetMarketId: json['target_market_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      videoUrl: json['video_url'],
      scheduleAd: json['schedule_ad'],
      purchasUrl: json['purchas_url'],
      postpaid: json['postpaid'],
      surveyor: json['surveyor'] != null ? Surveyor.fromJson(json['surveyor']) : null,
      adtype: json['adtype'] != null ? Adtype.fromJson(json['adtype']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'surveyor_id': surveyorId,
      'ad_type': adType,
      'totalprice': totalprice,
      'total_without_gst': totalWithoutGst,
      'txn': txn,
      'per_user': perUser,
      'reject_answer': rejectAnswer,
      'p_name': pName,
      'p_specification': pSpecification,
      'p_mrp': pMrp,
      'discount': discount,
      'required_data': requiredData,
      'offer_type': offerType,
      'total_views': totalViews,
      'publish': publish,
      'target_market_category': targetMarketCategory,
      'total_slides': totalSlides,
      'slides_time': slidesTime,
      'ad_duration': adDuration,
      'online_purchase': onlinePurchase,
      'store_file': storeFile,
      'category_id': categoryId,
      'name': name,
      'image': image,
      'age_limit': ageLimit,
      'repeated_viewers': repeatedViewers,
      'country_limit': countryLimit,
      'start_age': startAge,
      'end_age': endAge,
      'country': country,
      'template': template,
      'status': status,
      'users': users,
      'target_market_id': targetMarketId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'video_url': videoUrl,
      'schedule_ad': scheduleAd,
      'purchas_url': purchasUrl,
      'postpaid': postpaid,
      'surveyor': surveyor?.toJson(),
      'adtype': adtype?.toJson(),
    };
  }
}

class Surveyor {
  dynamic id;
  String? userId;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? mobile;
  String? refBy;
  String? balance;
  String? image;
  Address? address;
  dynamic av;
  dynamic status;
  dynamic ev;
  dynamic sv;
  dynamic rv;
  String? verCode;
  String? verCodeSendAt;
  dynamic ts;
  dynamic tv;
  String? tsc;
  String? provider;
  dynamic agentId;
  dynamic providerId;
  dynamic boughtViews;
  dynamic totalViews;
  dynamic postArrangement;
  dynamic postArrangementMode;
  String? postArrangementDoc;
  String? createdAt;
  String? updatedAt;
  String? title;
  dynamic businessCat;
  String? businessSubcat;
  String? profilingService;
  dynamic multiLogin;
  dynamic numLogin;
  dynamic registrationFees;
  String? firmName;
  String? firmType;
  String? firmGstin;
  String? designation;
  String? pan;
  String? idProof;
  String? addressProof;
  String? optOutMsg;
  dynamic isfirm;
  String? creditAmount;
  dynamic adminApprovedAmount;
  String? billingDate;
  String? prevBillingDate;
  dynamic grossDay;
  String? paymentDate;
  dynamic depositeAmount;
  String? isCheck;
  String? accountState;
  dynamic prepaidPostpaidStatus;
  String? paymentDue;

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

  factory Surveyor.fromJson(dynamic json) {
    return Surveyor(
      id: json['id'],
      userId: json['user_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      refBy: json['ref_by'],
      balance: json['balance'],
      image: json['image'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      av: json['av'],
      status: json['status'],
      ev: json['ev'],
      sv: json['sv'],
      rv: json['rv'],
      verCode: json['ver_code'],
      verCodeSendAt: json['ver_code_send_at'],
      ts: json['ts'],
      tv: json['tv'],
      tsc: json['tsc'],
      provider: json['provider'],
      agentId: json['agent_id'],
      providerId: json['provider_id'],
      boughtViews: json['bought_views'],
      totalViews: json['total_views'],
      postArrangement: json['post_arrangement'],
      postArrangementMode: json['post_arrangement_mode'],
      postArrangementDoc: json['post_arrangement_doc'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      businessCat: json['business_cat'],
      businessSubcat: json['business_subcat'],
      profilingService: json['profiling_service'],
      multiLogin: json['multi_login'],
      numLogin: json['num_login'],
      registrationFees: json['registration_fees'],
      firmName: json['firm_name'],
      firmType: json['firm_type'],
      firmGstin: json['firm_gstin'],
      designation: json['designation'],
      pan: json['pan'],
      idProof: json['id_proof'],
      addressProof: json['address_proof'],
      optOutMsg: json['opt_out_msg'],
      isfirm: json['isfirm'],
      creditAmount: json['credit_amount'],
      adminApprovedAmount: json['admin_approved_amount'],
      billingDate: json['billing_date'],
      prevBillingDate: json['prev_billing_date'],
      grossDay: json['gross_day'],
      paymentDate: json['payment_date'],
      depositeAmount: json['deposite_amount'],
      isCheck: json['is_check'],
      accountState: json['account_state'],
      prepaidPostpaidStatus: json['prepaid_postpaid_status'],
      paymentDue: json['payment_due'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'mobile': mobile,
      'ref_by': refBy,
      'balance': balance,
      'image': image,
      'address': address?.toJson(),
      'av': av,
      'status': status,
      'ev': ev,
      'sv': sv,
      'rv': rv,
      'ver_code': verCode,
      'ver_code_send_at': verCodeSendAt,
      'ts': ts,
      'tv': tv,
      'tsc': tsc,
      'provider': provider,
      'agent_id': agentId,
      'provider_id': providerId,
      'bought_views': boughtViews,
      'total_views': totalViews,
      'post_arrangement': postArrangement,
      'post_arrangement_mode': postArrangementMode,
      'post_arrangement_doc': postArrangementDoc,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'title': title,
      'business_cat': businessCat,
      'business_subcat': businessSubcat,
      'profiling_service': profilingService,
      'multi_login': multiLogin,
      'num_login': numLogin,
      'registration_fees': registrationFees,
      'firm_name': firmName,
      'firm_type': firmType,
      'firm_gstin': firmGstin,
      'designation': designation,
      'pan': pan,
      'id_proof': idProof,
      'address_proof': addressProof,
      'opt_out_msg': optOutMsg,
      'isfirm': isfirm,
      'credit_amount': creditAmount,
      'admin_approved_amount': adminApprovedAmount,
      'billing_date': billingDate,
      'prev_billing_date': prevBillingDate,
      'gross_day': grossDay,
      'payment_date': paymentDate,
      'deposite_amount': depositeAmount,
      'is_check': isCheck,
      'account_state': accountState,
      'prepaid_postpaid_status': prepaidPostpaidStatus,
      'payment_due': paymentDue,
    };
  }
}

class Adtype {
  dynamic id;
  String? type;

  Adtype({
    this.id,
    this.type,
  });

  factory Adtype.fromJson(dynamic json) {
    return Adtype(
      id: json['id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }
}
