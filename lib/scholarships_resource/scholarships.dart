import 'package:flutter/material.dart';
import 'package:hackathon/scholarships_resource/scholarship_details_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({super.key});

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  var scholarData = ScholarshipsData.getData;
  var tempData = ScholarshipsData.getData;
  Icon customIcon = const Icon(Icons.search);
  bool isLoading = false;
  Widget customSearchBar = const Text(
    "Explore Scholarships",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );

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

  getColor(double value) {
    if (value > 0.1 && value <= 0.3) {
      return Colors.green;
    } else if (value > 0.3 && value <= 0.7) {
      return Colors.orange;
    } else if (value > 0.7 && value <= 1) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: customSearchBar,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = ListTile(
                      title: TextField(
                        onChanged: (String s) {
                          setState(() {
                            if (s.isEmpty) {
                              scholarData = tempData;
                              customIcon = const Icon(Icons.cancel);
                            } else {
                              customIcon = const Icon(Icons.search);
                              scholarData = tempData
                                  .where((element) => element["name"]!
                                      .toLowerCase()
                                      .contains(s.toLowerCase()))
                                  .toList();
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'type in scholarships...',
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
                      "Explore Scholarships",
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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 225,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Organisation : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      scholarData[index]["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Scheme : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      scholarData[index]["scheme"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      scholarData[index]["eligibility"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Deadline : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      scholarData[index]["deadline"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ScholarshipDetailsPage(
                                            map: {
                                              "name": scholarData[index]
                                                  ["name"]!,
                                              "scheme": scholarData[index]
                                                  ["scheme"]!,
                                              "eligibility": scholarData[index]
                                                  ["eligibility"]!,
                                              "deadline": scholarData[index]
                                                  ["deadline"]!,
                                              "image": scholarData[index]
                                                  ["image"]!,
                                              "link": scholarData[index]
                                                  ["link"]!,
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("View Details")),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.1,
                              width: 80,
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(begin: 0.0, end: 1),
                                duration: const Duration(milliseconds: 3500),
                                builder: (context, value, _) =>
                                    CircularPercentIndicator(
                                  radius: 35.0,
                                  lineWidth: 7.0,
                                  percent: double.parse(
                                          scholarData[index]["applied"]!) /
                                      100,
                                  animation: true,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                      "${scholarData[index]["applied"]!}%"),
                                  progressColor: getColor(double.parse(
                                          scholarData[index]["applied"]!) /
                                      100),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: scholarData.length,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ScholarshipsData {
  static final getData = [
    {
      "name": "AP ePass",
      "scheme": "e-Pass Authentication",
      "eligibility": "Passed SSC exam",
      "deadline": "31st March",
      "applied": "80",
      "image":
          "https://www.freshersnow.com/wp-content/uploads/2019/12/AP-Epass.png",
      "link": "https://www.epassap.in/"
    },
    {
      "name": "e-grantz Kerala",
      "scheme": "e-grants Authentication",
      "eligibility": "Post Matric Students",
      "deadline": "28th June",
      "applied": "70",
      "image":
          "https://pmmodiyojanaye.in/wp-content/uploads/2021/03/egrantz-3.0-kerala.jpg",
      "link": "https://www.egrantz.kerala.gov.in/"
    },
    {
      "name": "SJE Rajasthan",
      "scheme": "Social Justice",
      "eligibility": "Institute Level",
      "deadline": "12st March",
      "applied": "60",
      "image":
          "https://i0.wp.com/nbsslup.in/wp-content/uploads/2022/10/BGMI94.webp",
      "link": "https://sje.rajasthan.gov.in/"
    },
    {
      "name": "L&T Construction",
      "scheme": "Build India 2023",
      "eligibility": "Final Year Civil Engineering",
      "deadline": "19th April",
      "applied": "80",
      "image":
          "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202203/lt-sixteen_nine.jpeg",
      "link": "https://www.lntecc.com/build-india-scholarship/"
    },
    {
      "name": "Nikon India",
      "scheme": "N S Program 2022-23",
      "eligibility": "Having photography courses",
      "deadline": "16th March",
      "applied": "30",
      "image":
          "https://www.nikonschool.in/images/layalty-program-banner_new.jpg",
      "link": "https://www.buddy4study.com/page/nikon-scholarship-program"
    },
    {
      "name": "Kotak Education",
      "scheme": "Kotak Shiksha Nidhi",
      "eligibility": "Passed SSC exam",
      "deadline": "31st March",
      "applied": "50",
      "image":
          "https://buddy4study.s3.ap-southeast-1.amazonaws.com/article/wp-content/uploads/2021/09/28110828/Kotak-Shiksha-Nidhi.jpg",
      'link"': "https://www.buddy4study.com/scholarships"
    },
    {
      "name": "DRDO",
      "scheme": "Girls scholarship - PG/UG",
      "eligibility": "Valid Gate/JEE",
      "deadline": "21st March",
      "applied": "90",
      "image":
          "https://leverageedublog.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2020/11/24012813/drdo-scholarship-scaled.jpg",
      "link": "https://rac.gov.in/index.php?lang=en&id=0"
    },
  ];
}
