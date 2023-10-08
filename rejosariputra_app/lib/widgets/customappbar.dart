import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rejosariputra_app/values/rejosari_putra_icon_icons.dart';

import '../values/colors.dart';

AppBar customAppBar(
  BuildContext context, {
  String? titleText,
  bool isReversible = true,
  bool isBlue = true,
  bool isMenuAvailable = false,
  IconData? actionIcon,
  VoidCallback? onActionClicked,
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: isBlue ? ColorPalette.primary : Colors.white,
    statusBarBrightness: isBlue ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: isBlue ? Brightness.light : Brightness.dark,
  ));
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    centerTitle: true,
    backgroundColor: isBlue ? ColorPalette.primary : Colors.white,
    leadingWidth: isReversible ? 60 : 0,
    leading: isReversible
        ? IconButton(
            icon: Icon(RejosariPutraIcons.chevronLeft, color: isBlue ? Colors.white : ColorPalette.neutral),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        : null,
    title: Text(
      titleText ?? "",
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall?.apply(
            color: isBlue ? Colors.white : ColorPalette.neutral,
          ),
    ),
    actions: isMenuAvailable
        ? [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: onActionClicked,
                icon: Icon(
                  actionIcon,
                  color: isBlue ? Colors.white : ColorPalette.neutral,
                ),
              ),
            ),
          ]
        : null,
  );
}
