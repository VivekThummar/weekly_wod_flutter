import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/generated/assets.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  HomeFragmentState createState() {
    return HomeFragmentState();
  }
}

class HomeFragmentState extends State<HomeFragment> {
  int _current = 0;

  final List<ImageProvider> imageList = [
    Image.asset(Assets.imagesCaptainAmerica).image,
    Image.asset(Assets.imagesDoctorStrange).image,
    Image.asset(Assets.imagesHulk).image,
    Image.asset(Assets.imagesIronMan).image,
    Image.asset(Assets.imagesThor).image
  ];

  @override
  Widget build(BuildContext context) {
    var sliderList = <Container>[];
    var indicatorList = <Container>[];
    for (var i = 0; i < imageList.length; i++) {
      sliderList.add(Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageList.elementAt(i),
            fit: BoxFit.cover,
          ),
        ),
      ));

      indicatorList.add(Container(
        width: 15,
        height: 3,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
            color: _current == i ? Colors.blueAccent : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(1.5))),
      ));
    }
    return Column(
      children: [
        Stack(children: [
          CarouselSlider(
            items: sliderList,
            options: CarouselOptions(
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(milliseconds: 3000),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Row(
              children: indicatorList,
            ),
          ),
        ]),
      ],
    );
  }
}
