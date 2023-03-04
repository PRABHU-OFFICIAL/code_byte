import 'package:flutter/material.dart';
import 'package:hackathon/mentors_page_resources/mentors_details_page.dart';
import 'package:lottie/lottie.dart';

class MentorsPage extends StatefulWidget {
  const MentorsPage({super.key});

  @override
  State<MentorsPage> createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
  bool isLoading = false;
  Color color = Colors.white;
  String animate = 'images/loading.json';
  dynamic defaultIndex = -1;
  var mData = MentorsData.getData;
  final tempData = MentorsData.getData;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    "Choose Your Mentors",
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

  loadWidgets() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  loadDefaultWidgets(index) async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MentorsDetailsPage(map: mData[index])));
  }

  @override
  Widget build(BuildContext context) {
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
          title: customSearchBar,
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
                                mData = tempData;
                                customIcon = const Icon(Icons.cancel);
                              } else {
                                customIcon = const Icon(Icons.search);
                                mData = tempData
                                    .where((element) => element["name"]!
                                        .toString()
                                        .toLowerCase()
                                        .contains(s.toLowerCase()))
                                    .toList();
                              }
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'type in topics for mentors...',
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
                        "Choose Your Mentors",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  });
                },
                icon: customIcon),
          ],
        ),
        body: !isLoading
            ? ListView.builder(
                itemCount: mData.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: mData[index]['image'].toString() !=
                                  ""
                              ? NetworkImage(mData[index]['image'].toString())
                              : const NetworkImage(
                                  "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
                        ),
                        title: Text(
                          mData[index]['name'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mData[index]['job'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: SizedBox(
                          child: Lottie.asset(
                            defaultIndex == index
                                ? 'images/load.json'
                                : 'images/loading.json',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () async {
                          setState(() {
                            defaultIndex = index;
                            loadDefaultWidgets(defaultIndex);
                          });
                        },
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

class MentorsData {
  static final getData = [
    {
      "name": "Amit Zutshi",
      "job": "Managing Partner at Morphosis Advisors, Dubai",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "Amit is an investor interested in early stage startups. He is currently working on piecing together a VC fund that helps scale Indian startups",
      "objectives": [
        "Want to invest in a startup",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image": "",
      "meetings": 1,
      "meet": 2,
      "endorsements": 3,
    },
    {
      "name": "Jason Fernandes",
      "job": "President (India Operations) at XREX Inc. Delhi , India",
      "worked": "Worked at NFTtechnologies, AdLunam Inc., FOHO Coin",
      "experience": ["Start-ups", "Marketing Strategy", "Online Advertising"],
      "education": "High School, American School of Bombay",
      "desc":
          "A TEDx speaker and ICOBench expert, Jason is an entrepreneur, blockchain speaker and crypto analyst. He has served as an advisor to various international blockchain firms, political parties and state governments. ",
      "objectives": ["Meet interesting people"],
      "image":
          "https://salesql.s3.eu-central-1.amazonaws.com/person/d30463d7-e340-4107-9ca2-a94863d90ed8-jason-fernandes.png",
      "meetings": 2,
      "meet": 3,
      "endorsements": 4,
    },
    {
      "name": "Jaideep Mehta",
      "job": "CEO at Mosaic Digital Delhi",
      "worked": "Worked at Mosaic Media Ventures Pvt. Ltd.",
      "experience": [
        "Change Management",
        "Team Leadership",
        "New Business Development"
      ],
      "education": "MBA, Manchester Business School",
      "desc":
          "Jaideep is a business leader, a petrolhead, football lover and amateur economist. I am currently working on many different things. I would love to meet Interesting folks.",
      "objectives": [
        "Want to invest in a startup",
        "Brainstorm Ideas",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-3177cae2-a00a-41cc-b64d-f4416b9a03c0.jpg",
      "meetings": 3,
      "meet": 4,
      "endorsements": 5,
    },
    {
      "name": "Sanjev Vaid",
      "job":
          "Sanjev Vaid Managing Director - Human Resources Head - Reward & Employment India at Royal Bank of Scotland Business Delhi",
      "worked": "Worked at NatWest Group",
      "experience": [
        "Talent Management & Organizational Development",
        "Reengineering & Restructuring and Mergers & Acquisitions",
        "Leadership Coaching & Capability building, Succession Planning"
      ],
      "education": "Masters in HR & OD, Delhi University",
      "desc":
          "Sanjev is a tech enthusiast, aspiring entrepreneurs, investor, entrepreneurship supporter and business oriented HR leader. Loves to meet Founders, investors and VCs, business leaders facing specific challenges and looking for advise. .",
      "objectives": ["Raise Funding", "Brainstorm Ideas"],
      "image":
          "https://salesql.s3.eu-central-1.amazonaws.com/person/d632dbd6-1ada-420c-87f3-a934e33a65ea-sanjev-vaid.png",
      "meetings": 4,
      "meet": 5,
      "endorsements": 6,
    },
    {
      "name": "Vaibhav Jain",
      "job": "Startups & VC Partnerships at Google Cloud India Gurgaon",
      "worked": "Worked at Google",
      "experience": ["business", "business development", "cloud computing"],
      "education": "BIS (Hons), Guru Gobind Singh Indraprastha University",
      "desc":
          "Vaibhav works for Google Cloud India and manages relationships with startups and VCs. He is a 2X founder and an angel investor with an interest in fintech, B2B SaaS, D2C and other tech-enabled businesses.",
      "objectives": [
        "Want to invest in a startup",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image": "",
      "meetings": 5,
      "meet": 6,
      "endorsements": 7,
    },
    {
      "name": "Rohit Bafna",
      "job": "Founder at 888 VC NETWORK Bangalore",
      "worked": "Worked at Deliver Fuel Solutions Pvt Ltd, HomeCapital, Phable",
      "experience": ["Corporate Finance", "funds", "Entrepreneurship"],
      "education":
          "Bachelor of Business Administration (BBA), SYMBIOSIS INTERNATIONAL UNIVERSITY",
      "desc":
          "hit is angel investor, investment professional, venture capitalist and a technology enthusiast. He is helping startups raise seed to growth-stage funding. He would love to meet startup professionals from tech, B2B enterprise Saas companies, healthtech, fintech, AI, internet, consumer-centric industries.",
      "objectives": [
        "Raise Funding",
        "Want to invest in a startup",
        "Meet interesting people"
      ],
      "image":
          "https://salesql.s3.eu-central-1.amazonaws.com/person/8cef32ef-c5cc-447e-8879-6efbb29d7bec-rohit-bafna.png",
      "meetings": 6,
      "meet": 7,
      "endorsements": 8,
    },
    {
      "name": "Vikas Mittal",
      "job": "Global President at Xebia Delhi",
      "worked": "Worked at Xebia Forbes Technology Council Wadhwani Foundation",
      "experience": ["Test Automation", "Requirements Analysis", "Testing"],
      "education":
          "Executive Programe in Project Management, Indian Institute of Technology, Delhi",
      "desc":
          "Vikas is a technology enabler and partner for companies and individuals looking for market growth. He is currently working on a new startup in the FMCG sector.",
      "objectives": [
        "Want to invest in a startup",
        "Brainstorm Ideas",
      ],
      "image": "",
      "meetings": 7,
      "meet": 8,
      "endorsements": 9,
    },
    {
      "name": "Venkataraman Thyagarajan",
      "job": "Ombudsman/ Chairman ALET at Ashok Leyland Chennai",
      "worked": "Worked at Coachmeorg.co.in , Ashok Leyland",
      "experience": [
        "Customer Satisfaction",
        "Business Development",
        "Dealer Management"
      ],
      "education": "B.E;M S, Indian Institute of Technology, Madras",
      "desc":
          "Venkataraman is an experienced coach, mentor and a leader, willing to share expertise and knowledge and develop potential in people and leverage opportunities. I am currently working on executive and leadership coaching. I would love to meet people, looking for involvement and sharing of ideas.",
      "objectives": ["Brainstorm Ideas", "Meet interesting people"],
      "image":
          "https://salesql.s3.eu-central-1.amazonaws.com/person/888d9814-440a-4af1-8bf8-1c2a4efb83f3-venkataraman-thyagarajan.png",
      "meetings": 8,
      "meet": 9,
      "endorsements": 10,
    },
    {
      "name": "Amar Daing",
      "job": "Product at Oyo Gurgaon",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "Amar is a product geek who loves understanding why users behave the way they do, are an avid trekker and a constant learner. He is currently working on multiple charters in product at Oyo and is passionate about how the next billion users will adopt the digital world. ",
      "objectives": [
        "Brainstorm Ideas",
        "Hire Talent",
        "Explore Career Opportunities"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-9838565d-d1ab-4456-b0dc-954e10f86a8f.jpg",
      "meetings": 9,
      "meet": 10,
      "endorsements": 11,
    },
    {
      "name": "Kunal Bhardwaj",
      "job": "MaDirector, Product and Content Strategy at Dailyhunt Bangalore",
      "worked": "Knimbus.com, Testbook.com, Puruaa",
      "experience": [
        "Competitive Analysis",
        "Lead Generation",
        "Business Development"
      ],
      "education":
          "PGDM, Balaji Institute of Management and Human Resource Development",
      "desc":
          "Kunal is a hustler, having built and scaled edtech products in the past from scratch. I am currently working on next edtech idea. I would love to meet people having domain expertise in EdTech space.",
      "objectives": [
        "Brainstorm Ideas",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-39c3fe88-4d9f-4ec1-9402-7a2e983b2ab4.jpg",
      "meetings": 10,
      "meet": 11,
      "endorsements": 12,
    },
    {
      "name": "Vinay Chandhok",
      "job": "CXO and Mentor at Multiple Cos Gurgaon",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "VINAY CHANDHOKDIRECTORVinay has held leadership positions in Telecom, ISP, IT System Integration/Solution Sales, Cable managing large scale operations across Direct and JV operations. Vinay's experience of three decades spans across multi-channel sales formats of B2B, B2C, B2B2C across Enterprise,",
      "objectives": [
        "Raise Funding",
        "Brainstorm Ideas",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-57c72c82-29dc-4918-848d-6fa35ef88f63.jpg",
      "meetings": 11,
      "meet": 12,
      "endorsements": 13,
    },
    {
      "name": "Rattan Chugh",
      "job": "Co-Founder at Fundflo Technologies Gurgaon",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "It's no secret that business success today revolves mostly around people, not capital. In most industries, people costs are much higher than capital costs. And we all know that the Old Rules Don’t Apply in the ‘People Business’. Rattan is the master of this game, successfully combining his business acumen and new rule book for people-intensive ventures.",
      "objectives": ["join an early stage startup", "Brainstorm Ideas"],
      "image":
          "https://assets.coffeemug.ai/li-files/image-afd82e8f-6a3d-4714-ae01-d5ef80d2311c.jpg",
      "meetings": 12,
      "meet": 13,
      "endorsements": 14,
    },
    {
      "name": "Dharmender Khanna",
      "job": "CBO and VP- D2C Solutions at AnyMind Group Gurgaon",
      "worked": "Worked at AnyMind Group, Inflection Point Ventures, BluSmart",
      "experience": ["E-commerce", "Retail", "Business Development"],
      "education": "Certified Blockchain expert, Blockchain Council",
      "desc":
          "Dharmender is an e-commerce and retail professional, with 2 decades of leadership experience. He is currently mentoring and working on D2C solutions.",
      "objectives": [
        "Want to invest in a startup",
        "Hire Talent",
        "Brainstorm Ideas"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-c6626b00-b375-4ed7-960f-1bb6aa5588cd.jpg",
      "meetings": 13,
      "meet": 14,
      "endorsements": 15
    },
    {
      "name": "Nitish Raikar",
      "job": "CEO at Kilowott Bangalore",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "I consult IT Services Companies to integrate their processes resulting in significant improvements in efficiency and effectiveness. If you are a SME IT company and want to setup processes which help you scale. Let's talk",
      "objectives": [
        "Brainstorm Ideas",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-b891daf1-40cf-4266-8958-4ce454a051ed.jpg",
      "meetings": 14,
      "meet": 15,
      "endorsements": 16,
    },
    {
      "name": "Caroline Cares",
      "job": "Founder at Krisullis Bangalore",
      "worked":
          "Worked at Vibha For Inclusion , TIR Global, Marshall Goldsmith Stakeholder Centered Coaching",
      "experience": [
        "Performance Management",
        "Vendor Management",
        "Program Management"
      ],
      "education": "  University of Cape Town",
      "desc":
          "Caroline is an international speaker and a certified executive coach. I am building Krisullis, a safe cross-cultural space to provide peer-learning, internships, upskilling for successful job matching, courses to support your upskilling plans. I would love to meet founders in the human centric start-up space.",
      "objectives": [
        "Raise Funding",
        "Brainstorm Ideas",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-2078fbcb-c622-49ac-a846-058053c54ec6.jpg",
      "meetings": 15,
      "meet": 16,
      "endorsements": 17,
    },
    {
      "name": "Sharmila Devi",
      "job": "Founder & Clarity Coach at SevenClover Chennai",
      "worked":
          "Worked at Morphosis Advisors, EY-Parthenon, McKinsey & Company",
      "experience": ["Due Diligence", "Business Planning", "Business Analysis"],
      "education": "(MBA), Indian Institute of Management Bangalore",
      "desc":
          "Sharmila is the founder of SevenClover Coaching Services. She is an experienced NLP master coach and the co director of Startup Grind, an event services firm. She would love to meet accelerators, investors and corporate event management firms.",
      "objectives": [
        "Want to invest in a startup",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image":
          "https://salesql.s3.eu-central-1.amazonaws.com/person/c124430b-7b19-4ada-a6da-2c8fe4722ea1-sharmila-devi.png",
      "meetings": 16,
      "meet": 17,
      "endorsements": 18,
    },
    {
      "name": "Dr Deepa Desai",
      "job": "Senior VP & Country Head at LabCorp Drug Development Mumbai",
      "worked": "Worked at Loyal VC, IQVIA, McKinsey & Company",
      "experience": ["Clinical Research", "Clinical Development", "GCP"],
      "education":
          "(ILPSIE - Insead Leadership Program for Senior Executives, INSEAD",
      "desc":
          "Deepa is a business leader with more than two decades of experience in the healthcare domain. Currently working as a Senior Vice President and Country Head, India for LabCorp Drug Development, where she provides the highest level of leadership for the Organization, working closely with all global service lines as well as regional markets to define, prioritize and implement business plans in India",
      "objectives": [
        "Want to invest in a startup",
        "Hire Talent",
        "Meet interesting people"
      ],
      "image":
          "https://assets.coffeemug.ai/li-files/image-148d69b5-4d8c-49be-afa6-5965df126928.jpg",
      "meetings": 17,
      "meet": 18,
      "endorsements": 19,
    },
  ];
}
