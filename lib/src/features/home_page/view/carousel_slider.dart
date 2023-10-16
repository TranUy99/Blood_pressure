import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderBanner extends StatefulWidget {
  const CarouselSliderBanner({Key? key}) : super(key: key);

  @override
  State<CarouselSliderBanner> createState() => _CarouselSliderBannerState();
}

class _CarouselSliderBannerState extends State<CarouselSliderBanner> {
  final imageBanner = [
    const Image(image: AssetImage('assets/images/blood-pressure-chart1.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('assets/images/h3_high-blood-pressure.jpg'), fit: BoxFit.fill),
    const Image(
        image: AssetImage('assets/images/blood-pressure-measurement.webp'), fit: BoxFit.fill),
    const Image(
        image: AssetImage('assets/images/Blood-Pressure-Numbers_Newsroom.jpg'), fit: BoxFit.fill),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return Container(
                child: imageBanner[index],
                // width: MediaQuery.of(context).size.width * 0.9,
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 21 / 9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            )),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imageBanner.length,
        ),
      ],
    );
  }
}
