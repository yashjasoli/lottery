import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/image.dart';

import '../local/app_localizations.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset(ic_logo,scale: 4,),
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            backgroundColor: Color(0xffF1F6F9),
            child: Icon(CupertinoIcons.back),
          ),
        ),
      ),
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: Image.asset(ic_drower,scale: 4,),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
            AppLocalizations.of(context)!.translate("Wallet funds")!,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: greycolor_cust,
                ),
              ),
              Text(
                "THB $balance",
                style: TextStyle(
                  color: textcolor_cust,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Implement the preferredSize getter
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
