import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/model/activity_model.dart';
import 'package:town_square/utils/responsive_checker.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;
  const ActivityCard({super.key, required this.activity});

  static final mobileFont = MobileFont();
  static final desktopFont = DesktopFont();

  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    Color? intensityColor;
    Color? intensityTitleColor;
    Color? categoryColor;
    Color? categoryTitleColor;
    switch (activity.intensity) {
      case "high":
        intensityColor = highIntensity;
        intensityTitleColor = highIntensityTitle;
        break;
      case "medium":
        intensityColor = mediumIntensity;
        intensityTitleColor = mediumIntensityTitle;
        break;
      case "light":
        intensityColor = lightIntensity;
        intensityTitleColor = lightIntensityTitle;
        break;
      default:
    }

    switch (activity.category) {
      case "childcare":
        categoryColor = childcareTag;
        categoryTitleColor = childcareTagTitle;
        break;

      default:
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: defaultSize * 4),
      child: Container(
        width: 200,
        height: isDesktop ? 136 : 109,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: neutralBlackShadow,
              offset: Offset(3, 3),
              blurRadius: 8,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        activity.time,
                        style: mobileFont.body2_12,
                      ),
                      Text(
                        " (${activity.duration} min)",
                        style: mobileFont.body2_12.copyWith(color: neutral500),
                      ),
                    ],
                  ),
                  Text(
                    activity.activityName,
                    style: isDesktop
                        ? desktopFont.subtitle2_20
                        : mobileFont.subtitle2_14,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/map-pin.svg"),
                      Text(
                        activity.location,
                        style: isDesktop
                            ? desktopFont.body1_14
                            : mobileFont.body2_12.copyWith(color: neutral500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: isDesktop ? 22 : 16,
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: neutral200,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/user.svg"),
                            Text(
                              "${activity.spots} spots left",
                              style: isDesktop
                                  ? desktopFont.body3_12
                                      .copyWith(color: neutral500)
                                  : mobileFont.body3_10
                                      .copyWith(color: neutral500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: isDesktop ? 22 : 16,
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: intensityColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          activity.intensity,
                          style: isDesktop
                              ? desktopFont.body3bold_12
                                  .copyWith(color: intensityTitleColor!)
                              : mobileFont.body3bold_10
                                  .copyWith(color: intensityTitleColor!),
                        ),
                      ),
                      if (activity.category != null)
                        Container(
                          height: isDesktop ? 22 : 16,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: categoryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            activity.category!,
                            style: isDesktop
                                ? desktopFont.body3bold_12
                                    .copyWith(color: categoryTitleColor)
                                : mobileFont.body3bold_10
                                    .copyWith(color: categoryTitleColor),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${activity.price}€",
                    style: isDesktop
                        ? desktopFont.subtitle2_20
                        : mobileFont.subtitle2_14,
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  activity.spots > 0
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                            height: 33,
                            width: 58,
                            decoration: const BoxDecoration(
                                color: neutralBlack,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                "Join",
                                style: mobileFont.body2_12
                                    .copyWith(color: neutralWhite),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            height: 33,
                            width: 58,
                            decoration: const BoxDecoration(
                                color: neutral500,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                "Sold out",
                                style: mobileFont.body2_12
                                    .copyWith(color: neutralWhite),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
