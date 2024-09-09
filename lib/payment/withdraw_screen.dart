import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/network_http.dart';

import '../main.dart';
import '../utility/requad_box.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  NetworkHttp networkHtttp = NetworkHttp();
  TextEditingController UTRController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Withdraw',
                  style: GoogleFonts.aclonica(
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: textcolor_cust2)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: seconderycolor_cust.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: UTRController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "Enter Your PromptPay / UPI ID",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: primarycolor_cust),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: seconderycolor_cust.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: primarycolor_cust),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      amountController.text = "200";
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: toolbarcolor_lang, width: 2),
                          color: amountController.text != "200"
                              ? Colors.white
                              : toolbarcolor_lang),
                      child: Center(
                        child: Text(
                          "200",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: amountController.text == "200"
                                  ? Colors.black
                                  : seconderycolor_cust),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      amountController.text = "500";
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: toolbarcolor_lang, width: 2),
                          color: amountController.text != "500"
                              ? Colors.white
                              : toolbarcolor_lang),
                      child: Center(
                        child: Text(
                          "500",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: amountController.text == "500"
                                  ? Colors.black
                                  : seconderycolor_cust),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      amountController.text = "1000";
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: toolbarcolor_lang, width: 2),
                          color: amountController.text != "1000"
                              ? Colors.white
                              : toolbarcolor_lang),
                      child: Center(
                        child: Text(
                          "1000",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: amountController.text == "1000"
                                  ? Colors.black
                                  : seconderycolor_cust),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          if (double.parse(balance) < double.parse(amountController.text)) {
            print("Please velid amount");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please Enter valid amount")));
          } else {
            if (amountController.text.isEmpty || UTRController.text.isEmpty) {
              alert_success().alertSuccess(context);
            } else {
              await networkHtttp.withdraw(
                  amountController.text, UTRController.text);
              amountController.clear();
              UTRController.clear();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
            }
          }
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: primarycolor_cust,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Withdraw NOW",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
