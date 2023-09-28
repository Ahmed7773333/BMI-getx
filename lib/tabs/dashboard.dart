import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animations/animations.dart';

import '../screens/bmi_calc.dart';
import '../widgets/dashboard_button.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    double leftright = MediaQuery.of(context).size.width * (16 / 428);
    double top = MediaQuery.of(context).size.height * (60 / 926);
    String hi = AppLocalizations.of(context)?.hithere ?? 'Hi there';
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: leftright, right: leftright, top: top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hi, style: Theme.of(context).textTheme.bodyLarge),
            Text('big Name', style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            OpenContainer(
                transitionDuration: const Duration(milliseconds: 500),
                closedBuilder: (BuildContext _, VoidCallback openContainer) =>
                    BMICard(
                      openContainer: openContainer,
                    ),
                openBuilder: (BuildContext _, VoidCallback openContainer) {
                  return const BMICalc();
                }),
            const Spacer(flex: 9),
          ],
        ),
      ),
    );
  }
}
