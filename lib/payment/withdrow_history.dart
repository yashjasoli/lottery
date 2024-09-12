import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/model/DepositHistoryModel.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/no_data.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';

import '../local/app_localizations.dart';
import '../utility/colors.dart';

class WithdrowHistory extends StatefulWidget {
  const WithdrowHistory({super.key});

  @override
  State<WithdrowHistory> createState() => _WithdrowHistoryState();
}

class _WithdrowHistoryState extends State<WithdrowHistory> {
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
    Map<String, dynamic> data = await networkHtttp.withdrawHistory();
    depositHistoryModel = DepositHistoryModel.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: isLoading == true
          ? progressdialog_custom()
          : RefreshIndicator(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      AppLocalizations.of(context)!.translate('Withdraw History')!,
                      style: GoogleFonts.aclonica(
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: textcolor_cust2)),
                    ),
                    SizedBox(
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
                                      /*Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Gateway",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                              Text("PayPal",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(height: 15,),*/
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)!.translate("Amount")!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: primarycolor_cust),
                                          ),
                                          Text(
                                            depositHistoryModel
                                                .data![index].amount
                                                .toString(),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)!.translate("Status")!,
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: Center(
                                              child: Text(
                                                depositHistoryModel
                                                    .data![index].status!
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: primarycolor_cust,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
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
