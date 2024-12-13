import 'package:dash_merchant_new/main.dart';
import 'package:dash_merchant_new/responsiveui/mobile/mobilehelpcenter.dart';
import 'package:dash_merchant_new/responsiveui/mobile/mobileoverview.dart';
import 'package:dash_merchant_new/responsiveui/mobile/mobiletransactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';


class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  Widget _selectedItem =  Mobileoverview();

  screenselector(item) {
    switch (item.route) {
      case Mobileoverview.routname:
        setState(() {
          _selectedItem = Mobileoverview();
        });
        break;
      // case Vendorsscreen.
 
      case Mobiletransactions.routname:
        setState(() {
          _selectedItem =  Mobiletransactions();
        });
        break;
             case Mobilehelpcenter.routname:
        setState(() {
          _selectedItem =  Mobilehelpcenter();
        });
        break;

  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminScaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow.shade900,
            title: const Text("Dashboard"),
          ),
          sideBar: SideBar(
            items: const [
              AdminMenuItem(
                  icon: Icons.dashboard,
                  route: Mobileoverview.routname,
                  title: "Transaction"),
              AdminMenuItem(
                  icon: CupertinoIcons.person_3,
                  route: Mobiletransactions.routname,
                  title: ""),
              AdminMenuItem(
                  icon: CupertinoIcons.money_dollar,
                  route: Mobilehelpcenter.routname,
                  title: "Withdrawl"),
            //  AdminMenuItem(
            //       icon: CupertinoIcons.money_dollar,
            //       route: Withdrawalscre.routname,
            //       title: "Withdrawl"
                  
                  
            //       ),
                  
        

            ],
            selectedRoute: "",
            onSelected: (item) {
              screenselector(item);
            },
            header: Container(
              height: 50,
              width: double.infinity,
              color: Colors.yellow.shade900,
              child: const Center(
                child: Text(
                  'Merchant Dashbaord',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            footer: Container(
              height: 50,
              width: double.infinity,
              color: Colors.yellow.shade900,
              child: const Center(
                child: Text(
                  'Coopyright@jimmymayeku',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: _selectedItem),
    );
  }
}
