import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/welcome.dart';
import '../course_page_resources/course_detail_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String accountName = '';
  String accountEmail = '';
  String course = "";
  Map<String, String> map = {};

  @override
  initState() {
    super.initState();
    loadFirebaseData();
    getFirestoreData();
    getCourseDetails();
  }

  loadFirebaseData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        accountName = data['username'].toString();
        accountEmail = data['email'].toString();
      });
    });
  }

  getFirestoreData() async {
    await FirebaseFirestore.instance
        .collection("courses")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        course = data['name'].toString();
      });
    });
  }

  getCourseDetails() {
    FirebaseFirestore.instance
        .collection("courses")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        course = data['name'].toString();
        map['image'] = data['image'].toString();
        map['name'] = data['name'].toString();
        map['desc'] = data['desc'].toString();
        map['duration'] = data['duration'].toString();
        map['price'] = data['price'].toString();
        map['rating'] = data['rating'].toString();
        map['discountPrice'] = data['discountPrice'].toString();
        map['ratingCount'] = data['ratingCount'].toString();
        map['isEnrolled'] = data['isEnrolled'].toString();
        print(map);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  accountName,
                  style: const TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  accountEmail,
                  style: const TextStyle(color: Colors.white),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              )),
          const ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text("Leaderboard"),
            iconColor: Colors.red,
          ),
          ExpansionTile(
            leading: const Icon(Icons.local_library_rounded),
            title: const Text("My Courses"),
            iconColor: Colors.blue,
            children: [
              course.isNotEmpty
                  ? ListTile(
                      leading: const Icon(Icons.local_library_rounded),
                      title: Text(course),
                      iconColor: Colors.blue,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CourseDetailPage(
                                  map: map,
                                )));
                      },
                    )
                  : const ListTile(),
            ],
          ),
          ExpansionTile(
            title: const Text('Applied Internships'),
            leading: const Icon(Icons.interests),
            iconColor: Colors.red,
            children: [
              ListTile(
                leading: const Icon(Icons.interests),
                title: Text(course),
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CourseDetailPage(
                            map: map,
                          )));
                },
              )
            ],
          ),
          ListTile(
            leading: const Icon(Icons.local_cafe_rounded),
            title: const Text("Channels"),
            iconColor: Colors.yellow.shade700,
          ),
          const ListTile(
            leading: Icon(Icons.lightbulb_rounded),
            title: Text("My Interests"),
            iconColor: Colors.purple,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Welcome()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Sign Out"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
