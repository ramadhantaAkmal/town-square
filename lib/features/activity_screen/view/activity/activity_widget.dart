import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/activity_card.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/filter_button.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/goal_banner.dart';
import 'package:town_square/features/activity_screen/view/activity/widgets/search_textfield.dart';
import 'package:town_square/features/activity_screen/viewmodel/activity_bloc/activity_bloc.dart';
import 'package:town_square/main.dart';
import 'package:town_square/misc/activity_list.dart';
import 'package:town_square/utils/custom_scroll.dart';
import 'package:town_square/utils/responsive_checker.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  static final ScrollController scrollController = ScrollController();

  static List<String> categories = [];

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  bool isDesktop = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool theme = themeManager.themeMode == ThemeMode.dark;
    isDesktop = Responsive.isDesktop(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: defaultSize * 13,
            left: defaultSize * 6,
            right: defaultSize * 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tues, Nov 12",
                style: !isDesktop
                    ? mobileBody2.copyWith(color: neutral500)
                    : desktopBody1.copyWith(color: neutral500),
              ),
              if (!isDesktop)
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: theme
                          ? SvgPicture.asset("assets/icons/bell_darkmode.svg")
                          : SvgPicture.asset("assets/icons/bell.svg"),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        maxRadius: defaultSize * 5.0,
                        backgroundImage:
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
            style: textTheme.headlineLarge,
          ),
        ),
        if (!isDesktop)
          const Padding(
            padding: EdgeInsets.only(
              top: 19.29,
              left: defaultSize * 6,
              right: defaultSize * 6,
            ),
            child: GoalBanner(),
          ),
        const Padding(
          padding:
              EdgeInsets.symmetric(vertical: 18, horizontal: defaultSize * 6),
          child: SearchTextfield(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: ActivityWidget.scrollController,
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8, left: defaultSize * 6),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          backgroundColor:
                              const WidgetStatePropertyAll(purpleSecondary200)),
                      child: SvgPicture.asset("assets/icons/sliders.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "All",
                      fn: () {
                        if (ActivityWidget.categories.contains("all")) {
                          ActivityWidget.categories.remove("all");
                        } else {
                          ActivityWidget.categories.add("all");
                        }

                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Sports",
                      fn: () {
                        if (ActivityWidget.categories.contains("sports")) {
                          ActivityWidget.categories.remove("sports");
                        } else {
                          ActivityWidget.categories.add("sports");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Food",
                      fn: () {
                        if (ActivityWidget.categories.contains("food")) {
                          ActivityWidget.categories.remove("food");
                        } else {
                          ActivityWidget.categories.add("food");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Kids",
                      fn: () {
                        if (ActivityWidget.categories.contains("kids")) {
                          ActivityWidget.categories.remove("kids");
                        } else {
                          ActivityWidget.categories.add("kids");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Creative",
                      fn: () {
                        if (ActivityWidget.categories.contains("creative")) {
                          ActivityWidget.categories.remove("creative");
                        } else {
                          ActivityWidget.categories.add("creative");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Popular",
                      fn: () {
                        if (ActivityWidget.categories.contains("popular")) {
                          ActivityWidget.categories.remove("popular");
                        } else {
                          ActivityWidget.categories.add("popular");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterButton(
                      text: "Calm",
                      fn: () {
                        if (ActivityWidget.categories.contains("calm")) {
                          ActivityWidget.categories.remove("calm");
                        } else {
                          ActivityWidget.categories.add("calm");
                        }
                        BlocProvider.of<ActivityBloc>(context).add(
                            FilterActivity(
                                activityList, ActivityWidget.categories));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultSize * 6),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      DottedLine(
                        direction: Axis.vertical,
                        lineLength: 152.0 * (activityList.length + 1),
                        dashColor: neutral300,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: yellowSecondary300,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ActivityBloc, ActivityState>(
                  builder: (context, state) {
                    return state.when(
                      initial: (activities) {
                        var listActivity = activities;
                        return Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Today ",
                                    style: textTheme.titleLarge,
                                  ),
                                  Text(
                                    "/ tuesday",
                                    style:
                                        mobileBody2.copyWith(color: neutral500),
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 4,
                                child: ScrollConfiguration(
                                  behavior: MyCustomScrollBehavior(),
                                  child: ListView.builder(
                                    itemCount: listActivity.length,
                                    itemBuilder: (context, index) {
                                      return ActivityCard(
                                          activity: listActivity[index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () {
                        return const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      },
                      error: (message) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Center(
                            child: Icon(Icons.warning),
                          ),
                        );
                      },
                      success: (activities) {
                        var listActivity = activities;
                        return Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Today ",
                                    style: mobileSubtitle1,
                                  ),
                                  Text(
                                    "/ tuesday",
                                    style:
                                        mobileBody2.copyWith(color: neutral500),
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 4,
                                child: ScrollConfiguration(
                                  behavior: MyCustomScrollBehavior(),
                                  child: ListView.builder(
                                    itemCount: listActivity.length,
                                    itemBuilder: (context, index) {
                                      return ActivityCard(
                                          activity: listActivity[index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      empty: () {
                        return const Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Center(
                            child: Text(
                              "No activity yet",
                              style: desktopHeading2,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
