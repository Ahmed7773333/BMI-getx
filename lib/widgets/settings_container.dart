import 'package:bmi_app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;

  const CustomContainer({
    super.key,
    required this.onPressed,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * (30 / 926)),
      width: MediaQuery.of(context).size.width * (382 / 428),
      height: MediaQuery.of(context).size.height * (82 / 926),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppTheme.lightpurpleColor),
      child: Row(
        children: [
          const Spacer(),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppTheme.blueColor,
                ),
          ),
          const Spacer(
            flex: 5,
          ),
          InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.arrow_circle_right_outlined,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
