import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/utility/colors.dart';

import '../local/app_localizations.dart';
import '../utility/app_bar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate('About Us')!,
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
              Text(
                AppLocalizations.of(context)!.translate( 'Thai Lottery was established in Thailand and evolved into a global gaming operator, offering entertainment and innovative gaming platforms and products with a CSR-first approach to supporting individuals and society. Rooted in values aimed at a more sustainable future and grounded in principles of social and environmental responsibility, Emirates Draw positively impacts and brings real change to its fortunate winners, one life at a time. The company is dedicated to giving back to the community through its leading Coral Reef Restoration Programme and pro-societal and environment-driven initiatives. It features four fast- growing games Thai Lottery delivering thousands of dirhams daily and millions weekly. Our role is to make a resonant impact and inspire people and organisations to collaborate towards building a better tomorrow.')!,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.translate("Our Mission")!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: textcolor_cust2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.translate("We believe in making a difference by transforming lives through our games and prizes, nurturing a positive workplace culture, and contributing to a healthier society, sustainable future, and a better world through our Coral Reef Restoration Programme.")!,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
