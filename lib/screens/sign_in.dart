import 'package:bmi_app/assets.dart';
import 'package:bmi_app/widgets/image_container.dart';
import 'package:bmi_app/screens/bottom_bar.dart';
import 'package:bmi_app/screens/forget_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/big_button.dart';
import '../widgets/text_button.dart';
import '../widgets/text_field.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    String welcome = AppLocalizations.of(context)?.welcomeback ?? '';

    String hintEmail = AppLocalizations.of(context)?.enteremail ?? '';
    String hintPass = AppLocalizations.of(context)?.enterpassword ?? '';
    String forget = AppLocalizations.of(context)?.forgotpassword ?? '';
    String signIn = AppLocalizations.of(context)?.signin ?? '';
    String noAccount = AppLocalizations.of(context)?.noaccount ?? '';
    String signUp = AppLocalizations.of(context)?.signup ?? '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            welcome,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          ImageContainer(
              height: MediaQuery.of(context).size.height * (228 / 926),
              width: MediaQuery.of(context).size.width * (310 / 428),
              image: Asset.wellcomeBack),
          const Spacer(),
          CustomTextField(controller: emailController, hint: hintEmail),
          const Spacer(),
          CustomTextField(
              controller: passwordController, hint: hintPass, isPassword: true),
          const Spacer(),
          CustomTextButton(
              onPressed: () {
                Get.toNamed(ForgetPassword.routeName);
              },
              data: forget),
          const Spacer(
            flex: 3,
          ),
          CustomElevatedButton(
            data: signIn,
            onPressed: () {
              Get.offNamed(BottomBarScreen.routeName);
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(noAccount, style: Theme.of(context).textTheme.bodySmall),
              CustomTextButton(
                  onPressed: () {
                    Get.offNamed(SignUp.routeName);
                  },
                  data: signUp)
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
