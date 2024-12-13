import 'package:dash_merchant_new/Listtile/auth.dart';
import 'package:dash_merchant_new/responsiveui/Desktop/overview.dart';
import 'package:dash_merchant_new/responsiveui/Desktop/settings.dart';
import 'package:dash_merchant_new/responsiveui/Desktop/transactions.dart';
import 'package:dash_merchant_new/widgets/helpcenter/floatingchart.dart';
import 'package:dash_merchant_new/widgets/helpcenter/helpcenter.dart';
import 'package:dash_merchant_new/mamlakalogo/mamlakalogo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopHomePage extends StatefulWidget {
  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  // const DesktopHomePage({super.key});
  int _selectedindex = 0;

  List<Widget> _pages = [
    overviewdesktop(),
    transactionsdesktop(),
    helpcenter(),
    // settings(),
  ];

  // floatingchartfunction() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         TextEditingController controller = TextEditingController();
  //         return AlertDialog(
  //           content: Container(
  //             height: 400,
  //             width: 300,
  //             child: Column(
  //               children: [
  //                 Container(
  //                   child: Row(
  //                     children: [
  //                       Text("Chart"),
  //                       IconButton(onPressed: () {}, icon: Icon(Icons.forward))
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("cancel")),
  //             TextButton(
  //                 onPressed: () {
  //                   setState(() {});
                    
  //                 },
  //                 child: Text("save"))
  //           ],
  //           title: Text("Aleert dialog"),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Positioned(
        bottom: 200,
        right: 50,
        child: FloatingActionButton(
          highlightElevation: 50,
          autofocus: true,
          focusElevation: 5,
          hoverElevation: 50,
          backgroundColor: Colors.black,
          elevation: 6,
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return floatingchartfunction();
            // }));
          },
          child: Text(
            "Chart",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 275,
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                // Overlay(),
                mamlakalogo(),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 33,
                  ),
                  title: Text(
                    'Overview',
                    style: GoogleFonts.robotoCondensed(fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedindex = 0;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.analytics,
                    size: 33,
                  ),
                  title: Text(
                    'Transactions',
                    style: GoogleFonts.robotoCondensed(fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedindex = 1;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.help,
                    size: 33,
                  ),
                  title: Text(
                    'Help Center',
                    style: GoogleFonts.robotoCondensed(fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedindex = 2;
                    });
                  },
                ),
                const Divider(),
                // ListTile(
                //   leading: const Icon(
                //     Icons.settings,
                //     size: 33,
                //   ),
                //   title: Text(
                //     'Settings',
                //     style: GoogleFonts.robotoCondensed(fontSize: 20),
                //   ),
                //   onTap: () {
                //     setState(() {
                //       _selectedindex = 3;
                //     });
                //   },
                // ),
                // const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 33,
                  ),
                  title: Text('Log Out',
                      style: GoogleFonts.robotoCondensed(fontSize: 20)),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                    // setState(() {
                    //   _selectedindex = 4;
                    // });
                  },
                ),
                Spacer(),
                Container(
                  height: 45,
                  decoration: BoxDecoration(color: Colors.purple.shade600),
                  child: Center(
                    child: Image.asset(
                      "lib/mamlakalogo/Remove background project.png",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedindex],
          ),
        ],
      ),
    );
  }
}

class floatingactionbuton extends StatefulWidget {
  const floatingactionbuton({super.key});

  @override
  State<floatingactionbuton> createState() => _floatingactionbutonState();
}

class _floatingactionbutonState extends State<floatingactionbuton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.2))
      ]),
      width: 400,
      height: 600,
      child: Column(
        children: [Container(), Container()],
      ),
    ));
  }
}
