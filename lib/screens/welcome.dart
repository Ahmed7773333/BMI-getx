import 'package:bmi_app/assets.dart';
import 'package:bmi_app/widgets/image_container.dart';
import 'package:bmi_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/big_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageContainer(
              height: MediaQuery.of(context).size.height * (203 / 926),
              width: MediaQuery.of(context).size.width * (284 / 428),
              image: Asset.wellcome),
          const Spacer(),
          Text(
            AppLocalizations.of(context)?.startsen ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            AppLocalizations.of(context)?.startmes ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(
            flex: 5,
          ),
          CustomElevatedButton(
            data: AppLocalizations.of(context)?.start ?? '',
            onPressed: () {
              Get.offNamed(
                SignUp.routeName,
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
