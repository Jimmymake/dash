import 'package:dash_merchant_new/widgets/transactionline_chart.dart';
import 'package:dash_merchant_new/widgets/payintransactions.dart';
import 'package:dash_merchant_new/widgets/totaltransactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  



class transactionsdesktop extends StatelessWidget {
  const transactionsdesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Container(
          height: 70,
          decoration: BoxDecoration(color: Colors.purple.shade600),
          child: Row(
            children: [
              Text(
                "Transactions",
                style: GoogleFonts.robotoCondensed(color: Colors.white,
                    fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
             const SizedBox(
                  width: 370,
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 45,
                        child: Icon(
                          Icons.person,color: Colors.white,
                          size: 35,
                        )),
                    title: Text("Jimmy Mayeku"),
                    subtitle: Text("mayekujimmy997@gmail.com"),
                  ),
                ),
              const SizedBox(
                width: 40,
              ),
         
            ],
          ),
        ),
        SizedBox(
          height: screenheight * 0.85,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [totalpayins(), totalwidthdrawal()],
                      ),
                    ),
                    SizedBox(width: screenwidth * 0.45, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Linechartgraph(),
                    ))
                  ],
                ),
              ),
              const Expanded(flex: 1, child: Payintransactions())
            ],
          ),
        )
      ]),
    );
  }
}
