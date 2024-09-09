import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataAvaible extends StatefulWidget {
  const NoDataAvaible({super.key});

  @override
  State<NoDataAvaible> createState() => _NoDataAvaibleState();
}

class _NoDataAvaibleState extends State<NoDataAvaible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://lottie.host/7b49ef40-240e-463b-82f5-03945e19f38a/zFUNyQg7qp.json",
            height: 500),
      ),
    );
  }
}
