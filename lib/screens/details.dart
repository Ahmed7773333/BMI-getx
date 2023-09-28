import 'package:bmi_app/app_theme.dart';
import 'package:bmi_app/screens/bottom_bar.dart';
import 'package:bmi_app/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../gets/calc.dart';

class Details extends StatelessWidget {
  const Details({super.key});
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    String summury = AppLocalizations.of(context)?.summary ?? 'summary';
    final Calculator calcController = Get.put(Calculator());
    return Scaffold(
      body: Column(children: [
        Center(
            child: Text(summury, style: Theme.of(context).textTheme.bodyLarge)),
        const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * (337 / 428),
          height: MediaQuery.of(context).size.height * (145 / 926),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.009999999776482582),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 20,
                offset: Offset(5, 10),
                spreadRadius: 15,
              ),
              BoxShadow(
                color: Color(0xFFFFFFFF),
                blurRadius: 20,
                offset: Offset(-5, -10),
                spreadRadius: 15,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                'Your BMI',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                calcController.bmi.toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 50),
              ),
              const Spacer(),
              Text(
                calcController.getBMIResult(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppTheme.purpleColor),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * (337 / 428),
          height: MediaQuery.of(context).size.height * (450 / 926),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.009999999776482582),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 20,
                offset: Offset(5, 10),
                spreadRadius: 15,
              ),
              BoxShadow(
                color: Color(0xFFFFFFFF),
                blurRadius: 20,
                offset: Offset(-5, -10),
                spreadRadius: 15,
              )
            ],
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Less than 18.5',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black.withOpacity(0.5))),
                TextSpan(
                    text: '              Underweight\n\n\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black)),
                TextSpan(
                    text: '18.5 to 24.9          ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black.withOpacity(0.5))),
                TextSpan(
                    text: '                       Healthy\n\n\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black)),
                TextSpan(
                    text: '25 to 29.9',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black.withOpacity(0.5))),
                TextSpan(
                    text: '                            Overweight\n\n\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black)),
                TextSpan(
                    text: '30 or above    ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black.withOpacity(0.5))),
                TextSpan(
                    text: '                               Obese',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
        const Spacer(),
        CustomElevatedButton(
          onPressed: () {
            Get.offAllNamed(BottomBarScreen.routeName);
          },
          data: AppLocalizations.of(context)!.save,
        ),
        const Spacer(),
      ]),
    );
  }
}
