import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class banner extends StatefulWidget {
  const banner({super.key});

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
          items: [
            Image.asset('assets/images/banner-1.png'),
            Image.asset('assets/images/banner-2.png'),
            Image.asset('assets/images/banner-3.png'),
          ],
          options: CarouselOptions(
              autoPlay: true,
              height: 250,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reson) {
                setState(() {
                  myCurrentIndex = index;
                });
              })),
      AnimatedSmoothIndicator(
          activeIndex: myCurrentIndex,
          count: 3, // Number of items in the carousel
          effect: WormEffect(
            activeDotColor: Color(0xffE10636),
            dotColor: Color(0xffFFD300),
            dotHeight: 8,
            dotWidth: 8,
            spacing: 10,
            paintStyle: PaintingStyle.fill,
          ))
    ]);
  }
}
