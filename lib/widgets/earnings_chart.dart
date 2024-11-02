import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/earnings_data.dart';

class EarningsChart extends StatelessWidget {
  final List<EarningsData> earningsData;

  const EarningsChart({super.key, required this.earningsData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: earningsData.map((data) => FlSpot(
                data.date.millisecondsSinceEpoch.toDouble(), data.estimatedEarnings)).toList(),
            isCurved: true,
            color: Colors.blue,
          ),
          LineChartBarData(
            spots: earningsData.map((data) => FlSpot(
                data.date.millisecondsSinceEpoch.toDouble(), data.actualEarnings)).toList(),
            isCurved: true,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
