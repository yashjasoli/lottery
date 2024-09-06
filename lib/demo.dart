// ignore_for_file: avoid_redundant_argument_values

import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

BuildContext? testContext;

class MyApps extends StatelessWidget {
  const MyApps({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
    title: "Persistent Bottom Navigation Bar example project",
    theme: ThemeData.dark(),
    home: const MainMenu(),
    initialRoute: "/",
    routes: {
    },
  );
}

class MainMenu extends StatefulWidget {
  const MainMenu({final Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Sample Project"),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: ElevatedButton(
            child: const Text("Built-in styles example"),
            onPressed: () => PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: ProvidedStylesExample(
                menuScreenContext: context,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// ----------------------------------------- Provided Style ----------------------------------------- //

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({
    required this.menuScreenContext,
    final Key? key,
  }) : super(key: key);
  final BuildContext menuScreenContext;

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
  ];

  NavBarStyle _navBarStyle = NavBarStyle.simple;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    super.dispose();
  }

  List<Widget> _buildScreens() => [
    Container(
      height: 50,
      width: 50,
    ),
    Container(
      height: 50,
      width: 50,
    ),
    Container(
      height: 50,
      width: 50,
    ),
    Container(
      height: 50,
      width: 50,
    ),
    Container(
      height: 50,
      width: 50,
    ),
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

  Color? _getSecondaryItemColorForSpecificStyles() =>
      _navBarStyle == NavBarStyle.style7 ||
          _navBarStyle == NavBarStyle.style10 ||
          _navBarStyle == NavBarStyle.style15 ||
          _navBarStyle == NavBarStyle.style16 ||
          _navBarStyle == NavBarStyle.style17 ||
          _navBarStyle == NavBarStyle.style18
          ? Colors.white
          : null;

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      opacity: 0.7,
      activeColorPrimary: Colors.blue,
      activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
          _navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
      inactiveColorPrimary: Colors.grey,
      scrollController: _scrollControllers.first,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
         // "/first": (final context) => const MainScreen2(),
         // "/second": (final context) => const MainScreen3(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Search",
      activeColorPrimary: Colors.teal,
      activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
          _navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: "Add",
      activeColorPrimary: Colors.blueAccent,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: _getSecondaryItemColorForSpecificStyles(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.message),
      title: "Messages",
      activeColorPrimary: Colors.deepOrange,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
          _navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: "Settings",
      activeColorPrimary: Colors.indigo,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
          _navBarStyle == NavBarStyle.style10
          ? Colors.white
          : null,
      scrollController: _scrollControllers.last,
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Navigation Bar Demo"),
      backgroundColor: Colors.grey.shade900,
    ),
    drawer: const Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This is the Drawer"),
          ],
        ),
      ),
    ),
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
        scrollControllers: _scrollControllers,
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      ),
      padding: const EdgeInsets.only(top: 0,bottom: 8),
      onWillPop: (final context) async {
        await showDialog(
          context: context ?? this.context,
          useSafeArea: true,
          builder: (final context) => Container(
            height: 50,
            width: 50,
            color: Colors.white,
            child: ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
        return false;
      },
      selectedTabScreenContext: (final context) {
        testContext = context;
      },
      backgroundColor: Colors.grey.shade900,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType:
          ScreenTransitionAnimationType.fadeIn,
        ),
        onNavBarHideAnimation: OnHideAnimationSettings(
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceInOut,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property
    ),
  );
}

// ----------------------------------------- Custom Style ----------------------------------------- //

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
      this.items, {
        required this.selectedIndex,
        required this.onItemSelected,
        final Key? key,
      }) : super(key: key);
  final int selectedIndex;
  // List<PersistentBottomNavBarItem> is just for example here. It can be anything you want like List<YourItemWidget>
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  Widget _buildItem(
      final PersistentBottomNavBarItem item, final bool isSelected) =>
      Container(
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: 26,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                      item.title ?? "",
                      style: TextStyle(
                          color: isSelected
                              ? (item.activeColorSecondary ??
                              item.activeColorPrimary)
                              : item.inactiveColorPrimary,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(final BuildContext context) => Container(
    color: Colors.grey.shade900,
    child: SizedBox(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((final item) {
          final int index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: _buildItem(item, selectedIndex == index),
            ),
          );
        }).toList(),
      ),
    ),
  );
}



class CustomWidgetExample extends StatefulWidget {
  const CustomWidgetExample({
    required this.menuScreenContext,
    final Key? key,
  }) : super(key: key);
  final BuildContext menuScreenContext;

  @override
  _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  late PersistentTabController _controller;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    super.dispose();
  }

  List<CustomNavBarScreen> _buildScreens() => [
    CustomNavBarScreen(
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => const MainScreen2(),
          "/second": (final context) => const MainScreen3(),
        },
      ),
      screen: MainScreen(
        menuScreenContext: widget.menuScreenContext,
        scrollController: _scrollControllers.first,
        hideStatus: _hideNavBar,
        showNavBarStyles: false,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ),
    CustomNavBarScreen(
      screen: MainScreen(
        menuScreenContext: widget.menuScreenContext,
        scrollController: _scrollControllers[1],
        hideStatus: _hideNavBar,
        showNavBarStyles: false,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ),
    CustomNavBarScreen(
      screen: MainScreen(
        menuScreenContext: widget.menuScreenContext,
        scrollController: _scrollControllers[2],
        hideStatus: _hideNavBar,
        showNavBarStyles: false,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ),
    CustomNavBarScreen(
      screen: MainScreen(
        menuScreenContext: widget.menuScreenContext,
        scrollController: _scrollControllers[3],
        hideStatus: _hideNavBar,
        showNavBarStyles: false,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ),
    CustomNavBarScreen(
      screen: MainScreen(
        menuScreenContext: widget.menuScreenContext,
        scrollController: _scrollControllers.last,
        hideStatus: _hideNavBar,
        showNavBarStyles: false,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ),
  ];

  // List<PersistentBottomNavBarItem> is just for example here. It can be anything you want like List<YourItemWidget>
  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Search",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: "Add",
      activeColorPrimary: Colors.deepOrange,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: "Settings",
      activeColorPrimary: Colors.indigo,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: "Settings",
      activeColorPrimary: Colors.indigo,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Navigation Bar Demo")),
    drawer: const Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This is the Drawer"),
          ],
        ),
      ),
    ),
    body: PersistentTabView.custom(
      context,
      controller: _controller,
      screens: _buildScreens(),
      itemCount: 5,
      isVisible: !_hideNavBar,
      hideOnScrollSettings: HideOnScrollSettings(
        hideNavBarOnScroll: true,
        scrollControllers: _scrollControllers,
      ),
      backgroundColor: Colors.grey.shade900,
      customWidget: CustomNavBarWidget(
        _navBarsItems(),
        onItemSelected: (final index) {
          //Scroll to top
          if (index == _controller.index) {
            _scrollControllers[index].animateTo(0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
          }

          setState(() {
            _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
          });
        },
        selectedIndex: _controller.index,
      ),
    ),
  );
}




class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    this.scrollController,
    this.onNavBarStyleChanged,
    final Key? key,
    this.hideStatus = false,
    this.showNavBarStyles = true,
  }) : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;
  final ScrollController? scrollController;
  final Function(NavBarStyle)? onNavBarStyleChanged;
  final bool showNavBarStyles;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    controller: scrollController,
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 6,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: InputDecoration(hintText: "Test Text Field"),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: "/home"),
                    screen: const MainScreen2(),
                    pageTransitionAnimation:
                    PageTransitionAnimation.scaleRotate,
                  );
                },
                child: const Text(
                  "Go to Second Screen ->",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    useRootNavigator: true,
                    builder: (final context) => Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Exit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Push bottom sheet on TOP of Nav Bar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    useRootNavigator: false,
                    builder: (final context) => Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Exit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Push bottom sheet BEHIND the Nav Bar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                child: const Text(
                  "Push Dynamic/Modal Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: onScreenHideButtonPressed,
                child: Text(
                  hideStatus
                      ? "Reveal Navigation Bar"
                      : "Hide Navigation Bar",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(menuScreenContext).pop();
                },
                child: const Text(
                  "<- Main Menu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              if (showNavBarStyles)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Navigation Bar Style",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 4,
                      children: List.generate(
                        NavBarStyle.values.length,
                            (final index) => ElevatedButton(
                          onPressed: () => onNavBarStyleChanged
                              ?.call(NavBarStyle.values[index]),
                          style: const ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(Colors.teal)),
                          child: Text(
                            NavBarStyle.values[index].name.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
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
    ),
  );
}

class MainScreen2 extends StatelessWidget {
  const MainScreen2({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Colors.teal,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: const MainScreen3());
            },
            child: const Text(
              "Go to Third Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Go Back to First Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

class MainScreen3 extends StatelessWidget {
  const MainScreen3({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Colors.deepOrangeAccent,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Go Back to Second Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              PersistentNavBarNavigator
                  .popUntilFirstScreenOnSelectedTabScreen(context);
            },
            child: const Text(
              "Pop back to First screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}