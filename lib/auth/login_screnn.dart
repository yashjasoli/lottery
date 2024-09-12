import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/auth/register_screen.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/model/loginModel.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';
import 'package:thai_lottery/utility/requad_box.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ischeck = false;
  NetworkHttp networkHtttp = NetworkHttp();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginModel loginModel;
  SessionManager pref = SessionManager();
  bool passwordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? progressdialog_custom()
        : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10, right: 10),
        //   child: CircleAvatar(
        //     backgroundColor: Color(0xffF1F6F9),
        //     child: Icon(CupertinoIcons.back),
        //   ),
        // ),
        title: Image.asset(
          ic_logo,
          scale: 4,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterScreen()));
              },
              child: Text(
                "REGISTER",
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Color(0xff6459A0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              ))
        ],
        elevation: 0,
      ),
      body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Text(
                      "SIGN IN",
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
                        controller: phoneController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            color: seconderycolor_cust,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "Enter Your Email",
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
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "Enter Your Password",
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
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: ischeck,
                              shape: const CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  ischeck = !ischeck ? true : false;
                                });
                              },
                            ),
                            const Text("Remember Me",
                                style: TextStyle(
                                    color: Color(0xff8B9199),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                        // Checkbox(value: va, onChanged: ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(
                                  color: Color(0xff8B9199),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () async {

                        if (phoneController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          alert_success().alertSuccess(context);
                        } else {
                          if(ischeck == false){
                            var snackBar = const SnackBar(
                              content: Text("Please Select Remember Me"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: primarycolor_cust,
                              hitTestBehavior: HitTestBehavior.opaque,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }else{
                          setState(() {
                            _isLoading = true;
                          });
                          Map<String, dynamic> data = await networkHtttp.login(
                              phoneController.text, passwordController.text);
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
                            pref.setString("phone", loginModel.data!.mobileNo.toString());
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
                            var snackBar = SnackBar(
                              content: Text("Invalid Email or Password"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: primarycolor_cust,
                              hitTestBehavior: HitTestBehavior.opaque,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }}
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 45,
                          decoration: BoxDecoration(
                              color: primarycolor_cust,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
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
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
        },
        child: const SizedBox(
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
      ),
    );
  }
}
