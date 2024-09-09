class allTicketModel {
  bool? status;
  List<Data>? data;
  String? message;

  allTicketModel({this.status, this.data, this.message});

  allTicketModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic sId;
  dynamic userId;
  LotteryId? lotteryId;
  dynamic lotteryDrawId;
  dynamic ticketNumber;
  dynamic status;
  dynamic createdAt;
  dynamic iV;
  dynamic lotteryPriceId;

  Data(
      {this.sId,
        this.userId,
        this.lotteryId,
        this.lotteryDrawId,
        this.ticketNumber,
        this.status,
        this.createdAt,
        this.iV,
        this.lotteryPriceId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    lotteryId = json['lottery_id'] != null
        ? new LotteryId.fromJson(json['lottery_id'])
        : null;
    lotteryDrawId = json['lottery_draw_id'];
    ticketNumber = json['ticketNumber'];
    status = json['status'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    lotteryPriceId = json['lottery_price_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    if (this.lotteryId != null) {
      data['lottery_id'] = this.lotteryId!.toJson();
    }
    data['lottery_draw_id'] = this.lotteryDrawId;
    data['ticketNumber'] = this.ticketNumber;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['lottery_price_id'] = this.lotteryPriceId;
    return data;
  }
}

class LotteryId {
  String? sId;
  String? userId;
  String? name;
  int? price;
  int? totalDraw;
  int? repeatDraw;
  int? iV;

  LotteryId(
      {this.sId,
        this.userId,
        this.name,
        this.price,
        this.totalDraw,
        this.repeatDraw,
        this.iV});

  LotteryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    name = json['name'];
    price = json['price'];
    totalDraw = json['totalDraw'];
    repeatDraw = json['repeatDraw'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['totalDraw'] = this.totalDraw;
    data['repeatDraw'] = this.repeatDraw;
    data['__v'] = this.iV;
    return data;
  }
}
