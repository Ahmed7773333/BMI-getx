import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../gets/calc.dart';

class ChartTab extends StatelessWidget {
  ChartTab({super.key});
  final box = GetStorage();
  final Calculator calcController = Get.put(Calculator());

  List<double>? chart() {
    List<double> ls = [];
    var keys = box.getKeys();
    for (var key in keys) {
      double d = box.read(key);
      ls.add(double.parse(d.toStringAsFixed(0)));
    }
    return ls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (50 / 926)),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * (400 / 428),
            height: MediaQuery.of(context).size.width * (800 / 926),
            child: MyLineChart(data: chart() ?? [0])),
      ),
    );
  }
}

class MyLineChart extends StatelessWidget {
  final List<double> data;

  const MyLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: data.asMap().entries.map((e) {
              // Convert each data point into a FlSpot
              return FlSpot(e.key.toDouble(), e.value);
            }).toList(),
            isCurved: true,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(show: true),
          ),
        ],
      ),
    );
  }
}
