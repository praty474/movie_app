import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, itemIndex, PageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 300,
                width: 200,
                color: const Color.fromARGB(255, 185, 21, 10),
              ),
            );
          },
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 2))),
    );
  }
}
