import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/model/activity_model.dart';
import 'package:town_square/main.dart';
import 'package:town_square/utils/responsive_checker.dart';
import 'package:town_square/utils/theme_controller.dart';

class ActivityCard extends StatefulWidget {
  final ActivityModel activity;
  const ActivityCard({super.key, required this.activity});

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    bool theme = themeManager.themeMode == ThemeMode.dark;
    Color? intensityColor;
    Color? intensityTitleColor;
    Color? categoryColor;
    Color? categoryTitleColor;
    switch (widget.activity.intensity) {
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

    switch (widget.activity.category) {
      case "childcare":
        categoryColor = childcareTag;
        categoryTitleColor = childcareTagTitle;
        break;

      default:
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: defaultSize * 4, right: 8),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: isDesktop ? 136 : 109,
        decoration: BoxDecoration(
          color: theme ? neutralBlack : Colors.white,
          border: Border.all(color: theme ? neutral600 : Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: neutralBlackShadow,
              offset: Offset(3, 3),
              blurRadius: 8,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                        widget.activity.time,
                        style: mobileBody2,
                      ),
                      Text(
                        " (${widget.activity.duration})",
                        style: mobileBody2.copyWith(color: neutral500),
                      ),
                    ],
                  ),
                  Text(
                    widget.activity.activityName,
                    style: isDesktop ? desktopSubtitle2 : mobileSubtitle2,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/map-pin.svg"),
                      Text(
                        widget.activity.location,
                        style: isDesktop
                            ? desktopBody1.copyWith(color: neutral500)
                            : mobileBody2.copyWith(color: neutral500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: isDesktop ? 22 : 16,
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: theme ? neutral600 : neutral200,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/user.svg"),
                            Text(
                              "${widget.activity.spots} spots left",
                              style: isDesktop
                                  ? desktopBody3.copyWith(
                                      color: theme ? neutral200 : neutral500)
                                  : mobileBody3.copyWith(color: neutral500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: isDesktop ? 22 : 16,
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: theme ? intensityTitleColor : intensityColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          widget.activity.intensity,
                          style: isDesktop
                              ? desktopBody3Bold.copyWith(
                                  color: theme
                                      ? intensityColor
                                      : intensityTitleColor!)
                              : mobileBody3Bold.copyWith(
                                  color: theme
                                      ? intensityColor
                                      : intensityTitleColor!),
                        ),
                      ),
                      if (widget.activity.category != null)
                        Container(
                          height: isDesktop ? 22 : 16,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: categoryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            widget.activity.category!,
                            style: isDesktop
                                ? desktopBody3Bold.copyWith(
                                    color: categoryTitleColor)
                                : mobileBody3Bold.copyWith(
                                    color: categoryTitleColor),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.activity.price,
                      style: isDesktop ? desktopSubtitle2 : mobileSubtitle2),
                  const SizedBox(
                    height: defaultSize * 4,
                  ),
                  widget.activity.spots > 0
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                            height: 33,
                            width: 58,
                            decoration: BoxDecoration(
                                color: theme ? Colors.white : neutralBlack,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: Text(
                                "Join",
                                style: isDesktop
                                    ? desktopBody1.copyWith(
                                        color:
                                            theme ? Colors.black : neutralWhite)
                                    : mobileBody2.copyWith(
                                        color: theme
                                            ? Colors.black
                                            : neutralWhite),
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
                                style:
                                    mobileBody2.copyWith(color: neutralWhite),
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
