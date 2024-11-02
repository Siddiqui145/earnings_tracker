import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/earnings_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tickerController = TextEditingController();

  @override
  void dispose() {
    _tickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tickerController,
              decoration:
                  const InputDecoration(labelText: 'Enter Company Ticker'),
            ),
            ElevatedButton(
              onPressed: () async {
                final provider =
                    Provider.of<EarningsProvider>(context, listen: false);
                await provider.loadEarningsData(_tickerController.text.trim());

                if (provider.earningsData.isNotEmpty) {
                  Navigator.pushNamed(context, '/chart');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('No data found. Please check the ticker.')),
                  );
                }
              },
              child: const Text('Fetch Earnings Data'),
            ),
          ],
        ),
      ),
    );
  }
}
