import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/payment/deposite_screen.dart';
import 'package:thai_lottery/payment/withdraw_screen.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';

import '../local/app_localizations.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      drawer: drower(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(payment_background), fit: BoxFit.fill),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.translate('Payment')!,
                style: GoogleFonts.aclonica(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: textcolor_cust2)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DepositeScreen()));
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xffB2A3FF),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primarycolor_cust
                      ),
                      child: Center(
                        child: Image.asset(ic_sendMonay,scale: 5,),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate('Deposite')!,
                    style: GoogleFonts.aclonica(
                        textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: textcolor_cust2)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WithdrawScreen()));
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xffCAFFE6),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                      ),
                      child: Center(
                        child: Image.asset(ic_getMonay,scale: 5,),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate('Withdraw')!,
                    style: GoogleFonts.aclonica(
                        textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.green)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
