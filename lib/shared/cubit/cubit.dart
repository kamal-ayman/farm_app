import 'dart:async';
import 'dart:io';
import 'package:farm_app0/modules/alert_screen.dart';
import 'package:farm_app0/modules/contorl_screen.dart';
import 'package:farm_app0/modules/dashbord_screen.dart';
import 'package:farm_app0/network/local/cache_helper.dart';
import 'package:farm_app0/shared/components/constants.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/data_model.dart';

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

  final DatabaseReference db = FirebaseDatabase.instance.reference();

  // var data;
  bool Default = false;
  bool pumpPower = false;
  bool ultraSonicPower = false;
  String airHumidity = '';
  String temperature = '';
  String warningSystem = '';
  String soilHumidity = '';
  DataModel? data;

  getData() {
    if (checkNet) {
      db.once().then((DataSnapshot snap) {
        data = DataModel.fromJson(snap.value as Map<dynamic, dynamic>);
        data!.power!.Default == 'on' ? Default = true : Default = false;
        data!.power!.pump == 'on' ? pumpPower = true : pumpPower = false;
        data!.power!.ultraSonic == 'on'
            ? ultraSonicPower = true
            : ultraSonicPower = false;
        airHumidity = data!.data!.airHumidity!;
        temperature = data!.data!.temperature!;
        soilHumidity = data!.data!.soilHumidity!;
        warningSystem = data!.data!.warningSystem!;
        try {
          warningSystemDistance = int.parse(warningSystem);
        } catch (e) {}
        emit(AppGetDataState());
      });
    }
  }

  update(String sensor) {
    if (checkNet) {
      if (sensor == 'default')
        db.update({
          'power/default': '${data!.power!.Default == 'on' ? 'off' : 'on'}'
        });
      else if (sensor == 'ultra')
        db.update({
          'power/ultraSonic':
              '${data!.power!.ultraSonic == 'on' ? 'off' : 'on'}'
        });
      else if (sensor == 'pump')
        db.update(
            {'power/pump': '${data!.power!.pump == 'on' ? 'off' : 'on'}'});
      emit(AppUpdateDataState());
    }
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
    emit(AppConnectionState());
  }

  checkWarning(context) {
    if (ultraSonicPower && !Default || Default) {
      try {
        if (distance >= int.parse(warningSystem) && !isAlert) {
          isAlert = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlarmSettingScreen(),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
