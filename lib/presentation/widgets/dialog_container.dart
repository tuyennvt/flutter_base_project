import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../core/ui_colors.dart';
import '../core/ui_fonts.dart';
import 'positive_negative_button.dart';

class DialogAction {
  const DialogAction(this.action);

  factory DialogAction.only({
    String label = 'Đồng ý',
    VoidCallback? onPressed,
  }) =>
      DialogAction(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: FilledButton(
            onPressed: onPressed,
            child: Text(label),
          ),
        ),
      );

  factory DialogAction.positiveAndNegative({
    String labelPositive = 'Đồng ý',
    VoidCallback? pressedPositive,
    String labelNegative = 'Huỷ',
    VoidCallback? pressedNegative,
  }) =>
      DialogAction(
        PositiveNegativeButton(
          labelPositive: labelPositive,
          pressedPositive: pressedPositive,
          labelNegative: labelNegative,
          pressedNegative: pressedNegative,
        ),
      );

  final Widget action;
}

class DialogContainer extends StatelessWidget {
  const DialogContainer({
    Key? key,
    this.title = 'Thông báo',
    this.titleColor = UiColors.text,
    this.icon,
    this.subtitle = '',
    this.subtitleActionText = '',
    this.subtitleActionPressed,
    this.dialogAction,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final Icon? icon;
  final String subtitle;
  final String subtitleActionText;
  final VoidCallback? subtitleActionPressed;
  final DialogAction? dialogAction;

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: PrimaryFont.medium(fontSize: 20, color: titleColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if (icon != null) ...{
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: icon!,
                    ),
                  },
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: RichText(
                text: TextSpan(
                  text: subtitle,
                  style: PrimaryFont.regular(fontSize: 16).copyWith(height: 1.3),
                  children: [
                    TextSpan(
                      text: ' $subtitleActionText',
                      style: PrimaryFont.regular(fontSize: 16, color: UiColors.primary).copyWith(height: 1.3),
                      recognizer: TapGestureRecognizer()..onTap = () => subtitleActionPressed?.call(),
                    ),
                  ],
                ),
              ),
            ),
            if (dialogAction != null) ...{dialogAction!.action},
          ],
        ),
      );
}
