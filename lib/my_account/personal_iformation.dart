import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/network_http.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController nameController = TextEditingController(text: userName);
  TextEditingController emailController = TextEditingController(text: email);
  TextEditingController phoneController = TextEditingController(text: phoneNumber);
  NetworkHtttp networkHtttp = NetworkHtttp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars(),
      drawer: drower(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Center(
                child: Text('Personal Information',style: GoogleFonts.aclonica(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: textcolor_cust2)),),
              ),
              SizedBox(height: 30,),
              Text("Your Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textcolor_cust2),),
              SizedBox(height: 8,),
              GestureDetector(
                child: Container(
                  height: 55,
                 // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person,color: textcolor_cust2,),
                    title: TextFormField(
                      controller: nameController,
                      style: TextStyle(
                        fontSize: 14,
                        color: greycolor_cust,
                        fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                    ) /*Text(userName!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: greycolor_cust),)*/,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("Phone Number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textcolor_cust2),),
              SizedBox(height: 8,),
              GestureDetector(
                child: Container(
                  height: 55,
                 // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang
                  ),
                  child: ListTile(
                    leading: Icon(Icons.phone_android,color: textcolor_cust2,),
                    title: TextFormField(
                      controller: phoneController,
                      style: TextStyle(
                          fontSize: 14,
                          color: greycolor_cust,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("Email Address",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textcolor_cust2),),
              SizedBox(height: 8,),
              GestureDetector(
                child: Container(
                  height: 55,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toolbarcolor_lang
                  ),
                  child: ListTile(
                    leading: Icon(Icons.alternate_email,color: textcolor_cust2,),
                    title: TextFormField(
                      controller: emailController,
                      style: TextStyle(
                          fontSize: 14,
                          color: greycolor_cust,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("If you want to change your phone and email address, please contact with support.",style: TextStyle(
                color: greycolor_cust,
                fontWeight: FontWeight.w400,
                fontSize: 10
              ),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
       onTap: ()async{
         networkHtttp.update(emailController.text, phoneController.text, nameController.text);
       },
       child: Container(
         height: 40,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
         decoration: BoxDecoration(
             color: primarycolor_cust,
             borderRadius: BorderRadius.circular(10)
         ),
         child: Center(
           child: Text(
             "Save Changes",
             style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),
           ),
         ),
       ),
      ),
    );
  }
}
