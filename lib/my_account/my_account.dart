import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/my_account/personal_iformation.dart';
import 'package:thai_lottery/my_account/security_setting.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';

import '../local/app_localizations.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Text(AppLocalizations.of(context)!.translate('My Account')!,style: GoogleFonts.aclonica(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: textcolor_cust2)),),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PersonalInformation()));
              },
              child: Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: toolbarcolor_lang
                ),
                child: ListTile(
                  leading: Image.asset(ic_percnalInfo,scale: 4,),
                  title: Text(AppLocalizations.of(context)!.translate("Personal Information")!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: textcolor_cust2),),
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecuritySetting()));
              },
              child: Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: toolbarcolor_lang
                ),
                child: ListTile(
                  leading: Icon(Icons.lock_outline_rounded,color: primarycolor_cust,),
                  title: Text(AppLocalizations.of(context)!.translate("Security Setting")!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: textcolor_cust2),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
