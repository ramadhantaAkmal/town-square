import 'package:flutter/material.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';

class GoalBannerDesktop extends StatelessWidget {
  final double? height;
  final double? width;
  const GoalBannerDesktop({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height ?? 121,
      decoration: const BoxDecoration(
        color: primary200,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You're close to your goal!",
              style: desktopSubtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: Column(
                      children: [
                        const Text(
                          "Join more sport activities to collect more points",
                          style: desktopBody3,
                          maxLines: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Row(
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
                                      style: mobileBody2.copyWith(
                                          color: neutralWhite),
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
                                      style: mobileBody2.copyWith(
                                          color: neutralWhite),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 65,
                      width: 65,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 0.6),
                        duration: const Duration(seconds: 0),
                        builder: (context, double value, child) => Stack(
                          fit: StackFit.expand,
                          children: [
                            CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              strokeWidth: 8,
                              value: value,
                              color: primary600,
                              backgroundColor: Colors.white,
                            ),
                            const Center(
                              child: Text(
                                "27",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
