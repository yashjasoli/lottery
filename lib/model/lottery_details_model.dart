class LotteryDetailsModel {
  bool? status;
  Data? data;
  String? message;

  LotteryDetailsModel({this.status, this.data, this.message});

  LotteryDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic winningPrice;
  dynamic totalDraw;
  dynamic price;
  dynamic drawDate;

  Data({this.winningPrice, this.totalDraw, this.price, this.drawDate});

  Data.fromJson(Map<String, dynamic> json) {
    winningPrice = json['winning_price'];
    totalDraw = json['total_draw'];
    price = json['price'];
    drawDate = json['draw_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winning_price'] = this.winningPrice;
    data['total_draw'] = this.totalDraw;
    data['price'] = this.price;
    data['draw_date'] = this.drawDate;
    return data;
  }
}
