class AllLottery {
  dynamic status;
  List<Data>? data;
  dynamic message;

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
  dynamic sId;
  dynamic userId;
  dynamic name;
  dynamic price;
  dynamic totalDraw;
  dynamic repeatDraw;
  dynamic iV;
  LotteryDraw? lotteryDraw;
  List<Winner>? winner;

  Data(
      {this.sId,
        this.userId,
        this.name,
        this.price,
        this.totalDraw,
        this.repeatDraw,
        this.iV,
        this.lotteryDraw,
        this.winner});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    name = json['name'];
    price = json['price'];
    totalDraw = json['totalDraw'];
    repeatDraw = json['repeatDraw'];
    iV = json['__v'];

    lotteryDraw = json['lottery_draw'] != null
        ? LotteryDraw.fromJson(json['lottery_draw'])
        : null;

    if (json['winner'] != null) {
      winner = <Winner>[];
      // Check if json['winner'] is a List
      if (json['winner'] is List) {
        // Use the correct type for each item in the List
        (json['winner'] as List<dynamic>).forEach((item) {
          if (item is Map<String, dynamic>) {
            winner!.add(Winner.fromJson(item));
          } else {
            // Handle unexpected item type
            print('Unexpected item type in winner list');
          }
        });
      } else {
        print('Unexpected type for winner field');
      }
    }
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
    if (this.lotteryDraw != null) {
      data['lottery_draw'] = this.lotteryDraw!.toJson();
    }
    if (this.winner != null) {
      data['winner'] = this.winner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LotteryDraw {
  dynamic sId;
  dynamic lotteryId;
  dynamic startDate;
  dynamic drawDate;
  dynamic status;
  dynamic iV;

  LotteryDraw(
      {this.sId,
        this.lotteryId,
        this.startDate,
        this.drawDate,
        this.status,
        this.iV});

  LotteryDraw.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lotteryId = json['lottery_id'];
    startDate = json['startDate'];
    drawDate = json['drawDate'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lottery_id'] = this.lotteryId;
    data['startDate'] = this.startDate;
    data['drawDate'] = this.drawDate;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class Winner {
  dynamic sId;
  UserId? userId;
  dynamic lotteryId;
  dynamic lotteryDrawId;
  dynamic ticketNumber;
  dynamic status;
  dynamic createdAt;
  dynamic iV;
  dynamic lotteryPriceId;

  Winner(
      {this.sId,
        this.userId,
        this.lotteryId,
        this.lotteryDrawId,
        this.ticketNumber,
        this.status,
        this.createdAt,
        this.iV,
        this.lotteryPriceId});

  Winner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
    json['user_id'] != null ? new UserId.fromJson(json['user_id']) : null;
    lotteryId = json['lottery_id'];
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
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['lottery_id'] = this.lotteryId;
    data['lottery_draw_id'] = this.lotteryDrawId;
    data['ticketNumber'] = this.ticketNumber;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['lottery_price_id'] = this.lotteryPriceId;
    return data;
  }
}

class UserId {
  dynamic sId;
  dynamic name;
  dynamic email;
  dynamic balance;
  dynamic role;
  dynamic loggedIn;
  dynamic mobileNo;
  dynamic country;
  dynamic language;
  dynamic currencyCode;
  dynamic createdAt;
  dynamic prince;
  dynamic iV;

  UserId(
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
        this.prince,
        this.iV});

  UserId.fromJson(Map<String, dynamic> json) {
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
    prince = json['price'];
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
    data['price'] = this.prince;
    data['__v'] = this.iV;
    return data;
  }
}
