import 'package:flutter/material.dart';


class alert_success {
  alertSuccess(BuildContext context) {
    var snackBar = SnackBar(content: Text("Plase Enter Data"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}
