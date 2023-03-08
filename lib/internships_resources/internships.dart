import 'package:flutter/material.dart';

import 'internhip_detail_page.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  var interData = InternshipsData.getData;
  var tempData = InternshipsData.getData;
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
                              interData = tempData;
                              customIcon = const Icon(Icons.cancel);
                            } else {
                              customIcon = const Icon(Icons.search);
                              interData = tempData
                                  .where((element) => element["name"]!
                                      .toLowerCase()
                                      .contains(s.toLowerCase()))
                                  .toList();
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
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        InternshipDetailPage(
                                                          map: {
                                                            "name": interData[index]
                                                                ["name"]!,
                                                            "company":
                                                                interData[index]
                                                                    ["company"]!,
                                                            "desc": interData[index]
                                                                ["desc"]!,
                                                              "companyDesc": interData[index]
                                                                ["companyDesc"]!,
                                                            "duration":
                                                                interData[index]
                                                                    ["duration"]!,
                                                            "stipend":
                                                                interData[index]
                                                                    ["stipend"]!,
                                                            "location":
                                                                interData[index]
                                                                    ["location"]!,
                                                            "applyBy":
                                                                interData[index]
                                                                    ["applyBy"]!,
                                                            // "description": interData[index]["description"]!,
                                                          },
                                                        )),
                                              );
                                            },
                                            child: const Text(
                                              "View Details",
                                              style: TextStyle(color: Colors.red),
                                            )),
                                      ),
                                    ),
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

class InternshipsData {
  static final getData = [
    {
      "name": "FullStack Development",
      "company": "Safe Invest",
      "duration": "6 months",
      "desc":
          "1. Responsible for maintenance and improvement of applications with focus on building and testing Java Applications. \n2. Gathering of functional requirements, developing technical specifications, and project & test planning. \n3. Hands-on Coding. \nResolve defects/bugs during QA testing, pre-production, production and post-release patches.\n 4. Work cross-functionally with various other teams",
      "companyDesc":
          "Safe Invest is a leading Mutual Funds & other Financial Products Distributor in India since 2003. We have over two decades of rich experience in Financial Services.\nThe management at SAFEinvest brings together a team of professionals with wide experience and knowledge in Financial Services. The management has a strong vision for SAFEinvest as a globally respected company providing comprehensive services in the financial sector.\nThe “Customer First” philosophy is deeply ingrained in the management & employees at SAFEinvest. The management aims to bring the best to the customers in terms of…nRange of products and services offered.\nQuality customer service.",
      "stipend": "Rs. 6K - 9K",
      "location": "Surat, India",
      "applyBy": "3 April 2023",
    },
    {
      "name": "Wordpress Developer",
      "company": "First Launch India Pvt. Ltd.",
      "duration": "6 months",
      "desc":
          "The selected developer’s/intern’s day-to-day responsibilities will  include:\n1. Designing and developing responsive WordPress website and landing pages that are SEO-friendly\n2. Working with the digital marketing team to improve website performance and SEO\n3. Ensuring websites are optimized across various devices\n4. Optimizing web pages for maximum speed and scalability\n5. Maintaining brand consistency throughout the design\n6. Creating HTML email templates that are fully responsive\n7. Updating the website with the latest content, images and information",
      "companyDesc":
          "First Launch is a full service Digital Marketing Agency from Bangalore, India, helping startups validate the market and businesses thrive on the digital front through the harmony of digital marketing, technology and design.\nStudy, Strategize, Execute, Analyse and Optimize is the five-step approach that we follow to render our digital marketing services.\nWe at First Launch understand tech, embrace it with design and let the world know with our digital marketing acumen. Our digital marketing acumen, understanding of tech and design, our strategic approach and our unabated attitude is what differentiates us from all the other digital marketing agencies.\nWe consistently strive to provide value to the businesses we work with and we believe that if we’re not working to be the best at what we do, it is not worth doing. ",
      "stipend": "Rs. 10K - 15K",
      "location": "Bangalore, India",
      "applyBy": "4 March 2023",
    },
    {
      "name": "Backend Developer Intern",
      "company": "Sypto Labs",
      "duration": "3-6 Months",
      "desc":
          "Precision in your code\n1. The foresight of what you build\n2. The numbers game should be strong\n3. Some base interest in trading/futures/options/crypto/stocks is a must",
      "companyDesc":
          "Managed crypto portfolios. Fully automated, algorithmic trading and investing experience. \nSypto Labs is a technology company that provides a fully automated, algorithmic trading and investing experience. We are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. \nWe are a team of engineers, traders, and investors who are passionate about building the future of finance. We are building a platform that will allow anyone to invest in the financial markets with ease and confidence. ",
      "stipend": "Rs. 15K - 25K",
      "location": "Pune, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Graphic Designer",
      "company": "Secure Blink",
      "duration": "3 months",
      "desc":
          "1. Assist the team in thoroughly developing tailored graphical content for various sections of the resource library\n2. Maintain overall brand voice & consistency and multichannel visibility across the web through intuitive design materials\n3. Adapt in leveraging tools like an illustrator for producing high-quality infographics, report layouts, and design materials for different social media posts in collaboration with an in-house team of marketers & developers that should remain highly engaging in brand attributes",
      "companyDesc":
          "Secure Blink is the leading provider of application security from code to cloud. We adopt a heuristic approach to defend & minimise the application vulnerabilities, both known & unknown. We secure all your critical business applications from the inside.",
      "stipend": "Rs. 8K - 10K",
      "location": "Noida, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Content Writer",
      "company": "Swadhrit",
      "duration": "3 months",
      "desc":
          "Writing engaging posts for various social networks, including, Instagram and LinkedIn based on the target audience's behaviors\n1. Researching and monitoring the activity of social media platforms\n2. Selecting appealing images and videos to complement the text\n3. Strategizing social media campaigns and brainstorming on campaign strategies",
      "companyDesc":
          "We are online Indian lifestyle brand that's redefining fashion with its range of high quality and innovative range of products for women, men, and children. Our product line includes women's belts, belly scarves, caps for men and kids, hip hop caps, kids' costumes, backpacks, and winter slippers. Our mission is to provide our customers with high-quality products that meet their needs and enhance their daily life.",
      "stipend": "Rs. 5K - 7K",
      "location": "Delhi, India",
      "applyBy": "1 April 2023",
    },
    {
      "name": "Operations Intern",
      "company": "Lokal",
      "duration": "6 months",
      "desc":
          "Assist team members with the performance of their operations duties. Also partnering cross-functionally to achieve goals\n1. Assist with the development and management of ongoing and upcoming Operational projects for the department\n2. Working in our Workforce planning and reporting team, analyzing data, producing reporting and looking at efficiency across the department\n3. Expand understanding of data extrapolation and use of that data to impart results. Conduct user research and feedback analytics.\n4. Assist in the creation of materials for management review meetings and executive presentations. Attend regular meetings and scrums and broadcast MoMs.\n5. Complete miscellaneous, ad-hoc projects for the Operations, as needed.\n6. Monitor Quality Control/Audit and Conduct Guidelines.",
      "companyDesc":
          "Lokal - India's largest hyperlocal platform in Indian languages is focussed on building a world-class product for non-english speakers in India by providing them local information, classifieds and evolving with more meaningful use cases every day. We are operational in Andhra Pradesh, Telangana, Tamil Nadu, Karnataka with 10M+ downloads as on today.\nOne platform for all of regional India’s needs.\nLokal(Behtar Technology Private Limited), headquartered in Bengaluru was founded by IIT Alumni, Jani Pasha and Vipul Chaudhary in the year 2018 to build Web 2.0 for tier 2 & tier 3 cities in India. We recently raised our Series A from a global Marquee VC. Lokal also has YCombinator, 3one4 capital, India Quotient, RB Investment as investors",
      "stipend": "Rs. 30K - 40K",
      "location": "Bangalore, India",
      "applyBy": "26 March 2023",
    },
    {
      "name": "Marketing/Sales Intern",
      "company": "Agriown Farmtech Pvt. Ltd",
      "duration": "3 months",
      "desc":
          "1. Seed Treatment products demonstration/trails in lab and on field.\n2. Customer/client meeting on seed treatment product requirement.\n3. Follow-up with Seed companies / customer / farmer for the product feedback.\n4. Prepare follow-up and target customer list and achieve the business numbers.\n5. Very good data analysis and communication skill\nGo-getter and ready to travel across Gujarat and other cities.",
      "companyDesc":
          "AgriOwn is working towards the mission of improving Indian farmers package of practices with the new edge technologies like Agriculture Drone sprays, Seed Enhancement Technology, Soil Testing On Farm, Weather Station, Hybrid Seeds & Agri Inputs And we are getting overwhelmed response from the Farmers and providing best services to the Farmer through AgriOwn’s FTC Centers and skilled support & ground team. We are also trying to encourage agri micro entrepreneurs to associate with AgriOwn services business and creating a very good opportunity in rural employment.",
      "stipend": "Rs. 5K - 6K",
      "location": "Ahmedabad, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Founder's Office Intern",
      "company": "Depute",
      "duration": "2 months",
      "desc":
          "1. Verify the data given of the prospect\n2. Educate prospects about the company's product",
      "companyDesc":
          "Amid 10 min grocery delivery hype, have you ever thought of hiring in 10 minutes?  Suppose we give you the system where you can hire in 10 minutes. Will fast hiring solve all of your concerns?  Concerns like Fill Rate, Underskilled/Unproductive Hire, Absentism & Retention Problem, High Hiring, Operational & Associated Cost (IT assets, Insurance and Retirals etc.) and above all Scalability are unsolvable from the speedy hiring.  We introduce Depute to solve not only above concerns but many others as well. We take headache of hiring, training & operations from you, so you can focus on core of your business.  We differ ourselves from both traditional staffing & Gig Economy firms.  Traditional Staffing: It allow you to hire smoothly but other concerns still persist. GIG Economy: It solves majority of your concerns but reduce the quality of work delivered. Mostly suitable for Blue Collar works.  Depute: Solve all of your concerns including quality coz we work with in-house team to over-deliver.",
      "stipend": "Rs. 10K - 15K",
      "location": "Delhi, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Social Media Marketing Intern",
      "company": "Technivorous Technologies",
      "duration": "3 months",
      "desc":
          "1. Create Social Media Calender\n2. Create Social Media Posts with graphics and captions\n3. Generate creative ideas for posting\n4. Post from Founder's linkedin and other channels\n5. Create Blog posts and content for posting",
      "companyDesc":
          "Technivorus Technology LLC is a US based firm with operations in India & UK, catering to global clientele. We are a team of experienced IT professionals and subject matter experts with combined experience of 100+ years. We leverage our expertise to become an extension of our clients, achieving synergy and confluence while ensuring success! At Technivorus, we strive to improve everyday to become a global leader in deep-tech IT and Professional services to deliver true value to our clients.",
      "stipend": "Rs. 8K - 10K",
      "location": "Guru Gram, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Front End Developer",
      "company": "Padhakku",
      "duration": "2 months",
      "desc":
          "1. Developing front end website architecture and backend integration\n2. Designing user interactions on web pages\n3. Ensuring cross-platform optimization for mobile phones and ensuring responsiveness of applications\n4. Staying abreast of developments in web applications and programming languages",
      "companyDesc":
          "Padhakku is an Ed-tech startup working with a vision to create a one stop solution for students pursuing higher education. We connect with higher education students by providing them with a sustainable solution of renting books in their initial years of college and with placement packages towards their end journey.",
      "stipend": "Rs. 8K - 10K",
      "location": "Delhi, India",
      "applyBy": "Immediate",
    },
    {
      "name": "Business Development Intern",
      "company": "Orange Ant Media",
      "duration": "1 month",
      "desc":
          "1. lead qualification\n2. Cold Calling",
      "companyDesc":
          "Amid 10 min grocery delivery hype, have you ever thought of hiring in 10 minutes?  Suppose we give you the system where you can hire in 10 minutes. Will fast hiring solve all of your concerns?  Concerns like Fill Rate, Underskilled/Unproductive Hire, Absentism & Retention Problem, High Hiring, Operational & Associated Cost (IT assets, Insurance and Retirals etc.) and above all Scalability are unsolvable from the speedy hiring.  We introduce Depute to solve not only above concerns but many others as well. We take headache of hiring, training & operations from you, so you can focus on core of your business.  We differ ourselves from both traditional staffing & Gig Economy firms.  Traditional Staffing: It allow you to hire smoothly but other concerns still persist. GIG Economy: It solves majority of your concerns but reduce the quality of work delivered. Mostly suitable for Blue Collar works.  Depute: Solve all of your concerns including quality coz we work with in-house team to over-deliver.",
      "stipend": "Rs. 6K - 8K",
      "location": "Mumbai , India",
      "applyBy": "Immediate",
    },
    {
      "name": "Human Resources (HR) Internship",
      "company": "Meru Accounting Pvt Ltd",
      "duration": "6 months",
      "desc":
          "1. Scheduling interviews, sourcing/screening candidates, and facilitating background screenings\n2. Sourcing candidates through telephonic and direct interviews\n3. Following up with the selected candidates for further procedures.\n4. Working on joining and exit formalities\n5. Working on employee engagement\n6. Coordination with the marketing team\n7. Working on coordination with the business development team\n8. Working on coordination with the management team",
      "companyDesc":
          "Meru Accounting is the most renowned accounting firm in Ahmedabad and is known for its quality bookkeeping and accounting services worldwide. We are an outsourced accounting service provider and serving many countries, which include the USA, UK, Australia, New Zealand, Singapore, UAE, Hong-Kong, etc.",
      "stipend": "Rs. 5K - 6K",
      "location": "Ahmedabad, India",
      "applyBy": "Immediate",
    },
  ];
}
