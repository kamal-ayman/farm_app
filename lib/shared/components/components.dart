import 'package:flutter/cupertino.dart';
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
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) => ImageDialog(
                    color: color,
                    img: img,
                  ),
                );
              },
              icon: Image.asset(img),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
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
  );
}

class ImageDialog extends StatelessWidget {
  var img, color;

  ImageDialog({required String img, required color}) {
    this.img = img;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(500) ,
      ),
      child: Container(
        width: w - 100,
        height: w - 100 ,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
          image: ExactAssetImage('$img'),
          // fit: BoxFit.cover
        )),
      ),
    );
  }
}

void showPicDialog(BuildContext context,
    {required String img, required String color}) {}

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

Widget pageViewItemPageViewItem(
        BuildContext context, List<PageViewData> PageViewItems, index) =>
    aboutName(
      Atext: PageViewItems[index].Atext,
      Etext: PageViewItems[index].Etext,
      Name: PageViewItems[index].title,
      img: PageViewItems[index].image,
      hexColor: PageViewItems[index].hexColor,
      context: context,
    );
