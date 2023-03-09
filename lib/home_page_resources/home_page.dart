import 'dart:io';

import 'package:flutter/material.dart';
import '../drawer_resources/my_drawer.dart';
import 'carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    loadWidgets();
  }

  void loadWidgets() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Home Page",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: !isLoading
            ? Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                        child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: double.maxFinite,
                              height: 200,
                              child: ItemSlider(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 370,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SizedBox(
                                              height: 150,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 100,
                                                  child: Image.network(
                                                      "https://cdn-icons-png.flaticon.com/512/5526/5526196.png"),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "Design Thinking",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ])),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: SizedBox(
                                              height: 150,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 100,
                                                  child: Image.network(
                                                      "https://cdn-icons-png.flaticon.com/128/1197/1197409.png"),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "Coding",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ]),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SizedBox(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Column(children: [
                                              SizedBox(
                                                height: 100,
                                                child: Image.network(
                                                    "https://cdn-icons-png.flaticon.com/512/508/508250.png"),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Security Expert",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            ]),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SizedBox(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Column(children: [
                                              SizedBox(
                                                height: 100,
                                                child: Image.network(
                                                    "https://cdn-icons-png.flaticon.com/512/1998/1998087.png"),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Marketing",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Techniques to adapt",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                )),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(children: [
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Identify the technology',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Choose a technology that you want to study. It could be a specific product, a type of technology, or an industry.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Understand the purpose',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Determine the intended purpose of the technology. What problems does it solve? ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Analyze the design',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Analyze the design of the technology. This could include the materials used, the form factor, and the user interface.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Research the history',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Study the history of the technology. This could include the development process, the key players involved, and any significant events or milestones in its development.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Evaluate the impact',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Evaluate the impact of the technology on society, the environment, and the economy. Consider its benefits and drawbacks',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      leading: Icon(Icons.play_circle_sharp,
                                          color: Colors.green, size: 40),
                                      title: Text(
                                        'Study the components',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Break down the technology into its individual components. This could include hardware components, software, firmware, and other elements.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ])),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 300,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        "https://img.freepik.com/free-vector/pink-isometric-innovation-concept_23-2149163572.jpg"),
                                  ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    "Innovation is the process of creating or improving something new or better, whether it be a product, service, process, or system. An innovation concept is a new idea or approach that has the potential to transform an industry, solve a problem, or create new opportunities.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 300,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        "https://img.freepik.com/free-vector/global-education-student-exchange-isometric-composition-with-editable-text-read-more-button-human-characters-diploma-vector-illustration_1284-76506.jpg"),
                                  ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    "The National Society of Black Engineers (NOBE) offers a variety of scholarships for Black students pursuing degrees in engineering, including computer engineering and computer science.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 300,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network("https://img.freepik.com/free-vector/isometric-business-coaching-colorful-template-with-businessman-speaking-podium-staff-online-training-personnel-take-part-conference_1284-35214.jpg")
                                  ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                     "When reaching out to potential mentors, be clear about what you're looking for and why you think they would be a good fit. It's important to establish expectations and communication preferences from the outset to ensure a successful mentor-mentee relationship.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ));
                  },
                ),
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
