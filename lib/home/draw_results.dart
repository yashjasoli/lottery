import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';

class DrawResuits extends StatefulWidget {
  const DrawResuits({super.key});

  @override
  State<DrawResuits> createState() => _DrawResuitsState();
}

class _DrawResuitsState extends State<DrawResuits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'DRAW RESULTS',
                  style: GoogleFonts.aclonica(
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: textcolor_cust2)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Feiday, 5 July 2024",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textcolor_cust2),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "MAIN DRAW",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "33",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "20",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "72",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "87",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "39",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 3, top: 3),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "29",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "TOTAL WINNERS:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: primarycolor_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "3000",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "TOTAL PRIZES:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: primarycolor_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "THB 268,298",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HOME  /  ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primarycolor_cust),
                  ),
                  Text(
                    "THAI LOTTERY",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ic_number_2,
                        scale: 4.0,
                      ),
                      Text(
                        "Abir",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Score 0",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ic_number_1,
                        scale: 3.9,
                      ),
                      Text(
                        "John",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Score 4.5",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ic_number_3,
                        scale: 4.0,
                      ),
                      Text(
                        "Stal",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Score 0",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                  itemCount: 12,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: toolbarcolor_lang,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        onTap: () {
                          showSuccess();
                        },
                        leading: CircleAvatar(
                          backgroundColor: primarycolor_cust,
                          child: Image.asset(ic_drinc,scale: 3,),
                        ),
                        title: Text(
                          "MD NAZIM",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primarycolor_cust),
                        ),
                        subtitle: Text(
                          "nazimsat786@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: greycolor_cust),
                        ),
                        trailing: Text(
                          "Score 0",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: greycolor_cust),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  showSuccess() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                  "https://lottie.host/d4c8c6b9-20c7-4727-9557-095cbe00baee/7yFUw1WtVB.json",height: 200),
              Text(
                "Success",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "You have successfully purchased 2 Tickets",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: primarycolor_cust,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showClecel() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                  "https://lottie.host/b0cd5755-f656-42de-9aa3-2540bc731ea9/6bZ8ikv3ga.json",height: 200),
              Text(
                "Insufficient \nBalance",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Purchasing failed please deposit money",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: primarycolor_cust,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Go To Deposit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
