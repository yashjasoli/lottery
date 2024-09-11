import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/model/DepositHistoryModel.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/no_data.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';

class DepositHistory extends StatefulWidget {
  const DepositHistory({super.key});

  @override
  State<DepositHistory> createState() => _DepositHistoryState();
}

class _DepositHistoryState extends State<DepositHistory> {
  bool isLoading = true;
  NetworkHttp networkHtttp = NetworkHttp();
  late DepositHistoryModel depositHistoryModel;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> data = await networkHtttp.depositHistory();
    depositHistoryModel = DepositHistoryModel.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBars(),
      drawer: const drower(),
      body: isLoading == true
          ? progressdialog_custom()
          : RefreshIndicator(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Deposite History',
                      style: GoogleFonts.aclonica(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: textcolor_cust2)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    depositHistoryModel.data!.length < 1
                        ? Center(child: NoDataAvaible())
                        : ListView.builder(
                            itemCount: depositHistoryModel.data!.length,
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
                                      /* Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Gateway",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: primarycolor_cust),
                                    ),
                                    Text(
                                      "RazorPay",
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
                                ),*/
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const Text(
                                            "Amount",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: primarycolor_cust),
                                          ),
                                          Text(
                                            depositHistoryModel
                                                .data![index].amount
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: primarycolor_cust),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const Text(
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
                                                color: const Color(0xffEDF7EE),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: Center(
                                              child: Text(
                                                depositHistoryModel
                                                    .data![index].status!
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: primarycolor_cust,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
              onRefresh: () async {
                getdata();
              },
            ),
    );
  }
}
