import 'package:bmi_app/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../app_theme.dart';
import '../assets.dart';
import '../gets/calc.dart';
import '../widgets/calculator_widgets.dart';

class BMICalc extends StatelessWidget {
  const BMICalc({super.key});

  @override
  Widget build(BuildContext context) {
    String calc =
        AppLocalizations.of(context)?.calculater ?? 'Calculate your BMI';
    String male = AppLocalizations.of(context)?.male ?? 'Male';
    String female = AppLocalizations.of(context)?.female ?? 'feMale';
    String age = AppLocalizations.of(context)?.age ?? 'Age';
    String weight = AppLocalizations.of(context)?.weight ?? 'weight';
    String height = AppLocalizations.of(context)?.height ?? 'Height';
    String calaulate = AppLocalizations.of(context)?.calculatebmi ?? 'Height';

    final Calculator calcController = Get.put(Calculator());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          calc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderBox(
                data: male,
                image: Asset.male,
              ),
              GenderBox(
                data: female,
                image: Asset.female,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * (390 / 428),
            height: MediaQuery.of(context).size.height * (192 / 926),
            decoration: ShapeDecoration(
              color: AppTheme.containerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  height,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppTheme.purpleColor),
                ),
                Obx(
                  () => Text(
                    '${calcController.height.value.toStringAsFixed(1)}cm',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppTheme.purpleColor),
                  ),
                ),
                Obx(
                  // Observe the height value from the controller
                  () => Slider(
                    inactiveColor: AppTheme.lightpurpleColor,
                    activeColor: AppTheme.purpleColor,

                    value: calcController.height.value,
                    onChanged: (newHeight) {
                      // Use the controller to update the height value
                      calcController.updateHeight(newHeight);
                    },
                    min: 100.0, // Minimum height value
                    max: 220.0, // Maximum height value
                    divisions: 1200, // Number of divisions or steps
                    label: calcController.height.value.toStringAsFixed(1),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Obx(
            () => Row(
              children: [
                const Spacer(),
                CounterContainer(
                    lable: weight,
                    count: calcController.weight.value.toString(),
                    onPressedIncrease: calcController.increaseWeight,
                    onPressedDecrease: calcController.decreaseWeight),
                const Spacer(),
                CounterContainer(
                    lable: age,
                    count: calcController.age.value.toString(),
                    onPressedIncrease: calcController.increaseAge,
                    onPressedDecrease: calcController.decreaseAge),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
              onPressed: calcController.calculateBMI, data: calaulate)
        ],
      ),
    );
  }
}
