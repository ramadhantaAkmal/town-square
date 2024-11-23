import 'package:flutter/material.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/activity/activity_widget.dart';
import 'package:town_square/features/activity_screen/banner/banner.dart';
import 'package:town_square/features/activity_screen/side_menu/side_menu.dart';
import 'package:town_square/utils/responsive_checker.dart';

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});
  static bool isDesktop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral100,
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Row(
          children: [
            if (isDesktop) ...[
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
              const SizedBox(width: defaultSize * 8.0),
            ],
            const ActivityWidget(),
            if (isDesktop) ...[
              const SizedBox(width: defaultSize * 13.0),
              const BannerWidget(),
            ],
          ],
        ),
      ),
    );
  }
}
