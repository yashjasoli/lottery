import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thai_lottery/main.dart';

class NetworkHttp {
  static String baseUrl = "https://thailottery.onrender.com/api/user/";
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var headers2 = {'Authorization': 'Bearer $token'};

  login(String email, String password) async {
    print(headers);
    final body = {"email": email, "password": password};
    debugPrint(body.toString());
    final responce = await http.post(Uri.parse("${baseUrl}login"), body: body);

    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  deposit(String amount, String utr) async {
    final body = {"amount": amount, "UTR": utr};
    final responce = await http.post(Uri.parse("${baseUrl}payment/deposit"),
        body: body, headers: headers2);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  withdraw(String amount, String utr) async {
    final body = {"amount": amount, "upi_id": utr};
    final responce = await http.post(Uri.parse("${baseUrl}payment/withdraw"),
        body: body, headers: headers2);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  update(String email, String mobileNo, String name) async {
    final body = {"email": email, "mobile_No": mobileNo, "name": name};
    final responce = await http.put(Uri.parse("${baseUrl}profile/update"),
        body: body, headers: headers2);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  passwordUpdate(String newPassword, String confirmPassword) async {
    final body = {
      "newPassword": newPassword,
      "confirmPassword": confirmPassword
    };
    final responce = await http.put(Uri.parse("${baseUrl}password-update"),
        body: body, headers: headers2);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  changeContry(String currencyCode) async {
    final body = {
      "currency_code": currencyCode,
    };
    final responce = await http.post(Uri.parse("${baseUrl}change-currency"),
        body: body, headers: headers2);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  buyLottery(String lotteryId, List<String> ticketNumbers) async {
    Map<String, dynamic> body = {
      "lottery_id": lotteryId,
      "ticket_number": ticketNumbers, // Pass ticketNumbers as an array.
    };
    final String bodyJson = json.encode(body);
    final responce = await http.post(
      Uri.parse("${baseUrl}lottery/buy-lottery"),
      body: bodyJson, // Pass the encoded JSON string.
      headers: {
        "Content-Type": "application/json", // Set content type to JSON.
        ...headers2, // Keep the other headers if needed.
      },
    );

    // debugPrint request data and response.
    debugPrint(body.toString());
    debugPrint("response ${responce.body}  -- ${responce.statusCode}");

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
    final responce =
        await http.post(Uri.parse("${baseUrl}register"), body: body);
    debugPrint(body.toString());
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  logout() async {
    final responce = await http.get(
      Uri.parse("${baseUrl}logout"),
    );
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  depositHistory() async {
    final responce = await http
        .get(Uri.parse("${baseUrl}payment/deposit-history"), headers: headers);
    debugPrint("$headers");
    debugPrint("responce ${responce.body}");
    return json.decode(responce.body);
  }

  ticketNumber() async {
    final responce = await http
        .get(Uri.parse("${baseUrl}lottery/ticket-number"), headers: headers);
    debugPrint(" ---------- $headers");
    debugPrint("responce ${responce.body} --- ${responce.statusCode}");
    return json.decode(responce.body);
  }

  withdrawHistory() async {
    final responce = await http
        .get(Uri.parse("${baseUrl}payment/withdraw-history"), headers: headers);
    debugPrint("${baseUrl}payment/withdraw-history");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  letestdraw() async {
    final responce = await http.get(Uri.parse("${baseUrl}lottery/letestdraw"),
        headers: headers);
    debugPrint("${baseUrl}payment/withdraw-history");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  allLottery() async {
    print("allLottery");
    final responce = await http
        .get(Uri.parse("${baseUrl}lottery/all-lotteries"), headers: headers);
    debugPrint(headers.toString());
    debugPrint("${baseUrl}lottery/all-lotteries");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  lotteryDetails(String id) async {
    final responce = await http.get(Uri.parse("${baseUrl}lottery/details/$id"),
        headers: headers);
    debugPrint(headers.toString());
    debugPrint("${baseUrl}lottery/all-lotteries");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  allTicket() async {
    final responce = await http.get(Uri.parse("${baseUrl}lottery/all-ticket"),
        headers: headers);
    debugPrint("${baseUrl}payment/withdraw-history");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }
  userData() async {
    final responce = await http.get(Uri.parse("${baseUrl}profile"),
        headers: headers);
    debugPrint("${baseUrl}profile");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }

  pendingTicket() async {
    final responce = await http
        .get(Uri.parse("${baseUrl}lottery/pending-ticket"), headers: headers);
    debugPrint("${baseUrl}payment/withdraw-history");
    debugPrint("responce  ${responce.body}");
    return json.decode(responce.body);
  }
}
