import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/view/banner/widget/goal_banner_desktop.dart';

class BannerWidget extends StatelessWidget {
  final bool isDesktop;
  const BannerWidget({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 65, bottom: 29),
          child: GoalBannerDesktop(
            height: 143,
            width: 283,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 29),
          child: Container(
            decoration: BoxDecoration(
                color: yellowSecondary200,
                borderRadius: BorderRadius.circular(10)),
            height: 209,
            width: 285,
            padding: EdgeInsets.only(left: 16, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weekly workshops",
                  style: desktopSubtitle2,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Text(
                    "for kids",
                    style: desktopSubtitle2,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Text(
                    "Sign up for early access to weekly activities for your kids full of learning and fun!",
                    style: desktopBody3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28,
                      width: 244,
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultSize * 2),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: neutralBlackShadow,
                                offset: Offset(3, 3),
                                blurRadius: 8,
                                spreadRadius: 0)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Learn more",
                            style: TextStyle(
                                fontFamily: "SFProDisplay",
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          SvgPicture.asset(
                              "assets/icons/arrow-right-circle.svg"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/Rectangle 32.png",
              width: 282,
              height: 302,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 282,
            height: 302,
            padding: EdgeInsets.only(left: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular events near you!",
                        style: desktopSubtitle1.copyWith(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 123),
                        child: Text(
                          "Unleash the fun! Explore the world",
                          style: desktopBody1.copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        "exciting events happening near you.",
                        style: desktopBody1.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 39,
                            width: 188,
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultSize * 2,
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: neutralBlackShadow,
                                      offset: Offset(3, 3),
                                      blurRadius: 8,
                                      spreadRadius: 0)
                                ]),
                            child: const Center(
                              child: Text(
                                "See more",
                                style: TextStyle(
                                    fontFamily: "SFProDisplay",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset('assets/images/Profiles.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
