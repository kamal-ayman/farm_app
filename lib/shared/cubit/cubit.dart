import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/modules/contorl_screen.dart';
import 'package:farm_app0/modules/dashbord_screen.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<Widget> widgetsScreen = [DashBordScreen(), ControlScreen()];
  List<String> widgetsName = ['DashBoard', 'Control'];

  void changeIndex(int index) {
    this.index = index;
    emit(AppChangeBottomNavBarState());
  }

  final firebase = FirebaseFirestore.instance.collection('farm');

  update(String nameSensor,String power) {
    try {
      firebase.doc('sensor').update({nameSensor: power});
    } catch (err) {
      print(err);
    }
  }
}
