import 'package:bmi_app/screens/bmi_results.dart';
import 'package:bmi_app/screens/bottom_bar.dart';
import 'package:bmi_app/screens/details.dart';
import 'package:bmi_app/screens/forget_pass.dart';
import 'package:bmi_app/screens/otp_code.dart';
import 'package:bmi_app/screens/sign_in.dart';
import 'package:bmi_app/screens/sign_up.dart';
import 'package:bmi_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'app_theme.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: WelcomeScreen.routeName,
      getPages: [
        GetPage(
            name: WelcomeScreen.routeName, page: () => const WelcomeScreen()),
        GetPage(name: SignIn.routeName, page: () => SignIn()),
        GetPage(name: SignUp.routeName, page: () => SignUp()),
        GetPage(name: ForgetPassword.routeName, page: () => ForgetPassword()),
        GetPage(name: OTPScreen.routeName, page: () => OTPScreen()),
        GetPage(
            name: BottomBarScreen.routeName,
            page: () => const BottomBarScreen()),
        GetPage(name: BMIResult.routeName, page: () => const BMIResult()),
        GetPage(name: Details.routeName, page: () => const Details()),
      ],
    );
  }
}
