import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScholarshipPage extends StatelessWidget {
  const ScholarshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    var scholarData = ScholarshipsData.getData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Explore Scholarships",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
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
                              children: const [
                                Text(
                                  "Scholarship Deadline",
                                  style: TextStyle(
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
                                Text(
                                  scholarData[index]["deadline"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
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
                              percent: 0.5,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text(scholarData[index]["applied"]!),
                              progressColor: Colors.green,
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
        ));
  }
}

class ScholarshipsData {
  static final getData = [
    {
      "name": "AP ePass",
      "scheme": "e-Pass Authentication",
      "eligibility": "Passed SSC exam",
      "deadline": "31st March",
      "link": "https://epass.apcfss.in/",
      "applied": "80%",
    },
    {
      "name": "e-grantz Kerala",
      "scheme": "e-grants Authentication",
      "eligibility": "Post Matric Students",
      "deadline": "28th June",
      "link": "https://epass.apcfss.in/",
      "applied": "70%",
    },
    {
      "name": "SJE Rajasthan",
      "scheme": "Social Justice",
      "eligibility": "Institute Level",
      "deadline": "12st March",
      "link": "https://epass.apcfss.in/",
      "applied": "60%",
    },
    {
      "name": "L&T Construction",
      "scheme": "Build India 2023",
      "eligibility": "Final Year Civil Engineering",
      "deadline": "19th April",
      "link": "https://epass.apcfss.in/",
      "applied": "80%",
    },
    {
      "name": "Nikon India",
      "scheme": "N S Program 2022-23",
      "eligibility": "having photography courses",
      "deadline": "16th March",
      "link": "https://epass.apcfss.in/",
      "applied": "30%",
    },
    {
      "name": "Kotak Education",
      "scheme": "Kotak Shiksha Nidhi",
      "eligibility": "Passed SSC exam",
      "deadline": "31st March",
      "link": "https://epass.apcfss.in/",
      "applied": "50%",
    },
    {
      "name": "DRDO",
      "scheme": "Girls scholarship - PG/UG",
      "eligibility": "Valid Gate/JEE",
      "deadline": "21st March",
      "link": "https://epass.apcfss.in/",
      "applied": "90%",
    },
  ];
}
