import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScholarshipDetailsPage extends StatefulWidget {
  const ScholarshipDetailsPage({Key? key, required this.map}) : super(key: key);
  final Map<String, String> map;

  @override
  State<ScholarshipDetailsPage> createState() => _ScholarshipDetailsPageState();
}

class _ScholarshipDetailsPageState extends State<ScholarshipDetailsPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadWidgets();
  }

  loadWidgets() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.map['name']!),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          )),
      body: !isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    FlipCard(
                      front: Image.network(widget.map['image']!),
                      back: Image.network(widget.map['image']!),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.school),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.map['name']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.screen_search_desktop),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.map['scheme']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.data_thresholding),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.map['deadline']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.electric_meter),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.map['eligibility']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        launchUrlString(
                          widget.map['link']!,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.link),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Link'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
