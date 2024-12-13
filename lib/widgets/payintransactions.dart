import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaction {
  final int? id;
  final String? impalaMerchantId;
  final String? transactionStatus;
  final String? transactionReport;
  final String? currency;
  final double? amount;
  final double? netAmount;
  final String? secureId;
  final String? sourceOfFunds;
  final String? externalId;
  final String? callbackUrl;
  final String? redirectUrl;
  final int? dateAdded;
  final String? merchantRequestID;
  final String? checkoutRequestID;
  final String? responseCode;
  final String? responseDescription;

  Transaction({
    this.id,
    this.impalaMerchantId,
    this.transactionStatus,
    this.transactionReport,
    this.currency,
    this.amount,
    this.netAmount,
    this.secureId,
    this.sourceOfFunds,
    this.externalId,
    this.callbackUrl,
    this.redirectUrl,
    this.dateAdded,
    this.merchantRequestID,
    this.checkoutRequestID,
    this.responseCode,
    this.responseDescription,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      impalaMerchantId: json['impalaMerchantId'],
      transactionStatus: json['transactionStatus'],
      transactionReport: json['transactionReport'],
      currency: json['currency'],
      amount: json['amount']?.toDouble(),
      netAmount: json['netAmount']?.toDouble(),
      secureId: json['secureId'],
      sourceOfFunds: json['sourceOfFunds'],
      externalId: json['externalId'],
      callbackUrl: json['callbackUrl'],
      redirectUrl: json['redirectUrl'],
      dateAdded: json['dateAdded'],
      merchantRequestID: json['merchantRequestID'],
      checkoutRequestID: json['checkoutRequestID'],
      responseCode: json['responseCode'],
      responseDescription: json['responseDescription'],
    );
  }
}



class Payintransactions extends StatefulWidget {
  const Payintransactions({super.key});

  @override
  State<Payintransactions> createState() => _PayintransactionsState();
}

class _PayintransactionsState extends State<Payintransactions> {

  List<Transaction> transactions = [];
  List<Transaction> filteredTransactions = [];
  bool isLoading = false;
  String errorMessage = '';

  String? selectedStatus;
  String? selectedCurrency;
  String? selectedSource;

  @override
  void initState() {
    super.initState();
   // fetchData();
  }

  Future<void> fetchData() async {
     var box = Hive.box("myBox");
      var username = box.get("merchantAccess");
  
    print(username);
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      final url = Uri.parse(
          'https://mam-laka-gateway-api.mam-laka.com/api/merchant-transactions/filter?impalaMerchantId=chezaV9y6J5fkv8gUaFBTMEmGxCscore');
      print("Sending request to: $url");
      final response = await http.get(url);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List data = jsonData;

        setState(() {
          transactions = data
              .map((json) => Transaction.fromJson(json))
              .toList()
              .reversed
              .toList();
          filteredTransactions =
              transactions; // Initialize with all transactions
        });
        print("Parsed ${transactions.length} transactions");
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      print('Error fetching transactions: $e');
      setState(() {
        errorMessage = 'Failed to load transactions: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

//filters
  void applyFilters() {
    setState(() {
      filteredTransactions = transactions.where((transaction) {
        final matchesStatus = selectedStatus == null ||
            transaction.transactionStatus == selectedStatus;
        final matchesCurrency = selectedCurrency == null ||
            transaction.currency == selectedCurrency;
        final matchesSource = selectedSource == null ||
            transaction.sourceOfFunds == selectedSource;
        return matchesStatus && matchesCurrency && matchesSource;
      }).toList();
    });
  }
//sttaus colors
  Color getStatusColor(String? status) {
    if (status == null) return Colors.grey;
    switch (status.toLowerCase()) {
      case 'successful':
        return Colors.green;
      case 'success':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String formatDate(int? timestamp) {
    if (timestamp == null) return 'N/A';
    try {
      final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return DateFormat('yyyy-MM-dd HH:mm').format(date);
    } catch (e) {
      print('Error formatting date: $e');
      return 'Invalid Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payin Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Select Status'),
                              value: selectedStatus,
                              items: ['PENDING', 'SUCCESS', 'FAILED']
                                  .map((status) => DropdownMenuItem(
                                        value: status,
                                        child: Text(status.capitalize()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //////////////////////////////////////////////////////
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Select Currency'),
                              value: selectedCurrency,
                              items: ['USD', 'KES']
                                  .map((currency) => DropdownMenuItem(
                                        value: currency,
                                        child: Text(currency.toUpperCase()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCurrency = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Select Source'),
                              value: selectedSource,
                              items: ['CARD', 'MPESA']
                                  .map((source) => DropdownMenuItem(
                                        value: source,
                                        child: Text(source.capitalize()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSource = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: applyFilters,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          'Apply Filters',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (errorMessage.isNotEmpty)
            Center(
                child: Text(errorMessage,
                    style: const TextStyle(color: Colors.red)))
          else if (filteredTransactions.isEmpty)
            const Center(child: Text("No transactions found"))
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 400),
                child: DataTable(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  columns: const [
                    DataColumn(
                        label: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    )),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(
                        label: Text('Amount',
                            style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(
                        label: Text('Currency',
                            style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(
                        label: Text('Source',
                            style: TextStyle(fontWeight: FontWeight.w900))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.w900))),
                  ],
                  rows: filteredTransactions
                      .map((transaction) => DataRow(
                            cells: [
                              DataCell(
                                  Text(transaction.id?.toString() ?? 'N/A')),
                              DataCell(
                                Text(
                                  transaction.transactionStatus ?? 'N/A',
                                  style: TextStyle(
                                    color: getStatusColor(
                                        transaction.transactionStatus),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataCell(Text(
                                  transaction.amount?.toString() ?? 'N/A')),
                              DataCell(Text(transaction.currency ?? 'N/A')),
                              DataCell(
                                  Text(transaction.sourceOfFunds ?? 'N/A')),
                              DataCell(Text(formatDate(transaction.dateAdded))),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
