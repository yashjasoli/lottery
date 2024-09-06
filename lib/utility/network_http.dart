import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHtttp {
  static String baseUrl = "https://thailottery.onrender.com/api/user/";

  login(String email, String password) async {
    final body = {"email": email, "password": password};
    final responce = await http.post(Uri.parse(baseUrl + "login"), body: body);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }
  deposit(String amount, String utr) async {
    final body = {"amount": amount, "UTR": utr};
    final responce = await http.post(Uri.parse(baseUrl + "payment/deposit"), body: body);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }
  update(String email, String mobile_No,String name) async {
    final body = {"email": email, "mobile_No": mobile_No,"name":name};
    final responce = await http.post(Uri.parse(baseUrl + "profile/update"), body: body);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }
  register(String email, String password,String name,number) async {
    final body = {
      "name":name,
      "email":email,
      "mobile_No":number,
      "country":"India",
      "password":password
    };
    final responce = await http.post(Uri.parse(baseUrl + "register"), body: body);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  logout() async {
    final responce = await http.get(Uri.parse(baseUrl + "logout"),);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  deposit_history() async {
    final responce = await http.get(
      Uri.parse(baseUrl + "payment/deposit-history"),
    );
    print("${baseUrl}");
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  withdraw_history() async {
    final responce = await http.get(
      Uri.parse(baseUrl + "payment/withdraw-history"),
    );
    print("${baseUrl + "payment/withdraw-history"}");
    print("responce  ${responce.body}");
    return json.decode(responce.body);
  }
}
