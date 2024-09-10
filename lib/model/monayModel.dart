class MonayModel {
  bool? status;
  Data? data;
  String? message;

  MonayModel({this.status, this.data, this.message});

  MonayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  double? balance;
  String? role;
  bool? loggedIn;
  int? mobileNo;
  String? country;
  String? language;
  int? currencyCode;
  String? createdAt;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.balance,
        this.role,
        this.loggedIn,
        this.mobileNo,
        this.country,
        this.language,
        this.currencyCode,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    balance = json['balance'];
    role = json['role'];
    loggedIn = json['loggedIn'];
    mobileNo = json['mobile_No'];
    country = json['country'];
    language = json['language'];
    currencyCode = json['currency_code'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['role'] = this.role;
    data['loggedIn'] = this.loggedIn;
    data['mobile_No'] = this.mobileNo;
    data['country'] = this.country;
    data['language'] = this.language;
    data['currency_code'] = this.currencyCode;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
