import 'package:flutter/material.dart';
import 'package:thai_lottery/auth/login_screnn.dart';
import 'package:thai_lottery/faq/faq_screen.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/my_account/my_account.dart';
import 'package:thai_lottery/payment/deposit_history.dart';
import 'package:thai_lottery/payment/payment_screen.dart';
import 'package:thai_lottery/payment/withdrow_history.dart';
import 'package:thai_lottery/ticket_history.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

class drower extends StatelessWidget {
  const drower({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primarycolor_cust,
      surfaceTintColor: Colors.red,
      shadowColor: Colors.red,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primarycolor_cust,
          body: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme:
                      const DividerThemeData(color: Colors.transparent),
                ),
                child: DrawerHeader(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(
                            backgrundImage,
                          ),
                          fit: BoxFit.scaleDown),
                      borderRadius: BorderRadius.circular(8)),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                ic_profail,
                                color: primarycolor_cust,
                                scale: 3,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              userName ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              email ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_profail,
                    scale: 4,
                    color: primarycolor_cust,
                  ),
                ),
                title: Text(
                  'My Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyAccount()));
                  Scaffold.of(context).closeDrawer();
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_sendMonay,
                    color: primarycolor_cust,
                    scale: 10,
                  ),
                ),
                title: Text(
                  'Deposit History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DepositHistory()));
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_doc,
                    color: primarycolor_cust,
                    scale: 4,
                  ),
                ),
                title: Text(
                  'Withdrawal History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WithdrowHistory()));
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_language,
                    scale: 4,
                  ),
                ),
                title: Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  language(context);
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_privacy,
                    scale: 20,
                  ),
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  //  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_wallet,
                    color: primarycolor_cust,
                    scale: 4,
                  ),
                ),
                title: Text(
                  'CURRNCY: THB & IND',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  currency(context);
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_ticket,
                    color: primarycolor_cust,
                    scale: 4,
                  ),
                ),
                title: Text(
                  'Tickets History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TicketScreen()));
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ic_about,
                    scale: 4,
                    color: primarycolor_cust,
                  ),
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () async {
              NetworkHtttp networkHtttp = NetworkHtttp();
              SessionManager pref = SessionManager();
              networkHtttp.logout();
              pref.setString("username", '');
              pref.setString("email", '');
              pref.setString("balance", '');
              pref.setString("phone", '');
              userName = '';
              email = '';
              balance = '';
              phoneNumber = '';
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'LOG OUT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  currency(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ic_currency,
                scale: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'CURRENCY',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please select your currency",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentScreen()));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: primarycolor_cust,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "THB",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentScreen()));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: primarycolor_cust,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "IND",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  language(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),

          // title: Center(child: Text('Welcome')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ic_language_box,
                scale: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'LANGUAGE',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please select your language",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "ENGLISH",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "THAI",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
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
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "RUSSIAN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: primarycolor_cust,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "CHINESE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
