import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/earnings_provider.dart';

class TranscriptScreen extends StatelessWidget {
  final String ticker;
  final String year;
  final String quarter;

const TranscriptScreen(
      {super.key, required this.ticker, required this.year, required this.quarter});

  @override
  Widget build(BuildContext context) {
    final earningsProvider = Provider.of<EarningsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Earnings Transcript')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await earningsProvider.loadTranscript(ticker, year, quarter);
            },
            child:const Text('Load Transcript'),
          ),
          Expanded(
            child: Consumer<EarningsProvider>(
              builder: (context, provider, child) {
                if (provider.transcript == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        provider.transcript ?? 'No transcript available.',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
