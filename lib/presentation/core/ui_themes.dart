import 'package:flutter/material.dart';

import 'color_schemes.g.dart';
import 'ui_colors.dart';
import 'ui_fonts.dart';

class UiTheme {
  static final OutlineInputBorder _borderInput = OutlineInputBorder(
    borderSide: BorderSide(color: appColorScheme.outline),
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    errorStyle: PrimaryFont.regular(fontSize: 12, color: UiColors.error),
    errorBorder: _borderInput.copyWith(borderSide: const BorderSide(color: UiColors.error)),
    focusedBorder: _borderInput.copyWith(borderSide: const BorderSide(color: UiColors.primary)),
    focusedErrorBorder: _borderInput.copyWith(borderSide: const BorderSide(color: UiColors.error)),
    disabledBorder: _borderInput.copyWith(borderSide: BorderSide(color: UiColors.outline.withOpacity(0.5))),
    enabledBorder: _borderInput,
    border: _borderInput,
    alignLabelWithHint: true,
  );

  static ThemeData getThemeData(BuildContext context) => ThemeData(
        inputDecorationTheme: _inputDecorationTheme,
        useMaterial3: true,
        colorScheme: appColorScheme,
        fontFamily: PrimaryFont.fontFamily,
        iconTheme: const IconThemeData(color: UiColors.text),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: UiColors.background,
          surfaceTintColor: UiColors.background,
        ),
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: UiColors.background,
          surfaceTintColor: UiColors.background,
        ),
        dialogTheme:
            const DialogTheme(backgroundColor: UiColors.background, surfaceTintColor: UiColors.background),
        popupMenuTheme: const PopupMenuThemeData(surfaceTintColor: UiColors.background),
      );
}
