import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/big_button.dart';
import '../widgets/text_field.dart';
import 'otp_code.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  static const String routeName = '/forget';
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String sentence = AppLocalizations.of(context)?.getbackin ?? '';
    String sendOTP = AppLocalizations.of(context)?.sendotpmessage ?? '';
    String hintEmail = AppLocalizations.of(context)?.enteremail ?? '';
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
          const Spacer(flex: 8),
          CustomElevatedButton(
              data: otp,
              onPressed: () {
                Get.toNamed(OTPScreen.routeName);
              }),
          const Spacer(),
        ],
      ),
    );
  }
}
