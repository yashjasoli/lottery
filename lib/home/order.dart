import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/no_data.dart';

import '../model/all_ticket_model.dart';
import '../utility/network_http.dart';
import '../utility/progressdialog_custom.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  allTicketModel _ticketModel = allTicketModel();
  NetworkHttp networkHtttp = NetworkHttp();
  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
     _isLoading = true;
    Map<String, dynamic> data = await networkHtttp.pendingTicket();
    _ticketModel = allTicketModel.fromJson(data);
    _isLoading = false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true
          ? progressdialog_custom()
          : RefreshIndicator(
            onRefresh: () async {
              getData();
            },
            child: SingleChildScrollView(
                    child: _ticketModel.data!.length < 0 ? NoDataAvaible() :   Column(
            children: <Widget>[
              const SizedBox(height: 50,),
              Text('Orders',style: GoogleFonts.aclonica(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: textcolor_cust2)),),
              const SizedBox(height: 10,),
              ListView.builder(
                  itemCount: _ticketModel.data!.length,
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
                                const Text(
                                  "No.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: primarycolor_cust),
                                ),
                                Text(
                                "${index + 1}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  "Lottery Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: primarycolor_cust),
                                ),
                                Text(
                                  _ticketModel.data![index].lotteryId?.name.toString() ?? "",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  "Tickets",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: primarycolor_cust),
                                ),
                                Text(
                                  _ticketModel.data![index].ticketNumber.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.green)),
                                  child: Center(
                                    child: Text(
                                      _ticketModel.data![index].status!.toUpperCase(),
                                      style: const TextStyle(
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
              const SizedBox(height: 50,),
            ],
                    ),
                  ),
          ),
    );
  }
}
