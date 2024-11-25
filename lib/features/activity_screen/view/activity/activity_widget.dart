import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/activity_card.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/filter_button.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/goal_banner.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/search_textfield.dart';
import 'package:town_square/misc/activity_list.dart';
import 'package:town_square/utils/custom_scroll.dart';
import 'package:town_square/utils/responsive_checker.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  static bool isDesktop = false;
  static final mobileFont = MobileFont();
  static final desktopFont = DesktopFont();
  static final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    isDesktop = Responsive.isDesktop(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(
        bottom: 0,
        top: defaultSize * 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultSize * 6,
              right: defaultSize * 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tues, Nov 12",
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultSize * 6,
            ),
            child: Text(
              "This week in Estepona",
              style: !isDesktop
                  ? mobileFont.heading2_20.copyWith(color: neutralBlack)
                  : desktopFont.heading2_24.copyWith(color: neutralBlack),
            ),
          ),
          if (!isDesktop)
            Padding(
              padding: const EdgeInsets.only(
                top: 19.29,
                left: defaultSize * 6,
                right: defaultSize * 6,
              ),
              child: GoalBanner(
                isDesktop: isDesktop,
              ),
            ),
          const Padding(
            padding:
                EdgeInsets.symmetric(vertical: 18, horizontal: defaultSize * 6),
            child: SearchTextfield(),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8, left: defaultSize * 6),
                        child: TextButton(
                          onPressed: () {},
                          child: SvgPicture.asset("assets/icons/sliders.svg"),
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                  purpleSecondary200)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "All"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Sports"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Food"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Kids"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Creative"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Popular"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterButton(text: "Calm"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultSize * 6),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: yellowSecondary300,
                            ),
                          ),
                          DottedLine(
                            direction: Axis.vertical,
                            lineLength: MediaQuery.sizeOf(context).height,
                            dashColor: neutral300,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Today ",
                                style: mobileFont.subtitle1_16,
                              ),
                              Text(
                                "/ tuesday",
                                style: mobileFont.body2_12
                                    .copyWith(color: neutral500),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 4,
                            child: ScrollConfiguration(
                              behavior: MyCustomScrollBehavior(),
                              child: ListView.builder(
                                itemCount: activityList.length,
                                itemBuilder: (context, index) {
                                  return ActivityCard(
                                      activity: activityList[index]);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
