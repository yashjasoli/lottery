import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';

class SecuritySetting extends StatefulWidget {
  const SecuritySetting({super.key});

  @override
  State<SecuritySetting> createState() => _SecuritySettingState();
}

class _SecuritySettingState extends State<SecuritySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Center(
                child: Text('Security Setting',style: GoogleFonts.aclonica(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: textcolor_cust2)),),
              ),
              SizedBox(height: 30,),
              Text("Password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textcolor_cust2),),
              SizedBox(height: 8,),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang
                  ),
                  child: ListTile(
                    leading: Image.asset(ic_password,scale: 3,),
                    title: Text("Password",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: greycolor_cust),),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("Confirm Password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textcolor_cust2),),
              SizedBox(height: 8,),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang
                  ),
                  child: ListTile(
                    leading: Image.asset(ic_password,scale: 3,),
                    title: Text("Password",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: greycolor_cust),),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
            color: primarycolor_cust,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            "Save Changes",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),
          ),
        ),
      ),
    );

  }
}
