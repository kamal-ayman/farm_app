import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/modules/contorl_screen.dart';
import 'package:farm_app0/modules/dashbord_screen.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool checkNet = false;

  int index = 0;
  List<Widget> widgetsScreen = [DashBordScreen(), ControlScreen()];
  List<String> widgetsName = ['DashBoard', 'Control'];
  bool c = true;

  void changeIndex(int index) {
    this.index = index;
    emit(AppChangeBottomNavBarState());
  }

  final firebase = FirebaseFirestore.instance.collection('farm');
  final DatabaseReference db = FirebaseDatabase.instance.reference();

  var data;
  bool Default = false;
  bool pumpPower = false;
  bool ultraSonicPower = false;
  String airHumidity = '';
  String temperature = '';
  String warningSystem = '';
  String waterHumidity = '';

  getData() => db.once().then((DataSnapshot snap) {
        this.data = snap.value;
        print(snap.value);
        data['default'] == 'on' ? Default = true : Default = false;
        data['power']['pump'] == 'on' ? pumpPower = true : pumpPower = false;
        data['power']['ultraSonic'] == 'on'
            ? ultraSonicPower = true
            : ultraSonicPower = false;
        airHumidity = data['data']['airHumidity'];
        temperature = data['data']['temperature'];
        warningSystem = data['data']['warningSystem'];
        waterHumidity = data['data']['waterHumidity'];
        emit(AppGetDataState());
      });

  update(String sensor) {
    try {
      if (sensor == 'default')
        db.update({'default': '${data['default'] == 'on' ? 'off' : 'on'}'});
      else if (sensor == 'ultra')
        db.update({
          'power/ultraSonic':
              '${data['power']['ultraSonic'] == 'on' ? 'off' : 'on'}'
        });
      else if (sensor == 'pump')
        db.update(
            {'power/pump': '${data['power']['pump'] == 'on' ? 'off' : 'on'}'});
    } catch (err) {}
    emit(AppUpdateDataState());
    getData();
  }

  setData() {
    db.update({'data/airHumidity': 'ok'});
    db.update({'data/waterHumidity': 'ok'});
    db.update({'data/temperature': 'ok'});
    db.update({'data/warningSystem': 'ok'});
    db.update({'power/ultraSonic': 'ok'});
    db.update({'power/pump': 'ok'});
  }

  checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        checkNet = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      checkNet = false;
    }
    emit(AppLostConnection());
  }
}
