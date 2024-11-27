part of '../side_menu.dart';

builMenuButton(
    {required void Function()? onTap,
    required String title,
    required Widget widget}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget,
        Padding(
          padding: const EdgeInsets.only(left: defaultSize * 8),
          child: Text(
            title,
            style: desktopSubtitle1.copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
