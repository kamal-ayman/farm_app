import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonInfoScreen extends StatelessWidget {
  final String name, img, Atext, Etext, color;

  PersonInfoScreen({
    required String this.name,
    required String this.img,
    required String this.Atext,
    required String this.Etext,
    required String this.color,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                builder: (_) => ImageDialog(w, img),
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
    );
  }
}

Widget ImageDialog(w, img) {
  return Dialog(
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.circular(500),
    ),
    child: Container(
      width: w * .80,
      height: w * .80,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: ExactAssetImage('$img'),
        // fit: BoxFit.cover
      )),
    ),
  );
}
