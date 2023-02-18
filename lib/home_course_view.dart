import 'package:flutter/material.dart';

class CourseRecycler extends StatelessWidget {
  const CourseRecycler({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 245,
        width: 500,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
