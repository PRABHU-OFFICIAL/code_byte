import 'package:flutter/material.dart';
import 'course_page.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key, required this.map}) : super(key: key);

  final Map<String, String> map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(map['name']!),
      ),
    );
  }
}
