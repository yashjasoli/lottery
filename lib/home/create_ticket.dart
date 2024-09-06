import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';

class TicketGenerateScreen extends StatefulWidget {
  @override
  _TicketGenerateScreenState createState() => _TicketGenerateScreenState();
}

class _TicketGenerateScreenState extends State<TicketGenerateScreen> {
  late DateTime nextDrawDate;
  late Duration remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    nextDrawDate = DateTime(2024, 9, 12, 0, 0, 0); // Set the date of the next draw
    remainingTime = nextDrawDate.difference(DateTime.now());

    // Start the timer that updates every second
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = nextDrawDate.difference(DateTime.now());
        if (remainingTime.isNegative) {
          //  timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Lottery Info
              _buildLotteryInfo(),
              SizedBox(height: 20),
              // Next Draw Info
              _buildNextDrawInfo(),
              SizedBox(height: 20),
              // Ticket Generation Section
              _buildTicketGenerationSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBuyNowButton(),
    );
  }

  Widget _buildLotteryInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white)),
                ),
                _buildCircleLine(),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("THB", style: _whiteText(12)),
                Text("15,000,000", style: _whiteText(20)),
                VerticalDivider(color: Colors.white, thickness: 2),
                Column(
                  children: [
                    Text("GUARANTEED WINNERS",
                        style: _whiteText(10, fontWeight: FontWeight.w600)),
                    Text("3000", style: _whiteText(20)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
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
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Friday, 12 July 2024",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCountdown("$days", "DAYS"),
              _buildCountdown("$hours", "HOURS"),
              _buildCountdown("$minutes", "MINUTES"),
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
          SizedBox(height: 16),
          Divider(color: Colors.white),
          SizedBox(
            height: 200,
            child: _buildTicketList(),
          ),
          SizedBox(height: 20),
          Text(
            "1 Draw With 2 Tickets: 2 x 50\nTotal Amount: 100",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyNowButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          "Buy Now",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
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
            decoration: BoxDecoration(
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
        Text("Available Tickets: 55", style: TextStyle(color: Colors.white)),
        Text("Price: \$50", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildTicketList() {
    return ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _buildTicketCard();
      },
    );
  }

  Widget _buildTicketCard() {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff544989),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text("Your Ticket Number",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12)),
          SizedBox(height: 8),
          Divider(color: Colors.white),
          SizedBox(height: 8),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: primarycolor_cust,
                borderRadius: BorderRadius.circular(6)),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  "331426380129",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: primarycolor_cust,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
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
          SizedBox(height: 10),
        ],
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
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
}
