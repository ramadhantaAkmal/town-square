import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:town_square/config/themes/text_styles.dart';
import 'package:town_square/config/themes/themes.dart';
import 'package:town_square/features/activity_screen/viewmodel/bloc/activity_bloc.dart';
import 'package:town_square/misc/activity_list.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final Function fn;
  const FilterButton({super.key, required this.text, required this.fn});

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
          widget.fn();
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
