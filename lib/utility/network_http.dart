import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thai_lottery/main.dart';

class NetworkHtttp {
  static String baseUrl = "https://thailottery.onrender.com/api/user/";
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': '.....',
    'Cookie': 'token=$token'
  };
  var headers2 = {'Authorization': '.....', 'Cookie': 'token=$token'};

  login(String email, String password) async {
    final body = {"email": email, "password": password};
    final responce = await http.post(Uri.parse(baseUrl + "login"), body: body);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  deposit(String amount, String utr) async {
    final body = {"amount": amount, "UTR": utr};
    final responce = await http.post(Uri.parse(baseUrl + "payment/deposit"),
        body: body, headers: headers2);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  withdraw(String amount, String utr) async {
    final body = {"amount": amount, "UTR": utr};
    final responce = await http.post(Uri.parse(baseUrl + "payment/withdraw"),
        body: body, headers: headers2);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  update(String email, String mobile_No, String name) async {
    final body = {"email": email, "mobile_No": mobile_No, "name": name};
    final responce = await http.put(Uri.parse(baseUrl + "profile/update"),
        body: body, headers: headers2);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  register(String email, String password, String name, number) async {
    final body = {
      "name": name,
      "email": email,
      "mobile_No": number,
      "country": "India",
      "password": password
    };
    final responce = await http.post(Uri.parse(baseUrl + "register"),
        body: body, headers: headers);
    print(body);
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  logout() async {
    final responce = await http.get(
      Uri.parse(baseUrl + "logout"),
    );
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  deposit_history() async {
    final responce = await http
        .get(Uri.parse(baseUrl + "payment/deposit-history"), headers: headers);
    print("${headers}");
    print("responce ${responce.body}");
    return json.decode(responce.body);
  }

  withdraw_history() async {
    final responce = await http
        .get(Uri.parse(baseUrl + "payment/withdraw-history"), headers: headers);
    print("${baseUrl + "payment/withdraw-history"}");
    print("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  all_ticket() async {
    final responce = await http.get(Uri.parse(baseUrl + "lottery/all-ticket"),
        headers: headers);
    print("${baseUrl + "payment/withdraw-history"}");
    print("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  pending_ticket() async {
    final responce = await http
        .get(Uri.parse(baseUrl + "lottery/pending-ticket"), headers: headers);
    print("${baseUrl + "payment/withdraw-history"}");
    print("responce  ${responce.body}");
    return json.decode(responce.body);
  }
}
