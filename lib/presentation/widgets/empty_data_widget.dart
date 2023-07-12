import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../core/ui_fonts.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    Key? key,
    required this.onRetry,
    this.pullToRetry = false,
    this.message,
  }) : super(key: key);

  final VoidCallback onRetry;
  final bool pullToRetry;
  final String? message;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.imagesEmptyData,
                  width: 222,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                  child: Text(
                    message ?? 'Không có dữ liệu',
                    style: PrimaryFont.regular(fontSize: 16).copyWith(
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (pullToRetry)
                  const SizedBox()
                else
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
          ),
          if (pullToRetry)
            RefreshIndicator(
              onRefresh: () async {
                onRetry();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
              ),
            )
          else
            const SizedBox(),
        ],
      );
}
