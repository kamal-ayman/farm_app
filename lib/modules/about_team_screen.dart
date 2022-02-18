import 'package:farm_app0/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
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

  bool left = true;
  bool right = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
      statusBarIconBrightness: Brightness.light,
    ));
    final w = MediaQuery.of(context).size.width;
    final p = MediaQuery.of(context).padding.top + 10;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Container(
            color: HexColor('#2961ff'),
            width: w,
            height: p,
          ),
          Transform.translate(
            offset: Offset(0, p),
            child: Image.asset(
              'assets/img/screen/about.png',
              height: h,
              width: w,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: p / 2),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        if (pageIndex > 0) {
                          pageVIewController.previousPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        }
                        setState(() {});
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 27,
                        color: left ? HexColor('2961FF') : HexColor('FFFFFF'),
                      ),
                      backgroundColor: left ? Colors.white : HexColor('2961FF'),
                    ),
                    Container(
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
                      height: w * .45,
                      width: w * .45,
                      child: PageView.builder(
                        controller: pageVIewController,
                        itemBuilder: (context, index) =>
                            pageViewItemPageViewItem(
                                context, PageViewItems, index),
                        itemCount: PageViewItems.length,
                        physics: BouncingScrollPhysics(),
                        onPageChanged: (index) {
                          print(index);
                          if (index > 0 && index < 6) {
                            left = false;
                            right = false;
                          } else if (index == 6) {
                            left = false;
                            right = true;
                          } else {
                            left = true;
                            right = false;
                          }
                          pageIndex = index;
                          setState(() {});
                        },
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (pageIndex < PageViewItems.length - 1) {
                          pageVIewController.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        }
                        setState(() {});
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 27,
                        color: right ? HexColor('2961FF') : HexColor('FFFFFF'),
                      ),
                      backgroundColor:
                          right ? Colors.white : HexColor('2961FF'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SmoothPageIndicator(
                    controller: pageVIewController,
                    count: PageViewItems.length,
                    effect: JumpingDotEffect(
                        activeDotColor:
                            HexColor(PageViewItems[pageIndex].hexColor)),
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
                  minWidth: w * .35,
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
