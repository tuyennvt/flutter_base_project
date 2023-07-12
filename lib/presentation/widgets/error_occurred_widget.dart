import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../core/ui_colors.dart';
import '../core/ui_fonts.dart';

class ErrorOccurredWidget extends StatelessWidget {
  const ErrorOccurredWidget({Key? key, required this.msgError, required this.onRetry}) : super(key: key);

  final String msgError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.imagesError,
              width: 222,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Text(
                msgError,
                style: PrimaryFont.regular(fontSize: 16).copyWith(
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                minimumSize: const Size(0, 40),
                maximumSize: const Size(double.maxFinite, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
}

class ErrorOccurredLoadMoreWidget extends StatelessWidget {
  const ErrorOccurredLoadMoreWidget({
    Key? key,
    required this.onRetry,
    required this.msgError,
  }) : super(key: key);

  final String msgError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msgError, style: PrimaryFont.regular()),
            InkWell(
              onTap: onRetry,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: const BoxDecoration(
                  color: UiColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.refresh_rounded, size: 16, color: Colors.white),
                    const SizedBox(width: 4),
                    Text('Thử lại', style: PrimaryFont.regular(fontSize: 13, color: Colors.white))
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
