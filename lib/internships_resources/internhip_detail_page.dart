import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InternshipDetailPage extends StatefulWidget {
  const InternshipDetailPage({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  State<InternshipDetailPage> createState() => _InternshipDetailPageState();
}

class _InternshipDetailPageState extends State<InternshipDetailPage> {
  bool isApplied = false;
  String btnName = 'Apply Now';

  @override
  initState() {
    super.initState();
    checkEnrollment();
  }

  checkEnrollment() {
    FirebaseFirestore.instance
        .collection("internships")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;

      if (data['isApplied'] == 'true') {
        setState(() {
          btnName = "Applied";
          isApplied = true;
        });
      } else {
        setState(() {
          btnName = "Apply Now";
          isApplied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.map['name']!,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const Text(
                                "About Internship",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.map['desc']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const Text(
                                "About Company",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.map['companyDesc']!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
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
                            widget.map['stipend']!,
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
                          const Icon(Icons.calendar_month,
                              color: Colors.yellow),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.map['applyBy']!,
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
                          const Icon(Icons.location_city, color: Colors.red),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.map['location']!,
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
                              isApplied
                                  ? setState(() {
                                      isApplied = false;
                                      btnName = 'Apply Now';
                                      FirebaseFirestore.instance
                                          .collection("internships")
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid
                                              .toString())
                                          .delete();
                                    })
                                  : setState(() {
                                      isApplied = true;
                                      btnName = "Applied";
                                      FirebaseFirestore.instance
                                          .collection("internships")
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid
                                              .toString())
                                          .set({
                                        "name": widget.map["name"]!,
                                        "company": widget.map["company"]!,
                                        "desc": widget.map["desc"]!,
                                        "companyDesc":
                                            widget.map["companyDesc"]!,
                                        "duration": widget.map["duration"]!,
                                        "stipend": widget.map["stipend"]!,
                                        "location": widget.map["location"]!,
                                        "applyBy": widget.map["applyBy"]!,
                                        "isApplied": isApplied.toString(),
                                      });
                                    });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                            child: Text(
                              btnName,
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
          ),
        );
      }),
    );
  }
}
