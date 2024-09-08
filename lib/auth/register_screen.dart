import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/model/loginModel.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/progressdialog_custom.dart';
import 'package:thai_lottery/utility/requad_box.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "SIGN IN",
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
      body: _isLoading == true
          ? progressdialog_custom()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Text(
                      "REGISTER",
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
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Your Full Name",
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
                            controller: phoneController,
                            style: const TextStyle(
                                color: seconderycolor_cust,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "Enter Your Mobile Number",
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
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "Enter Your Thai ID or Passport Number",
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
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText:
                                "Enter Your PromptPay Number or Gpay Number",
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
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (phoneController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            phoneController.text.isEmpty) {
                          alert_success().alertSuccess(context);
                        } else {
                          Map<String, dynamic> data =
                              await networkHtttp.register(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                  phoneController.text);
                          loginModel = LoginModel.fromJson(data);
                          if (loginModel.status == true) {
                            print("login");
                            pref.setString(
                                "username", loginModel.data!.name.toString());
                            pref.setString(
                                "email", loginModel.data!.email.toString());
                            pref.setString(
                                "balance", loginModel.data!.balance.toString());
                            pref.setString(
                                "phone", loginModel.data!.mobileNo.toString());

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                            passwordController.clear();
                            phoneController.clear();
                          }
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 45,
                          decoration: BoxDecoration(
                              color: primarycolor_cust,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              "CREATE ACCOUNT",
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
