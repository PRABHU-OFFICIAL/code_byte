import 'package:flutter/material.dart';
import 'package:hackathon/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = CourseData.getData;

    return LayoutBuilder(
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
                                  Text(
                                    data[index]['title']!,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    data[index]['subtitle']!,
                                    style: const TextStyle(
                                        color: Colors.blue,
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
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data[index]['discountedPrice']!,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                        "Notice !",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25),
                                                      ),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text(
                                                            "Buying not supported yet",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          )
                                                        ],
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
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
                                            Icons.add_shopping_cart_rounded,
                                            color: Colors.red,
                                            size: 30),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })),
                ],
              )
            ],
          ),
        ));
      },
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
