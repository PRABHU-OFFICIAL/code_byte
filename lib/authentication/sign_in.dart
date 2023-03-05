import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home_screen.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  late String _emailController = "";
  late String _passwordController = "";

  final _formKey = GlobalKey<FormState>();
  bool validate() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Lottie.asset("images/login.json"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Log In",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    icon: Icon(Icons.email, color: Colors.pink),
                  ),
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    _emailController = value!;
                    if (value.isEmpty) {
                      return "Field can't be empty";
                    } else if (!value.contains("@")) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    icon: Icon(Icons.lock, color: Colors.lightGreen),
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    _passwordController = value!;
                    if (value.isEmpty) {
                      return "Field can't be empty";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    } else if (value.length > 15) {
                      return "Password must be at most 15 characters";
                    } else if (value.contains(" ")) {
                      return "Password must not contain spaces";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (validate()) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController,
                              password: _passwordController)
                          .then((value) =>
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen())))
                          .onError((error, stackTrace) => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Error"),
                                    content: Text(error.toString()),
                                  )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
