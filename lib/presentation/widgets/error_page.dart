import 'package:flutter/material.dart';

import '../core/ui_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    this.error = 'Không tìm thấy trang',
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              error,
              style: PrimaryFont.regular(fontSize: 16),
            ),
          ),
        ),
      );
}
