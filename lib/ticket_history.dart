import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';

import 'model/all_ticket_model.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  allTicketModel _ticketModel = allTicketModel();
  NetworkHttp networkHtttp = NetworkHttp();
  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      _isLoading = true;
    });
    Map<String, dynamic> data = await networkHtttp.allTicket();
    _ticketModel = allTicketModel.fromJson(data);
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(),
      drawer: const drower(),
      body: _isLoading == true
          ? progressdialog_custom()
          : RefreshIndicator(child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Tickets History',
              style: GoogleFonts.aclonica(
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: textcolor_cust2)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 15),
              children: _ticketModel.data!.map((ticket) {
                return AccordionSection(
                  isOpen: false,
                  rightIcon: const SizedBox(),
                  contentBorderColor: toolbarcolor_lang,
                  headerBackgroundColor: toolbarcolor_lang,
                  headerBackgroundColorOpened: toolbarcolor_lang,
                  contentBackgroundColor: toolbarcolor_lang,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ticket No.",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: primarycolor_cust),
                      ),
                      Text(
                        ticket.ticketNumber.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: primarycolor_cust),
                      ),
                    ],
                  ),
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final itemText = [
                        {
                          "label": "Lottery Name",
                          "value": ticket.lotteryId?.name ?? ""
                        },
                        {
                          "label": "Price",
                          "value": ticket.lotteryId?.price ?? ""
                        },
                        {"label": "Buy Date", "value": "20-09-2024"},
                        {"label": "Draw Date", "value": "20-09-2024"},
                        {"label": "Result", "value": ticket.status}
                      ][index];

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                itemText["label"]!.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: primarycolor_cust),
                              ),
                              Text(
                                itemText["value"]!.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color:
                                    itemText["label"] == "Result" &&
                                        itemText["value"] == "win"
                                        ? Colors.green
                                        : primarycolor_cust),
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
                        ],
                      );
                    },
                  ),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  headerBorderRadius: 20,
                  contentBorderRadius: 20,
                );
              }).toList(),
            ),
          ),
        ],
      ), onRefresh: ()async{
            getData();
      }),
    );
  }
}
