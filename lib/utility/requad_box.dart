import 'package:flutter/material.dart';

import 'colors.dart';

class alert_success {
  alertSuccess(BuildContext context) {
    var snackBar = SnackBar(
      content: Text("Please Enter Data"),
      behavior: SnackBarBehavior.floating,
    backgroundColor: primarycolor_cust,
    hitTestBehavior: HitTestBehavior.opaque,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
