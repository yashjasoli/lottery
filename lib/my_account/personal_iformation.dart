import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/network_http.dart';

import '../local/app_localizations.dart';
import '../utility/shared_preferences.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController nameController = TextEditingController(text: userName);
  TextEditingController emailController = TextEditingController(text: email);
  TextEditingController phoneController =
      TextEditingController(text: phoneNumber);
  NetworkHttp networkHtttp = NetworkHttp();
  SessionManager pref = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBars(),
      drawer: const drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('Personal Information')!,
                  style: GoogleFonts.aclonica(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: textcolor_cust2)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                AppLocalizations.of(context)!.translate("Your Name")!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textcolor_cust2),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: textcolor_cust2,
                    ),
                    title: TextFormField(
                      controller: nameController,
                      style: const TextStyle(
                          fontSize: 14,
                          color: greycolor_cust,
                          fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ) /*Text(userName!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: greycolor_cust),)*/,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.translate("Phone Number")!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textcolor_cust2),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone_android,
                      color: textcolor_cust2,
                    ),
                    title: TextFormField(
                      controller: phoneController,
                      style: const TextStyle(
                          fontSize: 14,
                          color: greycolor_cust,
                          fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.translate("Email Address")!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textcolor_cust2),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang),
                  child: ListTile(
                    leading: const Icon(
                      Icons.alternate_email,
                      color: textcolor_cust2,
                    ),
                    title: TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                          fontSize: 14,
                          color: greycolor_cust,
                          fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.translate(
                    "If you want to change your phone and email address, please contact with support.")!,
                style: TextStyle(
                    color: greycolor_cust,
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          networkHtttp.update(
              emailController.text, phoneController.text, nameController.text);
          pref.setString("username", nameController.text);
          pref.setString("email", emailController.text);
          pref.setString("phone", phoneController.text);
          userName = await pref.getString("username", "");
          phoneNumber = await pref.getString("phone", "");
          email = await pref.getString("email", "");
          var snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: primarycolor_cust,
              hitTestBehavior: HitTestBehavior.opaque,
              content: Text(AppLocalizations.of(context)!.translate(
                  "Your information has been updated successfully")!));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {});
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: primarycolor_cust,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.translate("Save Changes")!,
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
