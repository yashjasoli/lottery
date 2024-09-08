
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class progressdialog_custom extends StatefulWidget {
    @override
    _progressdialog_customState createState() => _progressdialog_customState();
  }

  class _progressdialog_customState extends State<progressdialog_custom> {

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 80.0,
              child: Lottie.network(
                "https://lottie.host/9a708eae-f5b4-4bec-b20f-964fb913011a/8e86oYCOpN.json"),
            ),
          ),
        ),
      );
    }
  }
