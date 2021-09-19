import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

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
          color: !disable?Colors.black54.withOpacity(.7):Colors.red.withOpacity(.7),
          borderRadius: BorderRadiusDirectional.circular(18.0),
        ),
        child: MaterialButton(
          onPressed:onPressed,
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
                      fontSize: 20,
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
                              fontSize: 25,
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
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  height: anime?100:0,
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
}) =>Padding(
  padding:
  const EdgeInsets.symmetric(horizontal: 15.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius:
            BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0),
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