import 'package:crm_history/widgets/messagebox.dart';
import 'package:flutter/material.dart';
import 'package:crm_history/widgets/sidebar.dart';
import 'package:crm_history/widgets/top_navbar.dart';
import 'package:crm_history/Pages/history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRM History',
      theme: ThemeData(
          fontFamily: 'Roboto', scaffoldBackgroundColor: Colors.grey.shade400),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  String selectedPage = 'History';

  Widget getPage(String page) {
    switch (page) {
      case 'Dashboard':
        return const Center(child: Text("Dashboard Page"));
      case 'Customer':
        return const Center(child: Text("Customer Page"));
      case 'Mails':
        return const Center(child: Text("Mails Page"));
      case 'History':
        return const CRMHistoryPage();
      case 'Reports':
        return const Center(child: Text("Reports Page"));
      case 'Settings':
        return const Center(child: Text("Settings Page"));
      default:
        return const Center(child: Text("Page Not Found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Sidebar(
            selectedMenu: selectedPage,
            onMenuSelected: (menu) {
              setState(() {
                selectedPage = menu;
              });
            },
          ),

          // Right part navbar , list and messagebox.
          Expanded(
            child: Stack(
              children: [
                //navbar and list
                Column(
                  children: [
                    const TopNavbar(),
                    Expanded(child: getPage(selectedPage)),
                  ],
                ),

                //  Message box
                const Positioned(
                  bottom: 0,
                  right: 20,
                  child: MessageBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
