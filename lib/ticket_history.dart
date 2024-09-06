import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      drawer: drower(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Tickets History',
              style: GoogleFonts.aclonica(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: textcolor_cust2)),
            ),
          ),
          SizedBox(height: 20,),
          Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            // sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
                ),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                headerBorderRadius: 20,
                contentBorderRadius: 20,

                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: false,
                rightIcon: const SizedBox(),
                contentBorderColor: toolbarcolor_lang,
                headerBackgroundColor: toolbarcolor_lang,

                headerBackgroundColorOpened: toolbarcolor_lang,
                contentBackgroundColor: toolbarcolor_lang,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket No.",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                    Text(
                      "153049802672",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: primarycolor_cust),
                    ),
                  ],
                ),
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Lottery Name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("Thai Lottery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("\$50 THB",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Buy Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-05-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Draw Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("10-06-2024",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: primarycolor_cust),),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Result",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: primarycolor_cust),),
                        Text("WIN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),

                      ],
                    ),
                  ],
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
