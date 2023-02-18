import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Prabhu Prasad Penthoi"),
                accountEmail: Text("lituplayer@gmail.com"),
                currentAccountPicture: CircleAvatar(
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
        ],
      ),
    );
  }
}
