import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/trips_page.dart';

const Color appPurple = Colors.purple; // Define the purple color here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default to Home Page

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    TripsPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.two_wheeler), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_motorsports), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: appPurple, // Match the selected item color to appPurple
        unselectedItemColor: Colors.grey, // Optional: Set unselected item color
        onTap: onItemTapped,
      ),
    );
  }
}
