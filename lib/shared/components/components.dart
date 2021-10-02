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
}) =>
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 165,
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
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
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
                        height: 55,
                        width: 55,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$dataName',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            '$dataValue',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '$typeName',
                          style: TextStyle(fontSize: typeSize),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget defaultPower(
        {required String imgName,
        required String powerName,
        required String statePower,
        required Color powerColor,
        required Color textColor,
        required onPressed}) =>
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
          // height: 165,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
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
                            'assets/img/$imgName.png',
                            height: 55,
                            width: 55,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$powerName',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                      Text(
                        '$statePower'.toUpperCase(),
                        style: TextStyle(fontSize: 28, color: textColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

Widget aboutName({
  required String Name,
  required String img,
  required String hexColor,
}) => Container(
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
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: HexColor(hexColor),
                borderRadius: BorderRadius.circular(50),
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
                  '$img',
                  height: 55,
                  width: 55,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '$Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: HexColor(hexColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: HexColor(hexColor),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );




