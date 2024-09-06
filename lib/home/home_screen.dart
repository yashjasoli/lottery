import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:thai_lottery/faq/faq_screen.dart';
import 'package:thai_lottery/home/create_ticket.dart';
import 'package:thai_lottery/home/draw_results.dart';
import 'package:thai_lottery/home/order.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/payment/deposite_screen.dart';
import 'package:thai_lottery/payment/withdraw_screen.dart';
import 'package:thai_lottery/utility/app_bar.dart';
import 'package:thai_lottery/utility/colors.dart';
import 'package:thai_lottery/utility/dwers.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  late int thumselected = 0;
  late PersistentTabController _controller;
  SessionManager pref = SessionManager();
  late final WebViewController webcontroller;
  String url = 'https://www.google.co.in/';
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    pageController = PageController(initialPage: selectedIndex);
    wenload();
    getuserData();
  }

  wenload(){
    webcontroller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navigation) {
            if (navigation.url != url) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

getuserData()async {
  userName = await pref.getString("username", "");
  phoneNumber = await pref.getString("phone", "");
  balance = await pref.getString("balance", "");
  email = await pref.getString("email", "");
  setState(() {});
}
  final pages = [
    benarImage,
    benarImage,
    benarImage,
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBars(),
        drawer: drower(),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: false,
          stateManagement: false,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
          hideOnScrollSettings: HideOnScrollSettings(
            hideNavBarOnScroll: false,
            // scrollControllers: _scrollControllers,
          ),
          margin: EdgeInsets.symmetric(horizontal: 1),
          decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          padding: const EdgeInsets.only(top: 0, bottom: 8),
          // onWillPop: (final context) async {
          //   await showDialog(
          //     context: context ?? this.context,
          //     useSafeArea: true,
          //     builder: (final context) => Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.white,
          //       child: ElevatedButton(
          //         child: const Text("Close"),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   );
          //   return false;
          // },
          selectedTabScreenContext: (final context) {
            //  testContext = context;
          },
          backgroundColor: Color(0xffEAF7FF),
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              animateTabTransition: false,
              duration: Duration(milliseconds: 300),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
            onNavBarHideAnimation: OnHideAnimationSettings(
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ),
          ),
          confineToSafeArea: false,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle:
              NavBarStyle.style3, // Choose the nav bar style with this property
        ),
      ),
    );
  }

  homeView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 180,
                      //height: 200,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayCurve: Curves.ease,
                      onPageChanged: (indext, reason) {
                        thumselected = indext;
                        setState(() {});
                      }),
                  itemCount: pages.length,
                  itemBuilder: (context, indexc, indexx) {
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            pages[indexc],
                            //changed 200-200 to 600-600
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: pages.length,
                    position: thumselected,
                    decorator: DotsDecorator(
                      color: primarycolor_cust.withOpacity(0.7),
                      // Inactive color
                      activeColor: primarycolor_cust,
                      size: Size.square(6.0),
                      activeSize: const Size(10.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.white,
                                  )),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "  THAI LOTTERY  ",
                              style: GoogleFonts.aclonica(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Center(
                            child: Text(
                              "THB 80",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "THB 15,000,000",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                winding();
                              },
                              child: Container(
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Text(
                                    "PRIZES",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TicketGenerateScreen()));
                              },
                              child: Container(
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Text(
                                    "BUY NOW",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.white,
                                  )),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Text("  LATEST DRAW  ",
                                style: GoogleFonts.aclonica(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                )),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Feiday, 5 July 2024",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "33",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "14",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "26",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "38",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "01",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "29",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DrawResuits()));
                            //winding();
                          },
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Center(
                              child: Text(
                                "VIEW FULL RESULTS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: Image.asset(ic_home,scale: 3.5,),
          opacity: 0.7,
          activeColorPrimary: primarycolor_cust,

          inactiveColorPrimary: Colors.grey,
          //  scrollController: _scrollControllers.first,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/first": (final context) => const MainScreen2(),
              // "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ic_nev2,scale: 3.5,),
          activeColorPrimary: primarycolor_cust,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ic_web),
          activeColorPrimary: primarycolor_cust,
          inactiveColorPrimary: Colors.grey,
          // activeColorSecondary: _getSecondaryItemColorForSpecificStyles(),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ic_nev4,scale: 3.5,),
          activeColorPrimary: primarycolor_cust,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ic_nev5,scale: 3.5,),
          activeColorPrimary: primarycolor_cust,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  List<Widget> _buildScreens() => [
        homeView(),
    OrderScreen(),
        Container(
          height: 50,
          width: 50,
          child: WebViewWidget(
            controller: webcontroller,
          ),
        ),
    FaqScreen(),
    payment(),
        // MainScreen(
        //   menuScreenContext: widget.menuScreenContext,
        //   scrollController: _scrollControllers.first,
        //   hideStatus: _hideNavBar,
        //   onScreenHideButtonPressed: () {
        //     setState(() {
        //       _hideNavBar = !_hideNavBar;
        //     });
        //   },
        //   onNavBarStyleChanged: (final value) =>
        //       setState(() => _navBarStyle = value),
        // ),
        // MainScreen(
        //   menuScreenContext: widget.menuScreenContext,
        //   hideStatus: _hideNavBar,
        //   onScreenHideButtonPressed: () {
        //     setState(() {
        //       _hideNavBar = !_hideNavBar;
        //     });
        //   },
        //   onNavBarStyleChanged: (final value) =>
        //       setState(() => _navBarStyle = value),
        // ),
        // MainScreen(
        //   menuScreenContext: widget.menuScreenContext,
        //   hideStatus: _hideNavBar,
        //   onScreenHideButtonPressed: () {
        //     setState(() {
        //       _hideNavBar = !_hideNavBar;
        //     });
        //   },
        //   onNavBarStyleChanged: (final value) =>
        //       setState(() => _navBarStyle = value),
        // ),
        // MainScreen(
        //   menuScreenContext: widget.menuScreenContext,
        //   hideStatus: _hideNavBar,
        //   onScreenHideButtonPressed: () {
        //     setState(() {
        //       _hideNavBar = !_hideNavBar;
        //     });
        //   },
        //   onNavBarStyleChanged: (final value) =>
        //       setState(() => _navBarStyle = value),
        // ),
        // MainScreen(
        //   menuScreenContext: widget.menuScreenContext,
        //   scrollController: _scrollControllers.last,
        //   hideStatus: _hideNavBar,
        //   onScreenHideButtonPressed: () {
        //     setState(() {
        //       _hideNavBar = !_hideNavBar;
        //     });
        //   },
        //   onNavBarStyleChanged: (final value) =>
        //       setState(() => _navBarStyle = value),
        // ),
      ];

  payment(){
    return Container(
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
              'Payment',
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
                  'Deposite',
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
                  'Withdraw',
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
    );
  }

  winding() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      //elevates modal bottom screen
      elevation: 10,
      isScrollControlled: true,
      isDismissible: false,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "WINNINGS AMMOUNT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: dark_grey_background_cust,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Prices",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              Text(
                                "Win Amount",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "50Lakh THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "20Lakh THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "10Lakh THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "4 to 10",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "1Lakh THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "11 to 100",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "80K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "101 to 500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "40K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "501 to 1000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "20K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1001 to 1500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "10K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1501 to 2000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "5K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2001 to 2500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "1K THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2501 to 3000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                              Text(
                                "500 THB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                        color: primarycolor_cust.withOpacity(0.2), width: 2)),
                child: Icon(
                  Icons.clear,
                  color: primarycolor_cust,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
