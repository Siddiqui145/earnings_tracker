import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/earnings_provider.dart';
import 'screens/home_screen.dart';
import 'screens/chart_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EarningsProvider()),
      ],
      child: const EarningsTrackerApp(),
    ),
  );
}

class EarningsTrackerApp extends StatelessWidget {
  const EarningsTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earnings Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/chart': (context) => const ChartScreen(),
      },
    );
  }
}
