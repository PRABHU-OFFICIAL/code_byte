import 'package:flutter/material.dart';
import 'package:hackathon/course_page.dart';
import 'package:hackathon/home_page.dart';
import 'package:hackathon/internships.dart';
import 'package:hackathon/mentors_page.dart';
import 'package:hackathon/my_drawer.dart';
import 'package:hackathon/scholarships.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          "Skill-a-thon 1.0",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: value == 0
          ? const HomePage()
          : value == 1
              ? const CoursePage()
              : value == 2
                  ? const InternshipPage()
                  : value == 3
                      ? const MentorsPage()
                      : value == 4
                          ? const ScholarshipPage()
                          : Container(),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.countertops_outlined), label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.interests), label: "Internships"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: "Mentors"),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_sharp), label: "Scholarships"),
        ],
        currentIndex: value,
        onTap: (index) {
          setState(() {
            value = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        // selectedIconTheme: const IconThemeData(color: Colors.blue),
        // unselectedIconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
