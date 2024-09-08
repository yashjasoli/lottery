class DepositHistoryModel {
  bool? status;
  List<Data>? data;
  String? message;

  DepositHistoryModel({this.status, this.data, this.message});

  DepositHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  int? amount;
  int? uTR;
  dynamic upiId;
  int? currencyCode;
  String? status;
  String? paymentType;
  String? actionStatus;
  String? createdAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.amount,
        this.uTR,
        this.upiId,
        this.currencyCode,
        this.status,
        this.paymentType,
        this.actionStatus,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    amount = json['amount'];
    uTR = json['UTR'];
    upiId = json['upi_id'];
    currencyCode = json['currency_code'];
    status = json['status'];
    paymentType = json['payment_type'];
    actionStatus = json['action_status'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['UTR'] = this.uTR;
    data['upi_id'] = this.upiId;
    data['currency_code'] = this.currencyCode;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['action_status'] = this.actionStatus;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
