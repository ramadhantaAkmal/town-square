import 'package:flutter/material.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';

class FilterButton extends StatefulWidget {
  final String text;
  const FilterButton({super.key, required this.text});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
              isSelected ? purpleSecondary400 : purpleSecondary200)),
      child:
          Text(widget.text, style: desktopBody2.copyWith(color: neutralBlack)),
    );
  }
}
