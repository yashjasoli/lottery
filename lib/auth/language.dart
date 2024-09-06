import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/auth/login_screnn.dart';
import 'package:thai_lottery/utility/colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var selectLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            backgroundColor: Color(0xffF1F6F9),
            child: Icon(CupertinoIcons.back),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Language",
            style: GoogleFonts.breeSerif(
                textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: font_color_cust)),
          ),
          Text(
            "Select your app language",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff8B9199)),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectLanguage = "English";
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "English"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: selectLanguage == "English"
                            ? Colors.white
                            : seconderycolor_cust,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectLanguage = "Thai";
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Thai"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Thai",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Thai"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectLanguage = "Russian";
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Russian"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Russian",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Russian"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectLanguage = "Chinese";
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Chinese"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Chinese",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Chinese"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
              color: primarycolor_cust,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
