import 'package:bmi_app/app_theme.dart';
import 'package:bmi_app/screens/details.dart';
import 'package:bmi_app/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../gets/calc.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({super.key});
  static const String routeName = '/result';

  @override
  Widget build(BuildContext context) {
    String result = AppLocalizations.of(context)?.bmiresults ?? 'result';
    final Calculator calcController = Get.put(Calculator());

    return Scaffold(
      appBar: AppBar(
        title: Text(result, style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Obx(
              () => Container(
                width: MediaQuery.of(context).size.width * (289 / 428),
                height: MediaQuery.of(context).size.height * (289 / 926),
                decoration: const ShapeDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 15,
                      offset: Offset(-7, -5),
                      spreadRadius: 15,
                    ),
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15,
                      offset: Offset(7, 5),
                      spreadRadius: 9,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                          progressBarColor: AppTheme.purpleColor,
                          trackColor: Colors.grey,
                          dotColor: Colors.transparent),
                      size: 200.0,
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 22,
                        trackWidth: 22,
                      ),
                      angleRange: 360,
                      startAngle: 0,
                      infoProperties: InfoProperties(
                        modifier: (double value) {
                          return value.toStringAsFixed(2);
                        },
                      ),
                    ),
                    min: 0,
                    max: 45.45,
                    initialValue: double.parse(
                      calcController.bmi.toStringAsFixed(2),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'You have ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: calcController.getBMIResult(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppTheme.purpleColor)),
                TextSpan(
                    text: ' body weight!',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          CustomElevatedButton(
              onPressed: () {
                Get.toNamed(Details.routeName);
              },
              data: AppLocalizations.of(context)?.details ?? 'Details'),
          const Spacer(),
        ],
      ),
    );
  }
}
