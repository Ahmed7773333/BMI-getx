import 'package:flutter/material.dart';
import '../app_theme.dart';

// ignore: must_be_immutable
class GenderBox extends StatelessWidget {
  String data;
  String image;
  GenderBox({super.key, required this.data, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * (30 / 428)),
          width: MediaQuery.of(context).size.width * (165 / 428),
          height: MediaQuery.of(context).size.height * (165 / 926),
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
            color: AppTheme.containerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Center(child: Text(data, style: Theme.of(context).textTheme.bodyLarge)),
      ],
    );
  }
}

class CounterContainer extends StatelessWidget {
  final VoidCallback onPressedIncrease;
  final VoidCallback onPressedDecrease;
  final String lable;
  final String count;

  const CounterContainer(
      {super.key,
      required this.lable,
      required this.count,
      required this.onPressedIncrease,
      required this.onPressedDecrease});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (177 / 428),
      height: MediaQuery.of(context).size.height * (216 / 926),
      decoration: ShapeDecoration(
        color: AppTheme.containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            lable,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            count,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: onPressedIncrease,
                child: Container(
                  width: 49,
                  height: 49,
                  decoration: const ShapeDecoration(
                    color: Color(0xBFC62FF8),
                    shape: OvalBorder(),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onPressedDecrease,
                child: Container(
                  width: 49,
                  height: 49,
                  decoration: const ShapeDecoration(
                    color: Color(0xBFC62FF8),
                    shape: OvalBorder(),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
