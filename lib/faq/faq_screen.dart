import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/colors.dart';

import '../local/app_localizations.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              'FAQs',
              style: GoogleFonts.aclonica(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: textcolor_cust2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
           // headerPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            children: [
              AccordionSection(
                isOpen: _isOpen,
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,
                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Text(
                  AppLocalizations.of(context)!.translate("Payment Method")!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primarycolor_cust,
                    ),
                  ),
                ),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                      AppLocalizations.of(context)!.translate('''The app offers a secure payment option through a scanner system. After selecting your lottery tickets, a QR code will be generated, which can be scanned using a mobile banking or e-wallet app for instant payment. This ensures a seamless and hassle-free experience.''')!,
                        style: TextStyle(
                          color: primarycolor_cust.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,
                // Optionally handle animations and haptic feedback
              ),
              AccordionSection(
                isOpen: _isOpen,
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,
                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Text(
                  AppLocalizations.of(context)!.translate("Draw")!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primarycolor_cust,
                    ),
                  ),
                ),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                      AppLocalizations.of(context)!.translate('''The Thai lottery draw follows a transparent and random process to ensure fairness. Draws are conducted on specific dates set by the Thai government, and the results are announced live. The app provides real-time updates, allowing you to view the winning numbers as soon as they are announced.''')!,
                        style: TextStyle(
                          color: primarycolor_cust.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,
                // Optionally handle animations and haptic feedback
              ),
              AccordionSection(
                isOpen: _isOpen,
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,
                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,

                header: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Text(
                  AppLocalizations.of(context)!.translate("Winners")!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primarycolor_cust,
                    ),
                  ),
                ),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                      AppLocalizations.of(context)!.translate(''' Winners are selected based on a random draw conducted by the official Thai Lottery authorities. The draw process is transparent and unbiased, ensuring that everyone has an equal chance to win. The winning numbers are published immediately after the draw and are accessible through our app.''')!,
                        style: TextStyle(
                          color: primarycolor_cust.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,
                // Optionally handle animations and haptic feedback
              ),
              AccordionSection(
                isOpen: _isOpen,
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,
                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Text(
                  AppLocalizations.of(context)!.translate("Technology")!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primarycolor_cust,
                    ),
                  ),
                ),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                      AppLocalizations.of(context)!.translate('''Our Thai Lottery app is built using cutting-edge technology to ensure a smooth and secure user experience. We use advanced encryption to protect user data and secure transactions, while the app's design ensures fast performance and seamless ticket purchasing and payment processes.''')!,
                        style: TextStyle(
                          color: primarycolor_cust.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,
                // Optionally handle animations and haptic feedback
              ),
            ],
          )
        ],
      ),
    );
  }
}
