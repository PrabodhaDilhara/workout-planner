import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_planner/pages/add_new_page.dart';
import 'package:workout_planner/pages/favorite_page.dart';
import 'package:workout_planner/pages/home_page.dart';
import 'package:workout_planner/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AddNewPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      title: "workOut Planner",
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
