import 'package:flutter/material.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';

class GoalBanner extends StatelessWidget {
  const GoalBanner({super.key, required this.isDesktop});
  final bool isDesktop;
  static final mobileFont = MobileFont();
  static final desktopFont = DesktopFont();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 106,
      decoration: const BoxDecoration(
          color: primary200,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: neutralBlackShadow,
                offset: Offset(3, 3),
                blurRadius: 8,
                spreadRadius: 0)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.29),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're close to your goal!",
                  style: !isDesktop
                      ? mobileFont.subtitle1_16
                      : desktopFont.subtitle1_20,
                ),
                Text(
                  "Join more sports activities to collect more points",
                  style: desktopFont.body3_12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 22,
                          width: 63,
                          decoration: const BoxDecoration(
                              color: neutralBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Text(
                              "Join now",
                              style: mobileFont.body2_12
                                  .copyWith(color: neutralWhite),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 22,
                          width: 63,
                          decoration: const BoxDecoration(
                              color: neutralBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Text(
                              "My points",
                              style: mobileFont.body2_12
                                  .copyWith(color: neutralWhite),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 0.5),
                duration: Duration(seconds: 0),
                builder: (context, double value, child) => Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      color: primary600,
                      backgroundColor: Colors.white,
                    ),
                    Center(
                      child: Text(
                        "27",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
