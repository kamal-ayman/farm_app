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
      image: "assets/img/pics/1.png",
      title: "Kamal Ayman",
      hexColor: 'FFAC2A',
      Atext: "- إنشاء قاعدة بيانات عبر الإنترنت.\n"
          "- برمجة تطبيق مزرعة ذكية.\n"
          "- برمجة Arduino للتواصل مع المستشعرات وقاعدة البيانات.\n"
          "- برمجة ESP-WIFI لإرسال واستقبال قاعدة البيانات.",
      Etext: "\n- Create online database.\n"
          "- Create Smart Farm Application.\n"
          "- Code arduino to communicate with sensors and database.\n"
          "- Code ESP-Wifi to send and receive database",
    ),
    PageViewData(
      image: "assets/img/pics/2.png",
      title: "Nour El Deen",
      hexColor: 'FF3B56',
      Atext: '- تخيل كيف سيبدو المشروع للتنفيذ.\n'
          '- تصميم جسم المشروع.\n'
          '- تنفيذ وطباعة التصميم.',
      Etext: '\n- Imagine what the project will look like for implementation.\n'
          '- Project body design.\n'
          '- Implementation and printing of the design. \n',
    ),
    PageViewData(
        image: "assets/img/pics/3.png",
        title: "Mohamed Mostafa",
        hexColor: '1593DC',
        Atext: 'لقد قام بعمل...',
        Etext: ''),
    PageViewData(
        image: "assets/img/pics/4.png",
        title: "Moamen Mohsen",
        hexColor: '00C852',
        Etext: '',
        Atext: 'لقد قام بعمل...'),
    PageViewData(
        image: "assets/img/pics/5.png",
        title: "Eman Ali",
        hexColor: 'EF4BC5',
        Atext: 'لقد قام بعمل...',
        Etext: ''),
    PageViewData(
        image: "assets/img/ico/team.png",
        title: "Mohammed Faheem",
        hexColor: '4C33FF',
        Atext: 'لقد قام بعمل...',
        Etext: ''),
    PageViewData(
        image: "assets/img/ico/team.png",
        title: "Mohammed Safwat",
        hexColor: 'FF6427',
        Atext: 'لقد قام بعمل...',
        Etext: ''),
  ];
  bool leftIsFull = true;
  bool rightIsFull = false;

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
                        setState(() {
                          if (pageIndex > 0) {
                            pageVIewController.previousPage(
                              duration: Duration(milliseconds: 350),
                              curve: Curves.ease,
                            );
                            rightIsFull = false;
                            if (pageIndex == 1){
                              leftIsFull = true;
                            }else {
                              leftIsFull = false;
                            }
                          }
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 27,
                        color: leftIsFull
                            ? HexColor('2961FF')
                            : HexColor('FFFFFF'),
                      ),
                      backgroundColor:
                          leftIsFull ? Colors.white : HexColor('2961FF'),
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
                                pageViewItempageViewItem(
                                    context, PageViewItems, index),
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
                        setState(() {
                          if (pageIndex < PageViewItems.length - 1) {
                            pageVIewController.nextPage(
                              duration: Duration(milliseconds: 350),
                              curve: Curves.ease,
                            );
                            leftIsFull = false;
                            if (pageIndex == PageViewItems.length - 2) {
                              rightIsFull = true;
                            } else {
                              rightIsFull = false;
                            }
                          }
                        });
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 27,
                        color: rightIsFull
                            ? HexColor('2961FF')
                            : HexColor('FFFFFF'),
                      ),
                      backgroundColor:
                          rightIsFull ? Colors.white : HexColor('2961FF'),
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
