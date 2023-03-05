import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'authentication/welcome.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  loadScreen() async {
    setState(() {
      isLoaded = true;
    });
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      isLoaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoaded
          ? Container(
              color: Colors.white,
              child: Center(
                child: Lottie.asset("images/telegram.json"),
              ),
            )
          : FirebaseAuth.instance.currentUser == null
              ? const Welcome()
              : const HomeScreen(),
    );
  }
}
