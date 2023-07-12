import 'package:flutter/material.dart';

class PositiveNegativeButton extends StatelessWidget {
  const PositiveNegativeButton({
    Key? key,
    this.labelPositive = 'Xong',
    this.pressedPositive,
    this.labelNegative = 'Huỷ',
    this.pressedNegative,
  }) : super(key: key);

  final String labelPositive;
  final VoidCallback? pressedPositive;
  final String labelNegative;
  final VoidCallback? pressedNegative;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: pressedNegative,
                child: Text(labelNegative),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: pressedPositive,
                child: Text(labelPositive),
              ),
            )
          ],
        ),
      );
}
