import 'package:CodeByte/scholarships_resource/scholarships.dart';
import 'package:flutter/material.dart';
import 'course_page_resources/course_page.dart';
import 'drawer_resources/my_drawer.dart';
import 'home_page_resources/home_page.dart';
import 'internships_resources/internships.dart';
import 'mentors_page_resources/mentors_page.dart';

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
      ),
    );
  }
}
