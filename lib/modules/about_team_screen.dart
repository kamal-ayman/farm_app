import 'package:farm_app0/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var pageVIewController = PageController();
  int pageIndex = 0;
  List<PageViewData> PageViewItems = [
    PageViewData(
        image: "assets/img/team.png",
        title: "Kamal Ayman",
        hexColor: 'FFAC2A',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Nour El Deen",
        hexColor: 'FF3B56',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Moamen Mohsen",
        hexColor: '1593DC',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Mohammed Faheem",
        hexColor: '4C33FF',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Henawy",
        hexColor: '247DFF',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Mohammed Safwat",
        hexColor: 'FF6427',
        text: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/team.png",
        title: "Eman Ali",
        hexColor: 'EF4BC5',
        text: 'لقد قام بعمل...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Image.asset(
            'assets/img/screen/about.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🔥Venoms🔥',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 360),
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        if (pageIndex != 0) {
                          pageVIewController.previousPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 27,
                        color: HexColor('2961FF'),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('D5C9F2'),
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('D5C9F2'),
                              offset: const Offset(
                                0.0,
                                7.0,
                              ),
                              blurRadius: 1.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        height: 180,
                        width: 180,
                        child: Container(
                          child: PageView.builder(
                            controller: pageVIewController,
                            itemBuilder: (context, index) =>
                                pageViewItem(context, PageViewItems, index),
                            itemCount: PageViewItems.length,
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                pageIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (pageIndex != PageViewItems.length - 1) {
                          pageVIewController.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 27,
                      ),
                      backgroundColor: HexColor('2961FF'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmoothPageIndicator(
                    controller: pageVIewController,
                    count: PageViewItems.length,
                    effect:
                        JumpingDotEffect(activeDotColor: HexColor('2961FF')),
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  splashColor: Colors.white,
                  height: 40,
                  minWidth: 150,
                  child: Text(
                    'Back to menu',
                    style: TextStyle(fontSize: 14, color: HexColor('2961FF')),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewData {
  PageViewData(
      {required this.image,
      required this.title,
      required this.hexColor,
      required this.text});

  late String image, title, hexColor, text;
}

Widget pageViewItem(
        BuildContext context, List<PageViewData> PageViewItems, index) =>
    aboutName(
      Name: PageViewItems[index].title,
      img: PageViewItems[index].image,
      hexColor: PageViewItems[index].hexColor,
      context: context,
      text: PageViewItems[index].text,
    );
