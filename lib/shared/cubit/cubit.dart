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

  void changeIndex(int index) {
    this.index = index;
    emit(AppChangeBottomNavBarState());
  }

  final firebase = FirebaseFirestore.instance.collection('farm');
  final DatabaseReference db = FirebaseDatabase.instance.reference();

  var data;

  getData() => db.once().then((DataSnapshot snap) {
        this.data = snap.value;
        print(snap.value);
        emit(AppGetDataState());
      });

  update(String path, var data) {
    try {
      db.update({'$path': '${data == 'on' ? 'off' : 'on'}'});
    } catch (err) {}
    emit(AppUpdateDataState());
    getData();
  }

  setData() {
    db.update({'power/pump': 'on'});
    db.update({'power/ultraSonic': 'on'});
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
