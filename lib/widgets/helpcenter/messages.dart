import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: screenheight * 0.9,
        width: screenwidth * 0.5,
        child: Container(
          // color: Colors.yellow.shade600,
          child: Column(
            children: [SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Messages",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 25, color: Colors.black),
                ),
              ),
              SizedBox(
                height: screenheight * 0.8,
                width: screenwidth * 0.5,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Scrollbar(
                          trackVisibility: true,
                          thumbVisibility: true,
                          thickness: 8,
                          radius: Radius.circular(10),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       // blurRadius: 10,
                                        //       spreadRadius: 2,
                                        //       // offset: Offset(2, 3),
                                        //       // color: Colors.black.withOpacity(0.25)
                                        //       )

                                        // ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.purple.shade600)),
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Custom support",
                                                style:
                                                    GoogleFonts.robotoCondensed(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  "Thank your \n for your understanding \n and patience"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            "Nov 07",
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
