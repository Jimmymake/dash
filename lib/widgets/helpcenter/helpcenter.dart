import 'package:dash_merchant_new/widgets/helpcenter/chart.dart';
import 'package:dash_merchant_new/widgets/helpcenter/messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class helpcenter extends StatefulWidget {
  const helpcenter({super.key});

  @override
  State<helpcenter> createState() => _helpcenterState();
}

class _helpcenterState extends State<helpcenter> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(color: Colors.purple.shade600),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Help Center",
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Badge(
                    label: Text("5"),
                    child: IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ))),
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
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Row(
            children: [messages(), Charts()],
          ),
        ],
      ),
    );
  }
}
