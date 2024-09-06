import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Text('Orders',style: GoogleFonts.aclonica(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: textcolor_cust2)),),
            SizedBox(height: 10,),
            ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: toolbarcolor_lang,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(18),
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "No.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Lottery Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                              Text(
                                "Thai Lottery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Tickets",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                              Text(
                                "8534760282",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Status",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                              Container(
                                height: 25,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0xffEDF7EE),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.green)),
                                child: Center(
                                  child: Text(
                                    "COMPLATED",
                                    style: TextStyle(
                                        color: primarycolor_cust,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
