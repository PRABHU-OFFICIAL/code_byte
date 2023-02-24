import 'package:flutter/material.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  final interData = IntenrshipsData.getData;
  Icon customIcon = const Icon(Icons.search);
  bool isLoading = false;
  Widget customSearchBar = const Text(
    "Explore Internships",
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
                      title: TextField(
                        onChanged: (String s) {
                          setState(() {
                            if (s.isEmpty) {
                              // cData = tempData;
                              customIcon = const Icon(Icons.cancel);
                            } else {
                              customIcon = const Icon(Icons.search);
                              // cData = tempData
                              //     .where((element) => element["name"]!
                              //     .toLowerCase()
                              //     .contains(s.toLowerCase()))
                              //     .toList();
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'type in internships...',
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
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                  ),
                  itemCount: interData.length,
                  itemBuilder: (context, index) => Card(
                      elevation: 5,
                      child: Container(
                          height: 150,
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.laptop_chromebook,
                                            color: Colors.black),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["name"]!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.business,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["company"]!,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["duration"]!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.attach_money,
                                          color: Colors.green,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["stipend"]!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["location"]!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          color: Colors.purple,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          interData[index]["applyBy"]!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.bookmark_add,
                                      size: 30,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "View Details",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Apply Now"))
                                  ],
                                ),
                              ),
                            ],
                          )))),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class IntenrshipsData {
  static final getData = [
    {
      "name": "FullStack Development",
      "company": "Safe Invest",
      "duration": "6 months",
      "stipend": "Rs. 6K - 9K",
      "location": "Surat, India",
      "applyBy": "3 April 2023",
    },
    {
      "name": "Wordpress Developer",
      "company": "First Launch India Pvt. Ltd.",
      "duration": "6 months",
      "stipend": "Rs. 10K - 15K",
      "location": "Bangalore, India",
      "applyBy": "4 March 2023",
    },
    {
      "name": "FullStack Development",
      "company": "Safe Invest",
      "duration": "3 months",
      "stipend": "Rs. 5000",
      "location": "Remote",
      "applyBy": "30th June 2021",
    },
    {
      "name": "Graphic Designer",
      "company": "Secure Blink",
      "duration": "3 months",
      "stipend": "Rs. 8K - 10K",
      "location": "Noida, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Content Writer",
      "company": "Swadhrit",
      "duration": "3 months",
      "stipend": "Rs. 5K - 7K",
      "location": "Delhi, India",
      "applyBy": "1 April 2023",
    },
    {
      "name": "Operations Intern",
      "company": "Lokal",
      "duration": "6 months",
      "stipend": "Rs. 30K - 40K",
      "location": "Bangalore, India",
      "applyBy": "26 March 2023",
    },
    {
      "name": "FullStack Development",
      "company": "Safe Invest",
      "duration": "3 months",
      "stipend": "Rs. 5000",
      "location": "Remote",
      "applyBy": "30th June 2021",
    },
    {
      "name": "Founder's Office Intern",
      "company": "Depute",
      "duration": "2 months",
      "stipend": "Rs. 10K - 15K",
      "location": "Delhi, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Social Media Marketing Intern",
      "company": "Technivorous Technologies",
      "duration": "3 months",
      "stipend": "Rs. 8K - 10K",
      "location": "Guru Gram, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Front End Developer",
      "company": "Padhakku",
      "duration": "2 months",
      "stipend": "Rs. 8K - 10K",
      "location": "Delhi, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Business Development Intern",
      "company": "Orange Ant Media",
      "duration": "1 month",
      "stipend": "Rs. 6K - 8K",
      "location": "Mumbai , India",
      "applyBy": "Immediate",
    },
    {
      "name": "Human Resources (HR) Internship",
      "company": "Meru Accounting Pvt Ltd",
      "duration": "6 months",
      "stipend": "Rs. 5K - 6K",
      "location": "Ahmedabad, India",
      "applyBy": "Immediate",
    },
  ];
}
