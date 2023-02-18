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
            leading: Icon(Icons.book),
            title: Text("Courses"),
            iconColor: Colors.red,
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            iconColor: Colors.blue,
          ),
          const ListTile(
            leading: Icon(Icons.subscriptions),
            title: Text("Sponsers"),
            iconColor: Colors.green,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            iconColor: Colors.yellow.shade700,
          ),
        ],
      ),
    );
  }
}
