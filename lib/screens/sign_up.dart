import 'package:bmi_app/screens/bottom_bar.dart';
import 'package:bmi_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/big_button.dart';
import '../widgets/text_button.dart';
import '../widgets/text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    String welcome = AppLocalizations.of(context)?.welcome ?? '';
    String help = AppLocalizations.of(context)?.startsen ?? '';
    String hintEmail = AppLocalizations.of(context)?.enteremail ?? '';
    String hintPass = AppLocalizations.of(context)?.enterpassword ?? '';
    String hintName = AppLocalizations.of(context)?.enterfullname ?? '';
    String hintConfirm = AppLocalizations.of(context)?.confirmpassword ?? '';
    String signIn = AppLocalizations.of(context)?.signin ?? '';
    String alreadyHave = AppLocalizations.of(context)?.alreadyhaveaccount ?? '';
    String signUp = AppLocalizations.of(context)?.signup ?? '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(welcome, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          Text(help, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          CustomTextField(controller: nameController, hint: hintName),
          const Spacer(),
          CustomTextField(controller: emailController, hint: hintEmail),
          const Spacer(),
          CustomTextField(
              controller: passwordController, hint: hintPass, isPassword: true),
          const Spacer(),
          CustomTextField(
              controller: confirmPasswordController,
              hint: hintConfirm,
              isPassword: true),
          const Spacer(flex: 3),
          CustomElevatedButton(
              data: signUp,
              onPressed: () {
                Get.offNamed(BottomBarScreen.routeName);
              }),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(alreadyHave, style: Theme.of(context).textTheme.bodySmall),
              CustomTextButton(
                  onPressed: () {
                    Get.offNamed(SignIn.routeName);
                  },
                  data: signIn)
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
