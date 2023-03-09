import 'package:CodeByte/internships_resources/internhip_detail_page.dart';
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
  String intern = '';
  Map<String, String> courseMap = {};
  Map<String, String> internMap = {};

  @override
  initState() {
    super.initState();
    loadFirebaseData();
    getFirestoreData();
    getCourseDetails();
    getInternDetails();
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
        courseMap['image'] = data['image'].toString();
        courseMap['name'] = data['name'].toString();
        courseMap['desc'] = data['desc'].toString();
        courseMap['duration'] = data['duration'].toString();
        courseMap['price'] = data['price'].toString();
        courseMap['rating'] = data['rating'].toString();
        courseMap['discountPrice'] = data['discountPrice'].toString();
        courseMap['ratingCount'] = data['ratingCount'].toString();
        courseMap['isEnrolled'] = data['isEnrolled'].toString();
      });
    });
  }

  getInternDetails() {
    FirebaseFirestore.instance
        .collection("internships")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        intern = data['name'].toString();
        internMap['applyBy'] = data['applyBy'].toString();
        internMap['company'] = data['company'].toString();
        internMap['companyDesc'] = data['companyDesc'].toString();
        internMap['desc'] = data['desc'].toString();
        internMap['duration'] = data['duration'].toString();
        internMap['location'] = data['location'].toString();
        internMap['name'] = data['name'].toString();
        internMap['stipend'] = data['stipend'].toString();
        internMap['isApplied'] = data['isApplied'].toString();
        print(internMap);
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
                                  map: courseMap,
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
              intern.isNotEmpty
                  ? ListTile(
                      leading: const Icon(Icons.interests),
                      title: Text(intern),
                      iconColor: Colors.blue,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InternshipDetailPage(
                                  map: internMap,
                                )));
                      },
                    )
                  : const ListTile(),
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
