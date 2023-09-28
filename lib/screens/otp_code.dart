import 'package:bmi_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/big_button.dart';
import '../widgets/text_field.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  static const String routeName = '/otp';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    String sentence = AppLocalizations.of(context)?.getbackin ?? '';
    String sendOTP = AppLocalizations.of(context)?.otpmessage ?? '';
    String hintEmail = AppLocalizations.of(context)?.enteremail ?? '';
    String hintPass = AppLocalizations.of(context)?.enterpassword ?? '';

    String hintConfirm = AppLocalizations.of(context)?.confirmpassword ?? '';

    String otp = AppLocalizations.of(context)?.sendotp ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sentence, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          CustomTextField(controller: emailController, hint: hintEmail),
          const Spacer(),
          Text(sendOTP, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          CustomTextField(
              controller: passwordController, hint: hintPass, isPassword: true),
          const Spacer(),
          CustomTextField(
              controller: confirmPasswordController,
              hint: hintConfirm,
              isPassword: true),
          const Spacer(flex: 8),
          CustomElevatedButton(
              data: otp,
              onPressed: () {
                Get.offAllNamed(SignIn.routeName);
              }),
          const Spacer(),
        ],
      ),
    );
  }
}
