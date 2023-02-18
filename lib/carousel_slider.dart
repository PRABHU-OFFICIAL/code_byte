import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemSlider extends StatelessWidget {
  const ItemSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: AssetImage("images/item1.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: AssetImage("images/item2.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: AssetImage("images/item3.png"),
                          fit: BoxFit.cover)),
                ),
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                viewportFraction: 0.8,
              ))
        ],
      ),
    );
  }
}
