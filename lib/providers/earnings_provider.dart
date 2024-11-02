import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/earnings_data.dart';

class EarningsProvider with ChangeNotifier {
  List<EarningsData> earningsData = [];
  String? transcript;

  Future<void> loadEarningsData(String ticker) async {
    try {
      final data = await ApiService.fetchEarningsData(ticker);
      if (data.isNotEmpty) {
        earningsData = data;
        notifyListeners(); 
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      debugPrint("Error loading earnings data: $e");
    }
  }

  Future<void> loadTranscript(String ticker, String year, String quarter) async {
    try {
      final transcriptData = await ApiService.fetchTranscript(ticker, year, quarter);
      transcript = transcriptData;
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading transcript: $e");
    }
  }
}
