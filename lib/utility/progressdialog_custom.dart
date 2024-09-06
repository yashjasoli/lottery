
import 'package:flutter/material.dart';

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
              width: 60.0,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }
  }
