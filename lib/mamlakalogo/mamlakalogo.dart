import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mamlakalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 70,
      decoration: BoxDecoration(color: Colors.purple.shade600),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            "lib/mamlakalogo/Remove background project.png",
            color: Colors.white70,
            width: 65,
            height: 65,
            fit: BoxFit.fill,
          ),SizedBox(width: 10,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "MAMLAKA HUB",
                  style: TextStyle(fontSize: 15, fontFamily: "Robotoslab",color: Colors.white70),
                ),
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 20,
                      decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.white70),color: Colors.white70),
                    ),
                    Text(
                      "SPOKE",
                      style: GoogleFonts.robotoSlab(fontSize: 15,color: Colors.white70),
                    ),
                    Container(
                      height: 2,
                      width: 20,
                      decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.white70),color: Colors.white70),
                    )
                  ],
                ),
                const Text(
                  "TRADE NETWORK",
                  style: TextStyle(
                    fontFamily: "Robotocondenced",color: Colors.white70,
                    letterSpacing: 2,
                    fontSize: 7,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
