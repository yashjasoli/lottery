import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/payment/deposite_screen.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/no_data.dart';

import '../main.dart';
import '../model/lottery_details_model.dart';
import '../model/ticket_number_model.dart';
import '../utility/progressdialog_custom.dart';

class TicketGenerateScreen extends StatefulWidget {
  String id;

  TicketGenerateScreen({super.key, required this.id});

  @override
  State<TicketGenerateScreen> createState() => _TicketGenerateScreenState();
}

class _TicketGenerateScreenState extends State<TicketGenerateScreen> {
  late DateTime nextDrawDate;
  late Duration remainingTime;
  late Timer timer;
  NetworkHttp networkHtttp = NetworkHttp();
  late LotteryDetailsModel lotteryDetailsModel;
  bool _isLoading = true;
  late AllTicketModel allTicketModel;
  List<String> ticketNumber = [];
  List<String> tickets = List.generate(1, (index) => "");

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      Map<String, dynamic> ref = await networkHtttp.lotteryDetails(widget.id);
      lotteryDetailsModel = LotteryDetailsModel.fromJson(ref);
      _isLoading = false;

      nextDrawDate = DateTime(
        int.parse(lotteryDetailsModel.data!.drawDate!.split("-")[0]),
        int.parse(lotteryDetailsModel.data!.drawDate!.split("-")[1]),
        int.parse(lotteryDetailsModel.data!.drawDate!.split("-")[2]),
        0,
        0,
        0,
      ); // Set the date of the next draw

      remainingTime = nextDrawDate.difference(DateTime.now());

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          remainingTime = nextDrawDate.difference(DateTime.now());

          if (remainingTime.isNegative) {
            timer.cancel();
            showTimeCompletedDialog(); // Show dialog when time is complete
          }
        });
      });
      setState(() {});
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showTimeCompletedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                  "https://assets7.lottiefiles.com/private_files/lf30_editor_jxsyvmne.json",
                  height: 200),
              const Text(
                "Time Completed!",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              const SizedBox(height: 30),
              const Text(
                "The draw time has been completed. Please check your results.",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: primarycolor_cust,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
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
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBars(),
      // drawer: drower(),
      body: _isLoading == true
          ? progressdialog_custom()
          : lotteryDetailsModel.status == false
              ? Center(
                  child: NoDataAvaible(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Lottery Info
                        _buildLotteryInfo(),
                        const SizedBox(height: 20),
                        // Next Draw Info
                        _buildNextDrawInfo(),
                        const SizedBox(height: 20),
                        // Ticket Generation Section
                        _buildTicketGenerationSection(),
                        const SizedBox(height: 20),
                        _buildBuyNowButton(),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildLotteryInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                _buildCircleLine(),
                Text(
                  "  THAI LOTTERY  ",
                  style: GoogleFonts.aclonica(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white)),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("15,000,000", style: _whiteText(20)),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text("GUARANTEED WINNERS",
                        style: _whiteText(10, fontWeight: FontWeight.w600)),
                    Text("3000", style: _whiteText(20)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildNextDrawInfo() {
    int days = remainingTime.inDays;
    int hours = remainingTime.inHours % 24;
    int minutes = remainingTime.inMinutes % 60;
    int seconds = remainingTime.inSeconds % 60;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "NEXT DRAW",
            style: GoogleFonts.aclonica(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Friday, ${lotteryDetailsModel.data!.drawDate}",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCountdown("$days", "DAYS"),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  ":",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              _buildCountdown("$hours", "HOURS"),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  ":",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              _buildCountdown("$minutes", "MINUTES"),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  ":",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              _buildCountdown("$seconds", "SECONDS"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTicketGenerationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primarycolor_cust,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTicketHeader(),
          const SizedBox(height: 16),
          const Divider(color: Colors.white),
          SizedBox(
            height: 200,
            child: _buildTicketList(),
          ),
          const SizedBox(height: 20),
          Text(
            "1 Draw With ${tickets.length} Tickets: ${tickets.length} x ${currncy == "THB" ? "\$ 80" : "₹ 198.79"}\nTotal Amount: ${tickets.length * (currncy == "THB" ?  80 : 198.79)}",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyNowButton() {
    return GestureDetector(
      onTap: ticketNumber.isEmpty
          ? null
          : () async {
              Map<String, dynamic> ref =
                  await networkHtttp.buyLottery(widget.id, tickets);
              print(ref['status']);
              if (ref['status'] == false) {
                showClecel();
              } else {
                showSuccess();
              }
            },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: ticketNumber.isEmpty
              ? Colors.green
                  .withOpacity(0.5) // Grayed-out color when tickets is empty.
              : Colors.green, // Full color when tickets is not empty.
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Buy Now", // Correct conditional text display.
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleLine() {
    return Flexible(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
          Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text("Available Tickets: 55", style: TextStyle(color: Colors.white)),
        Text("Price: ${currncy == "THB" ? "\$ 80" : "₹ 198.79"}  ",
            style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // Initialize with 3 empty tickets.

  Widget _buildTicketList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tickets.length + 1,
            // Add one more item for the "Add Ticket" button.
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index < tickets.length) {
                // Render the ticket card if it's within the list length.
                return _buildTicketCard(index);
              } else {
                // Render the "Add Ticket" button if it's the last item.
                return _buildAddTicketButton();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTicketCard(int index) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xff544989),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  tickets.removeAt(index);
                  ticketNumber.removeAt(index);
                });
                print(index);
              },
              child: const Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text("Your Ticket Number",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
                const SizedBox(height: 8),
                const Divider(color: Colors.white),
                const SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: primarycolor_cust,
                      borderRadius: BorderRadius.circular(6)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        tickets[index],
                        // Use the ticket number for the current index.
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    Map<String, dynamic> ref = await networkHtttp
                        .ticketNumber(); // Call API for the current index.
                    allTicketModel = AllTicketModel.fromJson(ref);
                    // Update the ticket number for the current index.

                    setState(() {
                      tickets[index] = allTicketModel.data.toString();
                    });
                    ticketNumber.add(tickets.toString());

                    print(tickets[
                        index]); // Rebuild the widget to reflect changes.
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "GENERATE",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddTicketButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tickets.add(""); // Add an empty ticket to the list.
        });
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green, // Choose any color for the "Add Ticket" button.
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "ADD TICKET",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountdown(String value, String label) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: primarycolor_cust, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  TextStyle _whiteText(double size, {FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
      color: Colors.white,
      fontWeight: fontWeight,
      fontSize: size,
    );
  }

  showSuccess() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                  "https://lottie.host/d4c8c6b9-20c7-4727-9557-095cbe00baee/7yFUw1WtVB.json",
                  height: 200),
              const Text(
                "Success",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "You have successfully purchased Tickets",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: primarycolor_cust,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Okay",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(
                  "https://lottie.host/b0cd5755-f656-42de-9aa3-2540bc731ea9/6bZ8ikv3ga.json",
                  height: 200),
              const Text(
                "Insufficient \nBalance",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Purchasing failed please deposit money",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DepositeScreen()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: primarycolor_cust,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Go To Deposit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
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
