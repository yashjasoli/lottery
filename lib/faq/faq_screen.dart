import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/colors.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'FAQs',
              style: GoogleFonts.aclonica(
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: textcolor_cust2)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,

            headerPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            // sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: false,

                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,
                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Privacy",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Are my account details secure?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: primarycolor_cust),),
                      const SizedBox(height: 20,),
                      Text('''Every effort has been made to ensure that your
data is protected. Both our website and mobile
app have state-of-the-art data security in
place, and we comply with international data
protection standards.''',style: TextStyle(color: primarycolor_cust.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
