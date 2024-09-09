class LoginModel {
  bool? status;
  Data? data;
  String? token;

  LoginModel({this.status, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic balance;
  dynamic role;
  bool? loggedIn;
  dynamic mobileNo;
  dynamic country;
  dynamic password;
  dynamic language;
  dynamic currencyCode;
  dynamic createdAt;
  dynamic iV;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.balance,
        this.role,
        this.loggedIn,
        this.mobileNo,
        this.country,
        this.password,
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
    password = json['password'];
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
    data['password'] = this.password;
    data['language'] = this.language;
    data['currency_code'] = this.currencyCode;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
