import 'package:bmi_app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        data,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppTheme.blueColor,
            ),
      ),
    );
  }
}
