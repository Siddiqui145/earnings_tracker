import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/earnings_provider.dart';
import '../widgets/earnings_chart.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings Comparison')),
      body: Consumer<EarningsProvider>(
        builder: (context, provider, _) {
          if (provider.earningsData.isEmpty) {
            return const Center(child:  Text('No data available.'));
          }
          return EarningsChart(earningsData: provider.earningsData);
        },
      ),
    );
  }
}
