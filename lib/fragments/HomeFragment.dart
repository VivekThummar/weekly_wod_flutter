import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final List<ImageProvider> imageList = [
    Image.asset("images/ic_google.png").image,
    Image.asset("images/ic_facebook.png").image
  ];

  HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sliderList = <Container>[];
    var indicatorList = <Container>[];
    for (var i = 0; i < imageList.length; i++) {
      sliderList.add(Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: imageList.elementAt(i),
            fit: BoxFit.cover,
          ),
        ),
      ));

      indicatorList.add(Container(
        height: 20,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ));
    }
    return Column(
      children: [
        Stack(children: [
          CarouselSlider(
            items: sliderList,

            //Slider Container properties
            options: CarouselOptions(
              height: 180,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(milliseconds: 3000),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              viewportFraction: 0.8,
            ),
          ),
        ]),
      ],
    );
  }
}
