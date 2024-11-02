class EarningsData {
  final String quarter;
  final double estimatedEarnings;
  final double actualEarnings;
  final DateTime date;

  EarningsData({
    required this.quarter,
    required this.estimatedEarnings,
    required this.actualEarnings,
    required this.date,
  });

  factory EarningsData.fromJson(Map<String, dynamic> json) {
    return EarningsData(
      quarter: json['quarter'] ?? '',
      estimatedEarnings: json['estimated']?.toDouble() ?? 0.0,
      actualEarnings: json['actual']?.toDouble() ?? 0.0,
      date: DateTime.parse(json['date']),
    );
  }
}
