import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key, required this.map}) : super(key: key);
  final Map<String, String> map;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  bool isEnrolled = false;
  var btnText = "Enroll Now";

  @override
  initState() {
    super.initState();
    checkEnrollment();
  }

  checkEnrollment() {
    FirebaseFirestore.instance
        .collection("courses")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;

      if (data['isEnrolled'] == 'true') {
        setState(() {
          btnText = "Enrolled";
          isEnrolled = true;
        });
      } else {
        setState(() {
          btnText = "Enroll Now";
          isEnrolled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.map['name']!),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              elevation: 5,
              color: Colors.black,
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Image.network(
                  widget.map['image']!,
                  fit: BoxFit.cover,
                ),
                back: Image.network(
                  widget.map['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.map['name']!,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.map['desc']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.timer, color: Colors.blue),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.map['duration']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.money, color: Colors.green),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.map['price']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.map['discountPrice']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.map['rating']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "(${(widget.map['ratingCount']!)})",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (isEnrolled) {
                      setState(() {
                        isEnrolled = false;
                        btnText = "Enroll Now";
                        FirebaseFirestore.instance
                            .collection("courses")
                            .doc(FirebaseAuth.instance.currentUser?.uid
                                .toString())
                            .delete();
                      });
                    } else {
                      setState(() {
                        isEnrolled = true;
                        btnText = "Enrolled";
                        FirebaseFirestore.instance
                            .collection("courses")
                            .doc(FirebaseAuth.instance.currentUser?.uid
                                .toString())
                            .set({
                          "name": widget.map['name'],
                          "desc": widget.map['desc'],
                          "duration": widget.map['duration'],
                          "price": widget.map['price'],
                          "discountPrice": widget.map['discountPrice'],
                          "rating": widget.map['rating'],
                          "ratingCount": widget.map['ratingCount'],
                          "image": widget.map['image'],
                          "isEnrolled": "true",
                        });
                      });
                    }
                    // checkEnrollment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    btnText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ])),
    );
  }
}
