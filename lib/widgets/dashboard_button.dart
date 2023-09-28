import 'package:bmi_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class BMICard extends StatelessWidget {
  VoidCallback openContainer;
  BMICard({super.key, required this.openContainer});

  @override
  Widget build(BuildContext context) {
    String calc =
        AppLocalizations.of(context)?.calculateyourbmi ?? 'Calculate your BMI';
    return InkWell(
      onTap: openContainer,
      child: Container(
        width: MediaQuery.of(context).size.width * (384 / 428),
        height: MediaQuery.of(context).size.height * (148 / 926),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(68),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 15,
              offset: Offset(7, 5),
              spreadRadius: 6,
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 12,
              offset: Offset(-7, -5),
              spreadRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              calc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(
              flex: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width * (152 / 428),
              height: MediaQuery.of(context).size.height * (95 / 926),
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(Asset.bmiIcon),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(251),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
