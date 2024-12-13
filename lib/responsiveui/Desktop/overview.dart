import 'package:dash_merchant_new/widgets/transactionsbar_graph.dart';
import 'package:dash_merchant_new/widgets/recenttransactions.dart';
import 'package:dash_merchant_new/widgets/totaltransactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class overviewdesktop extends StatefulWidget {
  const overviewdesktop({super.key});

  @override
  State<overviewdesktop> createState() => _overviewdesktopState();
}

class _overviewdesktopState extends State<overviewdesktop> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(color: Colors.purple.shade600),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Bussness Overview",
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  const SizedBox(
                    width: 370,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 45,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 35,
                          )),
                      title: Text("Jimmy Mayeku"),
                      subtitle: Text("mayekujimmy997@gmail.com"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tototalincome_transactions(),
                totalpayins(),
                totalpayouts(),
                totalbalance(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenheight * 0.9,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StatsBarChart(),
                        )),
                    const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Recenttransactions(),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
