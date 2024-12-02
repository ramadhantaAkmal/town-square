import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/view/activity/activity_widget.dart';
import 'package:town_square/features/activity_screen/view/banner/banner.dart';
import 'package:town_square/features/activity_screen/view/side_menu/side_menu.dart';
// import 'package:town_square/features/activity_screen/view/main_activity.dart';
import 'package:town_square/features/activity_screen/viewmodel/activity_bloc/activity_bloc.dart';
import 'package:town_square/utils/responsive_checker.dart';
import 'package:town_square/utils/theme_controller.dart';

void main() {
  runApp(const MainApp());
}

ThemeController themeManager = ThemeController();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    themeManager.removeListener(_themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(_themeListener);
    super.initState();
  }

  _themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    return BlocProvider(
      create: (context) => ActivityBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(isDesktop),
        darkTheme: getDarkTheme(isDesktop),
        themeMode: themeManager.themeMode,
        home: const MainActivity(),
      ),
    );
  }
}

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  bool isDesktop = false;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
      floatingActionButton: _buildFAB(),
    );
  }

  _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
        themeManager.toggleTheme(isDarkMode);
      },
      child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
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
            currentIndex: 2,
            elevation: 7,
            onTap: (value) {
              //put some function when the navbar tapped
              //[value] is the index of the navbar item
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(isDarkMode
                    ? "assets/icons/calendar_white.svg"
                    : "assets/icons/calendar.svg"),
                label: "Activities",
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(isDarkMode
                      ? "assets/icons/map_white.svg"
                      : "assets/icons/map.svg"),
                  label: "Locations"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(isDarkMode
                      ? "assets/icons/plus_darkmode.svg"
                      : "assets/icons/plus.svg"),
                  label: "add",
                  backgroundColor: isDarkMode ? neutralBlack : Colors.white),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(isDarkMode
                      ? "assets/icons/users_white.svg"
                      : "assets/icons/users.svg"),
                  label: "users"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(isDarkMode
                      ? "assets/icons/star_white.svg"
                      : "assets/icons/star.svg"),
                  label: "Services"),
            ],
          )
        : null;
  }
}
