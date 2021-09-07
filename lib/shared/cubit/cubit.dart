import 'package:bloc/bloc.dart';
import 'package:farm_app0/modules/contorl_screen.dart';
import 'package:farm_app0/modules/dashbord_screen.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool anime = true;
  int index = 0;
  List<Widget> widgetsScreen = [DashBordScreen(), ControlScreen()];
  List<String> widgetsName = ['DashBoard', 'Control'];

  void changeIndex(int index) {
    this.index = index;

    emit(AppChangeBottomNavBarState());
  }

  void Anime(bool anime) {
    this.anime = anime;
    print(anime);
    emit(AppChangeAnimeState());
  }
}
