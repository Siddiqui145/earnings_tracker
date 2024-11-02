import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/earnings_data.dart';

class ApiService {
  static const String _baseUrl = 'https://api.api-ninjas.com/v1';
  static const String _apiKey = 'YOUR_API_KEY_HERE';

  static Future<List<EarningsData>> fetchEarningsData(String ticker) async {
    final url = Uri.parse('$_baseUrl/earningscalendar').replace(
      queryParameters: {'ticker': ticker},
    );

    try {
      final response = await http.get(url, headers: {'X-Api-Key': _apiKey});

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => EarningsData.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load earnings data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching earnings data: $e');
      rethrow;
    }
  }

  static Future<String> fetchTranscript(
      String ticker, String year, String quarter) async {
    final url = Uri.parse('$_baseUrl/earningstranscript').replace(
      queryParameters: {
        'ticker': ticker,
        'year': year,
        'quarter': quarter,
      },
    );

    try {
      final response = await http.get(url, headers: {'X-Api-Key': _apiKey});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['transcript'] ?? 'No transcript available';
      } else {
        throw Exception('Failed to load transcript: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching transcript: $e');
      rethrow;
    }
  }
}
