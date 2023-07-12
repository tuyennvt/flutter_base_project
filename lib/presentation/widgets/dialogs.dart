import 'package:flutter/material.dart';

import '../core/ui_colors.dart';
import 'dialog_container.dart';

Future<void> showLoadingFullscreenDialog(BuildContext context) async => await showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          WillPopScope(
        onWillPop: () async => false,
        child: Container(
          alignment: Alignment.center,
          color: Colors.black38,
          child: const CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black38,
    );

Future<void> showAppDialog(
  BuildContext context, {
  String title = 'Thông báo',
  Color titleColor = UiColors.text,
  Icon? icon,
  String subtitle = '',
  String subtitleActionText = '',
  VoidCallback? subtitleActionPressed,
  DialogAction? dialogAction,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => DialogContainer(
        title: title,
        titleColor: titleColor,
        icon: icon,
        subtitle: subtitle,
        subtitleActionText: subtitleActionText,
        subtitleActionPressed: subtitleActionPressed,
        dialogAction: dialogAction,
      ),
      barrierDismissible: false,
    );
