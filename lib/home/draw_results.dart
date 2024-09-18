import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';

import '../local/app_localizations.dart';
import '../model/all_lottery_model.dart';
import '../utility/network_http.dart';
import '../utility/progressdialog_custom.dart';

class DrawResuits extends StatefulWidget {

  const DrawResuits({super.key});

  @override
  State<DrawResuits> createState() => _DrawResuitsState();
}

class _DrawResuitsState extends State<DrawResuits> {
  NetworkHttp networkHtttp = NetworkHttp();
  late AllLottery allLottery;
  bool _isLoading = true;
  List<String> _list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "1"];

  List<String> prizes = [
    "5 million THB", // Prize for rank 1
    "2 million THB", // Prize for rank 2
    "1 million THB", // Prize for rank 3
    "100,000 THB",   // Prize for rank 4-10
    "80,000 THB",    // Prize for rank 11-100
    "40,000 THB",    // Prize for rank 101-500
    "20,000 THB",    // Prize for rank 501-1000
    "10,000 THB",    // Prize for rank 1001-1500
    "5,000 THB",     // Prize for rank 1501-2000
    "1,000 THB",     // Prize for rank 2001-2500
    "500 THB"        // Prize for rank 2501-3000
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Map<String, dynamic> ref = await networkHtttp.allLottery();
    allLottery = AllLottery.fromJson(ref);
    String ticketNumberString = allLottery.data![0].winner![0].ticketNumber.toString();
    _list = ticketNumberString.split('');
    _isLoading = false;
    setState(() {});
  }

  Widget drawNumberBox(String number) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.only(bottom: 3, top: 3),
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
            number,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBars(),
      // drawer: drower(),
      body: _isLoading == true
          ? progressdialog_custom()
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: RefreshIndicator(
            onRefresh: ()async{
              getData();
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate('DRAW RESULTS')!,
                    style: GoogleFonts.aclonica(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: textcolor_cust2)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Friday, 5 July 2024",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textcolor_cust2),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate("MAIN DRAW")!,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (_list.length >= 2)
                            drawNumberBox(_list[0] + _list[1]),
                          if (_list.length >= 4)
                            drawNumberBox(_list[2] + _list[3]),
                          if (_list.length >= 6)
                            drawNumberBox(_list[4] + _list[5]),
                          if (_list.length >= 8)
                            drawNumberBox(_list[6] + _list[7]),
                          if (_list.length >= 10)
                            drawNumberBox(_list[8] + _list[9]),
                          if (_list.length >= 12)
                            drawNumberBox(_list[10] + _list[11]),// Fixed number as shown in your code
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate( "TOTAL WINNERS:")!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: primarycolor_cust,
                            borderRadius: BorderRadius.circular(20)),
                        child:  Center(
                          child: Text(
                            allLottery.data![0].winner!.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate("TOTAL PRIZES:")!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: primarycolor_cust,
                            borderRadius: BorderRadius.circular(20)),
                        child:  Center(
                          child: Text(
                            "amount ${allLottery.data![0].winner![0].lotteryPriceId!.price}",
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
                const SizedBox(
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
                      AppLocalizations.of(context)!.translate("THAI LOTTERY")!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
            ListView.builder(
              itemCount: allLottery.data![0].winner!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  // Layout for the top 3 winners
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Column 1 (2nd place)
                      Column(
                        children: [
                          Image.asset(ic_number_2, scale: 4.0),
                          Text(
                            allLottery.data![0].winner![1].userId!.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            prizes[1], // Prize for the 2nd winner
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // Column 2 (1st place)
                      Column(
                        children: [
                          Image.asset(ic_number_1, scale: 3.9),
                          Text(
                            allLottery.data![0].winner![0].userId!.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            prizes[0], // Prize for the 1st winner
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // Column 3 (3rd place)
                      Column(
                        children: [
                          Image.asset(ic_number_3, scale: 4.0),
                          Text(
                            allLottery.data![0].winner?[2].userId?.name.toString() ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            prizes[2], // Prize for the 3rd winner
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (index >= 3) {
                  // Layout for winners from index 3 onwards
                  return Container(
                    decoration: BoxDecoration(
                      color: toolbarcolor_lang,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundColor: primarycolor_cust,
                        child: Image.asset(ic_drinc, scale: 3),
                      ),
                      title: Text(
                        allLottery.data![0].winner![index].userId!.name.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: primarycolor_cust,
                        ),
                      ),
                      subtitle: Text(
                        allLottery.data![0].winner![index].userId!.email.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: greycolor_cust,
                        ),
                      ),
                      trailing: Text(
                        prizes[index], // Prize corresponding to the current winner
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: greycolor_cust,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(); // Return empty container for index 1 and 2
                }
              },
            ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
