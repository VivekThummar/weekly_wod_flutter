import 'dart:ui' as ui show PlaceholderAlignment;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';
import 'package:weekly_wod_flutter/generated/assets.dart';
import 'package:weekly_wod_flutter/models/HomeButtonModel.dart';

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

  final List<HomeButtonModel> buttonList = [
    HomeButtonModel(
        title: 'Join Contest',
        icon: Image.asset(Assets.imagesIcHomeJoin).image),
    HomeButtonModel(
        title: 'My Submission',
        icon: Image.asset(Assets.imagesIcHomeSubmission).image),
    HomeButtonModel(
        title: 'My Profile',
        icon: Image.asset(Assets.imagesIcHomeProfile).image),
    HomeButtonModel(
        title: 'Leaderboard',
        icon: Image.asset(Assets.imagesIcLeaderboardHome).image)
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

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: sliderList,
                options: CarouselOptions(
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(milliseconds: 3000),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 1000),
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                  ),
                  children: List.generate(buttonList.length, (index) {
                    return Card(
                        elevation: 3,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: buttonList.elementAt(index).icon,
                                    ),
                                  ),
                                ),
                                Text(
                                  buttonList.elementAt(index).title,
                                  style: FontConstant.regular12TextDark(),
                                ),
                              ]),
                        ));
                  }),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1,
                  color: ColorConstants.dividerColor,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter This Week\'s Contest',
                    style: FontConstant.semiBold12TextDark(),
                    textAlign: TextAlign.start,
                  ),
                ),
                Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      // clip the image to a circle
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                image: DecorationImage(
                                  image: Image.asset(Assets.imagesHulk).image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Current Contest NameCurrent Contest NameCurrent Contest Name',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: FontConstant.semiBold12TextDark(),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    child: const Text('Register'),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: ColorConstants.themeColor,
                                      // background
                                      onPrimary: Colors.white, // foreground
                                    )),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Entry : ',
                                          style:
                                          FontConstant.regular12InputText(),
                                        ),
                                        TextSpan(
                                          text: '500 ',
                                          style:
                                          FontConstant.regular12InputText(),
                                        ),
                                        WidgetSpan(
                                          // child: getSvgIcon('images/ic_contest_coin.svg'),
                                            child: getSvgIcon(
                                                './ic_contest_coin.svg'),
                                            alignment:
                                            ui.PlaceholderAlignment.middle),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          // child: getSvgIcon('images/ic_contest_coin.svg'),
                                            child: getSvgIcon(
                                                './ic_contest_trophy.svg'),
                                            alignment:
                                            ui.PlaceholderAlignment.middle),
                                        TextSpan(
                                          text: ' 3/',
                                          style: FontConstant.regular12Green(),
                                        ),
                                        TextSpan(
                                          text: 'winner',
                                          style: FontConstant.regular12Green(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RichText(
                                    textAlign: TextAlign.end,
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          // child: getSvgIcon('images/ic_contest_coin.svg'),
                                            child: getSvgIcon(
                                                './ic_contest_watch_yellow.svg'),
                                            alignment:
                                            ui.PlaceholderAlignment.middle),
                                        TextSpan(
                                          text: ' 5 ',
                                          style: FontConstant.regular12Yellow(),
                                        ),
                                        TextSpan(
                                          text: 'Days',
                                          style: FontConstant.regular12Yellow(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // child: Container(height: 200, color: Colors.grey,),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  SvgPicture getSvgIcon(String assetName) {
    return SvgPicture.asset(assetName);
  }
}
