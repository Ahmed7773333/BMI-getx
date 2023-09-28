import 'package:bmi_app/screens/bmi_results.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Calculator extends GetxController {
  final box = GetStorage();
  RxDouble height = 160.0.obs;
  RxDouble weight = 70.0.obs; // Initial weight value
  RxInt age = 25.obs; // Initial age value
  RxDouble bmi = 0.0.obs; // BMI value
  RxInt key = 0.obs;
  void updateHeight(double newHeight) {
    height.value = newHeight;
  }

  void increaseWeight() {
    if (weight.value < 220) {
      weight.value += 1.0;
    }
  }

  void decreaseWeight() {
    weight.value -= 1.0;
  }

  void increaseAge() {
    if (age.value < 120) {
      age.value += 1;
    }
  }

  void decreaseAge() {
    age.value -= 1;
  }

  // Calculate BMI
  void calculateBMI() {
    // Formula for BMI: weight (kg) / (height (m) * height (m))
    double heightInMeters = height.value / 100; // Convert height to meters
    bmi.value = weight.value / (heightInMeters * heightInMeters);
    box.write('bmi${key.value}', bmi.value);
    key.value++;
    Get.toNamed(BMIResult.routeName);
  }

  // Get BMI result
  String getBMIResult() {
    if (bmi.value < 18.5) {
      return 'Underweight';
    } else if (bmi.value >= 18.5 && bmi.value < 24.9) {
      return 'Normal';
    } else if (bmi.value >= 25 && bmi.value < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
