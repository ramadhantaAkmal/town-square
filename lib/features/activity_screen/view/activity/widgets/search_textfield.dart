import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:town_square/config/constant/constant.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: neutralBlackShadow,
            offset: Offset(3, 3),
            blurRadius: 8,
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  bottom: defaultSize * 2, left: defaultSize * 4),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                "assets/icons/search.svg",
              ),
              hintText: "What do you feel like doing?",
              hintStyle: mobileBody1.copyWith(color: neutral500),
            ),
          ),
        ),
      ),
    );
  }
}
