import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Linechartgraph extends StatefulWidget {
  const Linechartgraph({super.key});

  @override
  State<Linechartgraph> createState() => _LinechartgraphState();
}

class _LinechartgraphState extends State<Linechartgraph> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight *0.7,
      width: screenwidth*0.37,
      child: Expanded(
        child: Card(color: Colors.white70,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.grey.withOpacity(.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Transaction Graph",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Payins",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "Amount",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.2,
                        height: screenheight * 0.4,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: true),
                            titlesData: FlTitlesData(
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    // Round the value to the nearest integer
                                    return Text(
                                      value
                                          .toInt()
                                          .toString(), // Convert to int and then to string
                                      style: GoogleFonts.robotoCondensed(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    // You can customize bottom titles here if needed
                                    return Text(
                                      value
                                          .toInt()
                                          .toString(), // Convert to int and then to string
                                      style: GoogleFonts.robotoCondensed(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    );
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                                show: true,
                                border: Border(
                                    right: BorderSide.none,
                                    bottom: BorderSide(
                                      color: Colors.black,
                                    ),
                                    top: BorderSide.none,
                                    left: BorderSide())),
                            minX: 0,
                            maxX: 40,
                            minY: 0,
                            maxY: 150,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 20),
                                  FlSpot(5, 70),
                                  FlSpot(10, 60),
                                  FlSpot(15, 80),
                                  FlSpot(20, 90),
                                  FlSpot(25, 80),
                                  FlSpot(30, 130),
                                ],
                                isCurved: false,
                                dotData: FlDotData(show: true),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Payins",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
