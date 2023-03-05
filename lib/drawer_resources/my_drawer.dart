import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/welcome.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String accountName = '';
  String accountEmail = '';
  loadFirebaseData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      accountName = data['username']!;
      accountEmail = data['email']!;
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
          const ListTile(
            leading: Icon(Icons.local_library_rounded),
            title: Text("My Courses"),
            iconColor: Colors.blue,
          ),
          const ListTile(
            leading: Icon(Icons.group),
            title: Text("Groups"),
            iconColor: Colors.green,
          ),
          ListTile(
            leading: const Icon(Icons.local_cafe_rounded),
            title: const Text("Channels"),
            iconColor: Colors.yellow.shade700,
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
