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

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Map<String, dynamic> ref = await networkHtttp.allLottery();
    allLottery = AllLottery.fromJson(ref);
    _isLoading = false;
    setState(() {});
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
                        Container(
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
                            child: const Center(
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
                            child: const Center(
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
                            child: const Center(
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
                            child: const Center(
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
                            child: const Center(
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
                            child: const Center(
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
                      child: const Center(
                        child: Text(
                          "3000",
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
                      child: const Center(
                        child: Text(
                          "currncy 268,298",
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
                    // Custom layout for the first item (Row containing 3 Columns)
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Column 2 (index 0)
                        Column(
                          children: [
                            Image.asset(
                              ic_number_2,
                              scale: 4.0,
                            ),
                            Text(
                              allLottery.data![0].winner![1].userId!.name.toString(), // Corresponding name for index 0
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Score 0", // Static score or make it dynamic
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        // Column 1 (index 1)
                        Column(
                          children: [
                            Image.asset(
                              ic_number_1,
                              scale: 3.9,
                            ),
                            Text(
                              allLottery.data![0].winner![0].userId!.name.toString(), // Corresponding name for index 1
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Score 4.5", // Static score or make it dynamic
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        // Column 3 (index 2)
                        Column(
                          children: [
                            Image.asset(
                              ic_number_3,
                              scale: 4.0,
                            ),
                            Text(
                              allLottery.data![0].winner![2].userId!.name.toString(), // Corresponding name for index 2
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Score 0", // Static score or make it dynamic
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (index >= 3) {
                    // Different layout for other items starting from index 3
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
                          child: Image.asset(
                            ic_drinc,
                            scale: 3,
                          ),
                        ),
                        title: Text(
                          allLottery.data![0].winner![index].userId!.name.toString(), // Display the name dynamically for other items
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primarycolor_cust,
                          ),
                        ),
                        subtitle:  Text(
                          allLottery.data![0].winner![1].userId!.email.toString(), // Adjust if necessary
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: greycolor_cust,
                          ),
                        ),
                        trailing: const Text(
                          "Score 0", // Static score or dynamic if needed
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: greycolor_cust,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Return an empty container for index 1 and 2 (or modify as needed)
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
    );
  }
}
