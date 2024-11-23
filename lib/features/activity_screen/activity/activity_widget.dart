import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/activity/widgets/goal_banner.dart';
import 'package:town_square/utils/responsive_checker.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  static bool isDesktop = false;
  static final mobileFont = MobileFont();
  static final desktopFont = DesktopFont();

  @override
  Widget build(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
          vertical: defaultSize * 13, horizontal: defaultSize * 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tues,Nov 12",
                style: !isDesktop
                    ? mobileFont.body2_12.copyWith(color: neutral500)
                    : desktopFont.body1_14.copyWith(color: neutral500),
              ),
              if (!isDesktop)
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/bell.svg"),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        maxRadius: defaultSize * 5.0,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                        foregroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 19.29,
            ),
            child: Text(
              "This week in Estepona",
              style: !isDesktop
                  ? mobileFont.heading2_20.copyWith(color: neutralBlack)
                  : desktopFont.heading2_24.copyWith(color: neutralBlack),
            ),
          ),
          GoalBanner(
            isDesktop: isDesktop,
          ),
        ],
      ),
    );
  }
}
