import 'package:bmi_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../widgets/settings_container.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    String aboutUs = AppLocalizations.of(context)?.aboutus ?? '';
    double leftright = MediaQuery.of(context).size.width * (16 / 428);
    String rate = AppLocalizations.of(context)?.rateus ?? '';
    String signOut = AppLocalizations.of(context)?.signout ?? '';
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: leftright, right: leftright),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 6,
            ),
            CustomContainer(
              onPressed: () {},
              data: aboutUs,
            ),
            CustomContainer(
              onPressed: () {},
              data: rate,
            ),
            CustomContainer(
              onPressed: () {
                Get.offAllNamed(SignIn.routeName);
              },
              data: signOut,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
