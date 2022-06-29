import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User? user = FirebaseAuth.instance.currentUser;
  int index = 0;
  bool loading = false;
  final screens = [
    Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: const Center(child: Text("Home", style: TextStyle(fontSize: 35))),
    ),
    Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: const Center(child: Text("History", style: TextStyle(fontSize: 35))),
    ),Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: const Center(child: Text("Profile", style: TextStyle(fontSize: 35))),
    )
  ];
  

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : Scaffold(
            body: screens[index],
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Colors.transparent,
                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              child: NavigationBar(
                height: 60,
                backgroundColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Icons.home_rounded, color: Colors.blueGrey),
                    selectedIcon:
                        Icon(Icons.home_rounded, size: 30),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.file_copy_rounded, color: Colors.blueGrey),
                    selectedIcon: Icon(Icons.file_copy_rounded, size: 30),
                    label: 'History',
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.pin_drop_rounded, color: Colors.blueGrey),
                    selectedIcon: Icon(Icons.pin_drop_rounded, size: 30),
                    label: 'Profile',
                  )
                ],
              ),
            ),
          );
  }
}
