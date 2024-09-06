import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/auth/register_screen.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/model/loginModel.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ischeck = false;
  NetworkHtttp networkHtttp = NetworkHtttp();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginModel loginModel;
  SessionManager pref = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            backgroundColor: Color(0xffF1F6F9),
            child: Icon(CupertinoIcons.back),
          ),
        ),
        title: Image.asset(
          ic_logo,
          scale: 4,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text(
                "REGISTER",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Color(0xff6459A0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              ))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Text(
                "SIGN IN",
                style: GoogleFonts.breeSerif(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: font_color_cust)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: dark_grey_background_cust,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: seconderycolor_cust,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "Enter Your Mobile Number",
                      hintStyle: TextStyle(
                          color: seconderycolor_cust,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: dark_grey_background_cust,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(
                      color: seconderycolor_cust,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                          color: seconderycolor_cust,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: ischeck,
                        shape: CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            ischeck = !ischeck ? true : false;
                          });
                        },
                      ),
                      Text("Remember Me",
                          style: TextStyle(
                              color: Color(0xff8B9199),
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  // Checkbox(value: va, onChanged: ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                            color: Color(0xff8B9199),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () async {
                  Map<String, dynamic> data = await networkHtttp.login(
                      phoneController.text, passwordController.text);
                  loginModel = LoginModel.fromJson(data);
                  if (loginModel.status == true) {
                    print("login");
                    pref.setString(
                        "username", loginModel.data!.name.toString());
                    pref.setString("email", loginModel.data!.email.toString());
                    pref.setString(
                        "balance", loginModel.data!.balance.toString());
                    pref.setString(
                        "phone", loginModel.data!.mobileNo.toString());


                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    passwordController.clear();
                    phoneController.clear();
                  }
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 45,
                    decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Center(
          child: Text(
            "No account? Create Account",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: font_color_cust),
          ),
        ),
      ),
    );
  }
}
