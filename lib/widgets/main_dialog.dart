import 'package:first_project/widgets/main_button.dart';
import 'package:flutter/material.dart';

class MainDialog extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback? onPressed;

  const MainDialog({
    Key? key,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 32.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 32.0),
            MainButton(
              title: buttonTitle,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}