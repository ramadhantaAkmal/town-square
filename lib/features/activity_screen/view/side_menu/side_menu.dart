import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
part 'widgets/menu_button.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: 272,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(
          top: defaultSize * 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 43,
              width: 156,
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  builMenuButton(
                    onTap: () {},
                    title: "Activities",
                    widget: SvgPicture.asset("assets/icons/calendar_white.svg"),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       SvgPicture.asset("assets/icons/calendar_white.svg"),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: defaultSize * 8),
                  //         child: Text(
                  //           "Activities",
                  //           style:
                  //               desktopSubtitle1.copyWith(color: Colors.white),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/map_white.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: defaultSize * 8),
                          child: Text(
                            "Locations",
                            style:
                                desktopSubtitle1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/star_white.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: defaultSize * 8),
                          child: Text(
                            "Services",
                            style:
                                desktopSubtitle1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/users_white.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: defaultSize * 8),
                          child: Text(
                            "Communities",
                            style:
                                desktopSubtitle1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/bell_white.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: defaultSize * 8),
                          child: Text(
                            "Notifications",
                            style:
                                desktopSubtitle1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/plus_sidemenu.svg"),
                    label: Text(
                      "Create",
                      style: desktopSubtitle1.copyWith(color: Colors.black),
                    ),
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(primary600),
                        fixedSize: WidgetStatePropertyAll(Size(180, 40))),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 54),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            maxRadius: defaultSize * 4.0,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                        ),
                        Text(
                          "Profile",
                          style: desktopSubtitle1.copyWith(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ))
                      ],
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
