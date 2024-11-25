import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/view/activity/activity_widget.dart';
import 'package:town_square/features/activity_screen/view/banner/banner.dart';
import 'package:town_square/features/activity_screen/view/side_menu/side_menu.dart';
import 'package:town_square/utils/responsive_checker.dart';

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});
  static bool isDesktop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: neutral100,
      extendBody: true,
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavbar(context),
    );
  }

  _buildBody(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return Container(
      // constraints: BoxConstraints(maxWidth: maxWidth),
      child: Row(
        children: [
          if (isDesktop) ...[
            const Expanded(
              flex: 3,
              child: SideMenu(),
            ),
            const SizedBox(width: defaultSize * 8.0),
          ],
          Expanded(flex: 5, child: ActivityWidget()),
          if (isDesktop) ...[
            const SizedBox(width: defaultSize * 13.0),
            const BannerWidget(),
          ],
        ],
      ),
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
              print(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/calendar.svg"),
                  label: "calendar",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/map.svg"), label: "map"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/plus.svg"),
                  label: "add"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/users.svg"),
                  label: "users"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/star.svg"),
                  label: "star"),
            ],
          )
        : null;
  }
}
