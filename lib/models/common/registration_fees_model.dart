/// status : "ok"
/// registrationFees : 1000

class RegistrationFeesModel {
  RegistrationFeesModel({
      String? status, 
      num? registrationFees,}){
    _status = status;
    _registrationFees = registrationFees;
}

  RegistrationFeesModel.fromJson(dynamic json) {
    _status = json['status'];
    _registrationFees = json['registrationFees'];
  }
  String? _status;
  num? _registrationFees;
RegistrationFeesModel copyWith({  String? status,
  num? registrationFees,
}) => RegistrationFeesModel(  status: status ?? _status,
  registrationFees: registrationFees ?? _registrationFees,
);
  String? get status => _status;
  num? get registrationFees => _registrationFees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['registrationFees'] = _registrationFees;
    return map;
  }

}