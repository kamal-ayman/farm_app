import 'package:farm_app0/modules/about_screens/person_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultInfo({
  required String img,
  required String dataName,
  required String dataValue,
  required String typeName,
  required double typeSize,
  required double width,
}) =>
    Expanded(
      child: Column(
        children: [
          Container(
            width: width * .4,
            height: width * .45,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: HexColor('D5C9F2'),
                  offset: const Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(500),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, bottom: 10, top: 10, right: 10),
                    child: Image.asset(
                      img,
                      height: width * .18,
                      width: width * .18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$dataName',
                  style: TextStyle(
                      fontSize: width * .039, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        '$dataValue',
                        style: TextStyle(fontSize: width * .039),
                      ),
                    ),
                    Text(
                      '$typeName',
                      style: TextStyle(fontSize: width / typeSize * .49),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

Widget defaultPower({
  required String imgName,
  required String powerName,
  required String statePower,
  required Color powerColor,
  required Color textColor,
  required onPressed,
  required width,
  iconPower,
}) =>
    Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 5,
              onPressed: onPressed,
              color: powerColor,
              child: Container(
                height: width * 0.44,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: iconPower == null
                            ? Image.asset(
                                'assets/img/ico/$imgName.png',
                                height: width * .18,
                                width: width * .18,
                              )
                            : Icon(
                                iconPower,
                                size: 50,
                                color: powerColor,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        '$powerName',
                        style: TextStyle(
                          fontSize: width * .05,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ),
                    if (statePower != '')
                      Text(
                        '$statePower'.toUpperCase(),
                        style: TextStyle(fontSize: width * .06, color: textColor),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );

class PageViewData {
  PageViewData({
    required this.image,
    required this.title,
    required this.hexColor,
    required this.Atext,
    required this.Etext,
  });

  late String image, title, hexColor, Atext, Etext;
}

Widget pageViewItemPageViewItem(
        BuildContext context, List<PageViewData> PageViewItems, index, w) =>
    MaterialButton(
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PersonInfoScreen(
              color: PageViewItems[index].hexColor,
              img: PageViewItems[index].image,
              name: PageViewItems[index].title,
              Atext: PageViewItems[index].Atext,
              Etext: PageViewItems[index].Etext,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: HexColor(PageViewItems[index].hexColor),
                borderRadius: BorderRadius.circular(200),
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
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  '${PageViewItems[index].image}',
                  height: w * .30,
                  width: w * .30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${PageViewItems[index].title}',
                  style: TextStyle(
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.w600,
                    color: HexColor(PageViewItems[index].hexColor),
                  ),
                ),
              ],
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: HexColor(PageViewItems[index].hexColor),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
