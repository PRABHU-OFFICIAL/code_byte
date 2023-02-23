import 'package:flutter/material.dart';

import 'course_detail_page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  var cData = CoursesData.getData;
  var tempData = CoursesData.getData;
  bool isLoading = false;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    "Explore Courses",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  void initState() {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: customSearchBar,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = ListTile(
                      // leading: const Icon(
                      //   Icons.search,
                      //   color: Colors.black,
                      //   size: 25,
                      // ),
                      title: TextField(
                        onChanged: (String s) {
                          setState(() {
                            if (s.isEmpty) {
                              cData = tempData;
                              customIcon = const Icon(Icons.cancel);
                            } else {
                              customIcon = const Icon(Icons.search);
                              cData = tempData
                                  .where((element) => element["name"]!
                                      .toLowerCase()
                                      .contains(s.toLowerCase()))
                                  .toList();
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'type in course name...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text(
                      "Explore Courses",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                });
              },
              icon: customIcon)
        ],
      ),
      body: !isLoading
          ? Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                itemCount: cData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseDetailPage(
                                      map: {
                                        "name": cData[index]["name"]!,
                                        "desc": cData[index]["desc"]!,
                                        "image": cData[index]["image"]!,
                                        "price": cData[index]["price"]!,
                                        "discountPrice": cData[index]
                                            ["discountPrice"]!,
                                        "rating": cData[index]["rating"]!,
                                        "ratingCount": cData[index]
                                            ["ratingCount"]!,
                                        "duration": cData[index]["duration"]!,
                                      },
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(
                              cData[index]["image"]!,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  cData[index]["name"]!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      cData[index]["price"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      cData[index]["discountPrice"]!,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      cData[index]["rating"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "(${cData[index]["ratingCount"]!})",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      cData[index]["duration"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))
          : const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}

class CoursesData {
  static final getData = [
    {
      "name": "Learn Python: The Complete Python Programming Course",
      "desc" : "If you’re looking to learn Python for the very first time or need a quick brush-up, this is the course for you!, Python has rapidly become one of the most popular programming languages around the world. Compared to other languages such as Java or C++, Python consistently outranks and outperforms these languages in demand from businesses and job availability. The average Python developer makes over \$${100000} - this number is only going to grow in the coming years. The best part? Python is one of the easiest coding languages to learn right now. It doesn’t matter if you have no programming experience or are unfamiliar with the syntax of Python. By the time you finish this course, you'll be an absolute pro at programming!",
      "image": "https://i.udemycdn.com/course/480x270/394676_ce3d_3.jpg",
      "price": "₹ 1,499",
      "discountPrice": "₹ 1,199",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "10 hours",
    },
    {
      "name": "The Complete 2021 Flutter Development Bootcamp with Dart",
      "desc" : "Learn Flutter & Dart to build iOS & Android apps. Includes 2 apps, Firebase, Provider, REST API, Animations, Maps, & more!",
      "image":
          "https://1.bp.blogspot.com/-KsnDUjypvK4/XbwfXdYrSCI/AAAAAAAAAuU/12GW6U1x8i8l9t-QDhyplJeoV_N4lllCACLcBGAsYHQ/s1600/WDP41.jpg",
      "price": "₹ 1,399",
      "discountPrice": "₹ 1,099",
      "rating": "4.5",
      "ratingCount": "1,50,000",
      "duration": "15 hours",
    },
    {
      "name": "Learning Python for Data Analysis and Visualization Ver 1",
      "desc" : "Learn Python for Data Analysis and Visualization. Includes NumPy, Pandas, Matplotlib, Seaborn, Plotly, Cufflinks, and more!",
      "image": "https://i.ytimg.com/vi/GPVsHOlRBBI/maxresdefault.jpg",
      "price": "₹ 649",
      "discountPrice": "₹ 549",
      "rating": "4.7",
      "ratingCount": "1,10,000",
      "duration": "13 hours",
    },
    {
      "name": "The Complete 2021 Android Development Bootcamp",
      "desc" : "Learn Android App Development with Java and Android Studio. Includes Firebase, REST API, Maps, and more!",
      "image":
          "https://www.thesidepath.in/media/2021/04/20210402_163209_0000-1536x864.png",
      "price": "₹ 899",
      "discountPrice": "₹ 799",
      "rating": "4.8",
      "ratingCount": "5,00,000",
      "duration": "30 hours",
    },
    {
      "name": "Learn Python: Python for Beginners",
      "desc" : "Learn Python Programming from scratch and become a Python Developer in 2023 with this Python Course for Beginners.",
      "image": "https://i.ytimg.com/vi/ZWI-jrnbMhA/maxresdefault.jpg",
      "price": "₹ 2,499",
      "discountPrice": "₹ 1,999",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "11 hours",
    },
    {
      "name": "Javascript for Beginners to Advanced",
      "desc" : "Learn Javascript Programming from scratch and become a Javascript Developer in 2023 with this Javascript Course for Beginners.",
      "image":
          "https://blog.jetbrains.com/wp-content/uploads/2022/05/DSGN-13696_JetBrains_Academy_JS_for_Beginners_Blog_Social_share_image_1280x720-min-2.png",
      "price": "₹ 4,499",
      "discountPrice": "₹ 3,999",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "7 hours",
    },
  ];

  CoursesData(List<Map<String, String>> list);
}
