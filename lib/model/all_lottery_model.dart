class AllLottery {
  bool? status;
  List<Data>? data;
  String? message;

  AllLottery({this.status, this.data, this.message});

  AllLottery.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? userId;
  String? name;
  int? price;
  int? totalDraw;
  int? repeatDraw;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.name,
        this.price,
        this.totalDraw,
        this.repeatDraw,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
