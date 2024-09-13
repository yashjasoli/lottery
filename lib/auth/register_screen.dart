import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/model/loginModel.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';
import 'package:thai_lottery/utility/requad_box.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

import '../local/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  NetworkHttp networkHtttp = NetworkHttp();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late LoginModel loginModel;
  SessionManager pref = SessionManager();
  bool _isLoading = false;
  bool passwordVisible = false;
  bool isvalid = false;

  void Validate(String email) {
     isvalid = EmailValidator.validate(email);
    print(isvalid);
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? progressdialog_custom()
        : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10, right: 10),
        //   child: CircleAvatar(
        //     backgroundColor: Color(0xffF1F6F9),
        //     child: Icon(CupertinoIcons.back),
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: Image.asset(
          ic_logo,
          scale: 4,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.translate("SIGN IN")!,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Color(0xff6459A0),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Text(
                    AppLocalizations.of(context)!.translate("REGISTER")!,
                      style: GoogleFonts.breeSerif(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: font_color_cust)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: dark_grey_background_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: nameController,
                        style: const TextStyle(
                            color: seconderycolor_cust,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            hintText: AppLocalizations.of(context)!.translate("Enter Your Full Name")!,
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: dark_grey_background_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                            color: seconderycolor_cust,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: AppLocalizations.of(context)!.translate("Enter Your Email")!,
                            hintStyle: TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: dark_grey_background_cust,
                              borderRadius: BorderRadius.circular(20)),
                          child: CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'IN',
                            favorite: const ['+91', 'RU','+66','CN'],
                            countryFilter: const ['IN', 'RU','+66','CN'],
                            flagDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              color: dark_grey_background_cust,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            maxLength: 10,
                            style: const TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,

                                fontWeight: FontWeight.w400),
                            decoration:  InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                counterText: "",
                                hintText: AppLocalizations.of(context)!.translate("Enter Your Mobile Number")!,
                                hintStyle: TextStyle(
                                    color: seconderycolor_cust,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: dark_grey_background_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        style: const TextStyle(
                            color: seconderycolor_cust,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: AppLocalizations.of(context)!.translate("Enter Your Thai ID or Passport Number(optional)")!,
                            hintStyle: TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: dark_grey_background_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        style: const TextStyle(
                            color: seconderycolor_cust,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText:
                            AppLocalizations.of(context)!.translate("Enter Your PromptPay Number or Gpay Number(optional)")!,
                            hintStyle: TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: dark_grey_background_cust,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: passwordVisible,
                              style: const TextStyle(
                                  color: seconderycolor_cust,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              decoration:  InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: AppLocalizations.of(context)!.translate("Enter Your Password")!,
                                  hintStyle: TextStyle(
                                      color: seconderycolor_cust,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                            child: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,color: seconderycolor_cust,),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Validate(emailController.text);
                        if(isvalid == false) {
                          var snackBar = SnackBar(
                            content: Text(AppLocalizations.of(context)!
                                .translate("Please Enter Valid Email")!),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: primarycolor_cust,
                            hitTestBehavior: HitTestBehavior.opaque,);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }else{
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            phoneController.text.isEmpty) {
                          alert_success().alertSuccess(context);
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          Map<String, dynamic> data =
                              await networkHtttp.register(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                  phoneController.text);
                          loginModel = LoginModel.fromJson(data);

                          if (loginModel.status == true) {
                            currncy = loginModel.data!.currencyCode.toString();
                            print("login");
                            pref.setString(
                                "username", loginModel.data!.name.toString());
                            pref.setString(
                                "email", loginModel.data!.email.toString());
                            pref.setString(
                                "token", loginModel.token.toString());
                            pref.setString(
                                "balance", loginModel.data!.balance.toString());
                            pref.setString(
                                "phone", loginModel.data!.mobileNo.toString());
                            pref.setString("country", loginModel.data!.currencyCode.toString()  != "764" ? "INR" : "THB");

                            userName = await pref.getString("username", "");
                            phoneNumber = await pref.getString("phone", "");
                            balance = await pref.getString("balance", "");
                            email = await pref.getString("email", "");
                            token = await pref.getString("token", "");
                            currncy = await pref.getString("country", "");

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                            passwordController.clear();
                            phoneController.clear();
                          }else{
                            setState(() {
                              _isLoading = false;
                            });
                            var snackBar =  SnackBar(
                              content: Text(AppLocalizations.of(context)!.translate("Email or Phone Number Already Registered")!),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: primarycolor_cust,
                              hitTestBehavior: HitTestBehavior.opaque,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 45,
                          decoration: BoxDecoration(
                              color: primarycolor_cust,
                              borderRadius: BorderRadius.circular(8)),
                          child:  Center(
                            child: Text(
                              AppLocalizations.of(context)!.translate("CREATE ACCOUNT")!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
