import 'package:dash_merchant_new/Listtile/auth.dart';
import 'package:dash_merchant_new/responsiveui/Desktop/mainscreen.dart';
import 'package:dash_merchant_new/responsiveui/Tablet/mainscreen.dart';
import 'package:dash_merchant_new/widgets/helpcenter/helpcenter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Dashboard',
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.purple.shade600),
        ),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home:
          // helpcenter(),
          const ResponsiveLayout(),
      // Login()
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 660) {
          return const MobileHomePage();
        } else if (constraints.maxWidth < 1100) {
          return const TabletHomepage();
        } else {
          return DesktopHomePage();
        }
      },
    );
  }
}

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Dashboard Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analytics'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Mobile Layout Content'),
      ),
    );
  }
}
