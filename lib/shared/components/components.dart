import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  required Color colorIcon,
  required String text,
  required bool isOn,
  required onPressed,
  required bool disable,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: !disable
              ? Colors.black54.withOpacity(.7)
              : Colors.red.withOpacity(.7),
          borderRadius: BorderRadiusDirectional.circular(18.0),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(
                Icons.offline_bolt_outlined,
                size: 30,
                color: colorIcon,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '$text',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Switch(
                onChanged: (value) => onPressed,
                value: isOn,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );

Widget textFormView({
  required String nameSensor,
  required IconData iconSensor,
  required String data,
  double height = 0,
  bool anime = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(5),
                        topEnd: Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 2,
                          child: Text(
                            '$nameSensor',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          child: Icon(
                        iconSensor,
                        color: Colors.white,
                      )),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.black54.withOpacity(.7),
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(5),
                        bottomEnd: Radius.circular(5)),
                  ),
                  child: Text('$data',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  height: anime ? 100 : 0,
                  padding: EdgeInsets.all(10),
                  duration: Duration(seconds: 5),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget defaultTextView({
  required String name,
  required String image,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.indigo,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        '$image',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

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
}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    padding: const EdgeInsets.only(
                        left: 10.0, bottom: 10, top: 10, right: 10),
                    child: Image.asset(
                      'assets/img/ico/$imgName.png',
                      height: width * .18,
                      width: width * .18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$powerName',
                  style: TextStyle(
                      fontSize: width * .05,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
                Text(
                  '$statePower'.toUpperCase(),
                  style: TextStyle(fontSize: width * .06, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget aboutName({
  required String Name,
  required String img,
  required String hexColor,
  required context,
  required String Atext,
  required String Etext,
}) =>
    MaterialButton(
      color: Colors.white,
      onPressed: () => infoPerson(
        context,
        name: Name,
        Atext: Atext,
        Etext: Etext,
        img: img,
        color: hexColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: HexColor(hexColor),
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
                  '$img',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '$Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: HexColor(hexColor),
                ),
              ),
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: HexColor(hexColor),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );

void infoPerson(BuildContext context,
    {required String name,
    required String img,
    required String Atext,
    required String Etext,
    required String color}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(color),
          title: Text(name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () => showPic(context, img: img, color: color),
              icon: Image.asset(img),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Hero(
            tag: '$name',
            child: Column(
              children: [
                Container(
                  child: Text(
                    '$Atext\n',
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  alignment: AlignmentDirectional.topEnd,
                ),
                Text(
                  "---------------------------------------------",
                  textAlign: TextAlign.center,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '$Etext\n',
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void showPic(BuildContext context,
    {required String img, required String color}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(color),
          title: Text('back'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Hero(
            tag: '',
            child: CircleAvatar(
              child: Image.asset(img),
              radius: 900,
            ),
          ),
        ),
      ),
    ),
  );
}

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

Widget pageViewItempageViewItem(
        BuildContext context, List<PageViewData> PageViewItems, index) =>
    aboutName(
      Atext: PageViewItems[index].Atext,
      Etext: PageViewItems[index].Etext,
      Name: PageViewItems[index].title,
      img: PageViewItems[index].image,
      hexColor: PageViewItems[index].hexColor,
      context: context,
    );
