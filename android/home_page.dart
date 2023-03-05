import 'package:CodeByte/home_page_resources/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  var data = CourseData.getData;
  var sData = ScholarshipData.getData;
  var mData = MentorData.getData;

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

    return !isLoading ? Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                Container(
                  width: double.maxFinite,
                  height: 25,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "New Updates !",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 20,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Get Your seats booked for the free master class",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Image.asset("images/masterclass.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Courses at their cheapest price !",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        "Get the courses just @499",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                        height: 245,
                        width: viewportConstraints.maxWidth,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      data[index]['image']!,
                                      height: 124,
                                      width: 220,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]['title']!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          Text(
                                            data[index]['subtitle']!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data[index]['price']!,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data[index]['discountedPrice']!,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  title:
                                                                      const Text(
                                                                    "Notice !",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            25),
                                                                  ),
                                                                  content:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      Text(
                                                                        "Buying not supported yet",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 20),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  actions: [
                                                                    OutlinedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text(
                                                                            "Close"))
                                                                  ],
                                                                ));
                                                  },
                                                  child: const Text("Buy Now")),
                                              const SizedBox(
                                                width: 80,
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons
                                                        .add_shopping_cart_rounded,
                                                    color: Colors.red,
                                                    size: 30),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Not getting Internships ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        "Try these skills...",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 155,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                child: Row(
                                  children: const [
                                    Text(
                                      "DSA",
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 20,
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("React.js"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Web Development"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Native Android"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Flutter"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Blockchain"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Computer Networking"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text("Operating Systems"),
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Looking for Scholarships ?",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Isn't good to check these...",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                    elevation: 5,
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemCount: sData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(sData[index]["icon"]!),
                            ),
                            title: Text(
                              sData[index]["title"]!,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              sData[index]["subtitle"]!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                          );
                        },
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Not sure about which course to take ?",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Why not ask our mentors...",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.yellow.shade700,
                          elevation: 5,
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 50,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          mData[index]["profile"]!),
                                      radius: 45,
                                    ),
                                  ),
                                ),
                                Text(
                                  mData[index]["name"]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  mData[index]["solved"]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  mData[index]["domain"]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ));
        },
      ),
    ) : const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class CourseData {
  static final getData = [
    {
      "image":
          "https://dimensionless.in/wp-content/uploads/2019/08/ai-courses.png",
      "title": "Data Science",
      "subtitle": "Data Science is not as concrete...",
      "price": "Rs 3,999",
      "discountedPrice": "Rs 499",
    },
    {
      "image":
          "https://www.digiwebart.com/wp-content/uploads/2020/12/Web-Development-Company-Jaipur-1024x576.jpg",
      "title": "Web Development",
      "subtitle": "It's not about building website...",
      "price": "Rs 2,999",
      "discountedPrice": "Rs 499",
    },
    {
      "image":
          "https://technocation.pk/wp-content/uploads/2022/10/python-banner-1536x864.jpg",
      "title": "Python Basics",
      "subtitle": "Python is one of the most power...",
      "price": "Rs 5,999",
      "discountedPrice": "Rs 499",
    },
    {
      "image":
          "https://quikieapps.com/wp-content/uploads/2022/04/Android-App-Development-2-1024x576-1-1.png",
      "title": "App Development",
      "subtitle": "Building Android apps are so ea...",
      "price": "Rs 10,999",
      "discountedPrice": "Rs 499",
    },
  ];
}

class ScholarshipData {
  static final getData = [
    {
      "title": "e-Kalyan Scholarship",
      "subtitle": "Govt of Jharkhand",
      "icon":
          "https://sg-res.9appsdownloading.com/sg/res/jpg/f5/85/70ab3c1ed0c6ea184c6814ed06d1-emz.jpg",
    },
    {
      "title": "Commonwealth Scholarship",
      "subtitle": "Online Scholarship",
      "icon":
          "https://st4.depositphotos.com/1842549/21440/i/450/depositphotos_214408834-stock-photo-online-diploma-icon.jpg",
    },
    {
      "title": "Samunnathi Scholarship",
      "subtitle": "Kerala State Welfare Corporation",
      "icon":
          "https://leverageedublog.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2019/12/23173652/NSF-Scholarship.png",
    },
  ];
}

class MentorData {
  static final getData = [
    {
      "profile":
          "https://www.thefamouspeople.com/profiles/thumbs/sundar-pichai-5.jpg",
      "name": "Sundar Pichai",
      "domain": "Google",
      "solved": "CEO"
    },
    {
      "profile":
          "https://www.thefamouspeople.com/profiles/thumbs/mark-zuckerberg-4.jpg",
      "name": "Mark Zuckerberg",
      "domain": "Facebook",
      "solved": "Co-Founder"
    },
    {
      "profile":
          "https://www.thefamouspeople.com/profiles/thumbs/jeff-bezos-2.jpg",
      "name": "Jeff Bezos",
      "domain": "Amazon",
      "solved": "Chairman"
    },
    {
      "profile":
          "https://www.thefamouspeople.com/profiles/thumbs/elon-musk-4.jpg",
      "name": "Elon Musk",
      "domain": "Tesla",
      "solved": "CEO"
    },
    {
      "profile":
          "https://www.thefamouspeople.com/profiles/thumbs/mukesh-ambani-7.jpg",
      "name": "Mukesh Ambani",
      "domain": "Reliance",
      "solved": "Founder"
    },
  ];
}
