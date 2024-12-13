import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Expanded(
      flex: 2,
      child: Container(
        height: screenheight * 0.9,
        width: screenwidth * 0.5,
        // color: Colors.green,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  Text("Need help?"),
                  TextButton(
                      onPressed: () {}, child: Text("Ask Mam-laka Assistant")),
                  const Icon(
                    Icons.message,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: screenwidth * 0.55,
                height: screenheight * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Mam-laka Assistant",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: screenwidth * 0.5,
                        height: screenheight * 0.76,
                        // color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.purple.shade600,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Hey'),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.white70,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            "Hello! How May I assist you?"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade500,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.black),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward)),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.attach_file),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
