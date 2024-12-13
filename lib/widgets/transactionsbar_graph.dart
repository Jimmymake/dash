import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transactions {
  final int id;
  final String transactionReport;
  final String sourceOfFunds;
  final double amount;
  final DateTime dateAdded;

  Transactions({
    required this.id,
    required this.transactionReport,
    required this.sourceOfFunds,
    required this.amount,
    required this.dateAdded,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'],
      transactionReport: json['transactionReport'],
      sourceOfFunds: json['sourceOfFunds'],
      amount: json['amount'].toDouble(),
      dateAdded: DateTime.fromMillisecondsSinceEpoch(json['dateAdded'] * 1000),
    );
  }
}

class StatsBarChart extends StatefulWidget {
  StatsBarChart({super.key});
  final Color leftBarColor = Colors.blue.shade700;
  final Color rightBarColor = Colors.blue.shade200;

  @override
  State<StatefulWidget> createState() => StatsBarChartState();
}

class StatsBarChartState extends State<StatsBarChart> {
  final double width = 20;

  List<Transactions> transactions = [];
  bool isLoading = false;
  String errorMessage = '';
  Map<DateTime, Map<String, double>> dailyTotals = {};

  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      final url = Uri.parse(
          'https://mam-laka-gateway-api.mam-laka.com/api/merchant-transactions/filter?userId=1000');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List data = jsonData;

        transactions = data.map((json) => Transactions.fromJson(json)).toList();

        for (var transaction in transactions) {
          final date = DateTime(transaction.dateAdded.year,
              transaction.dateAdded.month, transaction.dateAdded.day);
          dailyTotals.putIfAbsent(date, () => {'MPESA': 0, 'Merchant': 0});

          if (transaction.sourceOfFunds == 'MPESA' &&
              transaction.transactionReport == 'withdraw') {
            dailyTotals[date]!['MPESA'] =
                (dailyTotals[date]!['MPESA'] ?? 0) + transaction.amount;
          } else if (transaction.sourceOfFunds == 'Merchant' &&
              transaction.transactionReport == 'collection') {
            dailyTotals[date]!['Merchant'] =
                (dailyTotals[date]!['Merchant'] ?? 0) + transaction.amount;
          }
        }

        setState(() {});
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load transactions: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  double _calculateMaxY() {
    double highestValue = 0;
    dailyTotals.forEach((_, amounts) {
      highestValue = [
        highestValue,
        amounts['MPESA'] ?? 0,
        amounts['Merchant'] ?? 0,
      ].reduce((a, b) => a > b ? a : b);
    });
    return 100000; // Add some padding (20%) above the highest value
  }

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white70,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transactions graph",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildLegendItem(widget.leftBarColor, "Payins"),
                const SizedBox(width: 16),
                _buildLegendItem(widget.rightBarColor, "Payouts"),
              ],
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 2.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage.isNotEmpty
                        ? Center(child: Text(errorMessage))
                        : BarChart(
                            BarChartData(
                              maxY: _calculateMaxY(),
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  // tooltipBgColor: Colors.blueGrey.shade800,
                                  getTooltipItem: _getTooltipItem,
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitles,
                                    reservedSize: 35,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  axisNameWidget: const Text(
                                    'Amount (KES)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: leftTitles,
                                    reservedSize: 60,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              barGroups: _buildBarGroups(),
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: true,
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Colors.grey.withOpacity(0.2),
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.grey.withOpacity(0.2),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == 0) {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        _formatCurrency(value),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}';
    } else if (value >= 100) {
      return '${(value / 100).toStringAsFixed(1)}';
    }
    return value.toStringAsFixed(0);
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = dailyTotals.keys
        .toList()
        .take(7)
        .map((date) => '${date.day}/${date.month}')
        .toList();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(
        titles[value.toInt()],
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    var sortedDates = dailyTotals.keys.toList()..sort();
    var latestSevenDays = sortedDates.take(7).toList();

    return List.generate(latestSevenDays.length, (index) {
      var date = latestSevenDays[index];
      var mpesaValue = dailyTotals[date]?['MPESA'] ?? 0;
      var merchantValue = dailyTotals[date]?['Merchant'] ?? 0;
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: mpesaValue,
            color: widget.leftBarColor,
            width: width,
          ),
          BarChartRodData(
            toY: merchantValue,
            color: widget.rightBarColor,
            width: width,
          ),
        ],
      );
    });
  }

  BarTooltipItem? _getTooltipItem(BarChartGroupData group, int groupIndex,
      BarChartRodData rod, int rodIndex) {
    return BarTooltipItem(
      'KES ${rod.toY.toStringAsFixed(2)}',
      const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
