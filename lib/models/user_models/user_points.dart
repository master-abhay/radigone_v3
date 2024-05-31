class UserPointsModel {
  bool? success;
  int? status;
  String? message;
  String? data;

  UserPointsModel({this.success, this.status, this.message, this.data});

  UserPointsModel.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
