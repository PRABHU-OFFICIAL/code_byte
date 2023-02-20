import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  var cData = CoursesData.getData;
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
                    customSearchBar = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: 'type in course name...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
      "image": "https://i.udemycdn.com/course/480x270/394676_ce3d_3.jpg",
      "price": "₹ 1,499",
      "discountPrice": "₹ 1,199",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "10 hours",
    },
    {
      "name": "The Complete 2021 Flutter Development Bootcamp with Dart",
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
      "image": "https://i.ytimg.com/vi/GPVsHOlRBBI/maxresdefault.jpg",
      "price": "₹ 649",
      "discountPrice": "₹ 549",
      "rating": "4.7",
      "ratingCount": "1,10,000",
      "duration": "13 hours",
    },
    {
      "name": "The Complete 2021 Android Development Bootcamp",
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
      "image": "https://i.ytimg.com/vi/ZWI-jrnbMhA/maxresdefault.jpg",
      "price": "₹ 2,499",
      "discountPrice": "₹ 1,999",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "11 hours",
    },
    {
      "name": "Javascript for Beginners to Advanced",
      "image":
          "https://blog.jetbrains.com/wp-content/uploads/2022/05/DSGN-13696_JetBrains_Academy_JS_for_Beginners_Blog_Social_share_image_1280x720-min-2.png",
      "price": "₹ 4,499",
      "discountPrice": "₹ 3,999",
      "rating": "4.6",
      "ratingCount": "1,00,000",
      "duration": "7 hours",
    },
  ];
}
