import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/features/activity_screen/view/activity/activity_widget.dart';
import 'package:town_square/features/activity_screen/view/banner/banner.dart';
import 'package:town_square/features/activity_screen/view/side_menu/side_menu.dart';
import 'package:town_square/utils/responsive_checker.dart';
import 'package:town_square/utils/theme_controller.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

ThemeController _themeManager = ThemeController();

class _MainActivityState extends State<MainActivity> {
  bool isDesktop = false;
  bool isThemeMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      // backgroundColor: neutral100,
      extendBody: true,
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
      // floatingActionButton: _buildFAB(),
    );
  }

  _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isThemeMode = !isThemeMode;
        });
        _themeManager.toggleTheme(isThemeMode);
      },
      child: Icon(isThemeMode ? Icons.light_mode : Icons.dark_mode),
    );
  }

  _buildBody(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return Row(
      children: [
        if (isDesktop) ...[
          const SideMenu(),
          const SizedBox(width: defaultSize * 8.0),
        ],
        Expanded(
            child: SingleChildScrollView(
                child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 8, child: ActivityWidget()),
            if (isDesktop)
              Expanded(
                  flex: 4,
                  child: BannerWidget(
                    isDesktop: isDesktop,
                  )),
          ],
        ))),
      ],
    );
  }

  _buildBottomNavbar(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return !isDesktop
        ? BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            elevation: 7,
            onTap: (value) {
              //put some function when the navbar tapped
              //[value] is the index of the navbar item
              print(_themeManager.themeMode);
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/calendar.svg"),
                  label: "Activities",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/map.svg"),
                  label: "Locations"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/plus.svg"),
                  label: "add"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/users.svg"),
                  label: "users"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/star.svg"),
                  label: "Services"),
            ],
          )
        : null;
  }
}
