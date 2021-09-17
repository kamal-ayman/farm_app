import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/modules/test1.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          // cubit.setData();
          cubit.getData();
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: defaultButton(
                    text: 'Water is ${cubit.data == null ? '' : {
                        cubit.data['power']['pump']
                      }.toList()[0]}',
                    onPressed: () {
                      cubit.update(
                          'power/pump', '${cubit.data['power']['pump']}');
                    },
                    isOn: cubit.data == null
                        ? false
                        : cubit.data['power']['pump'] == 'on'
                            ? true
                            : false,
                    colorIcon: cubit.data == null
                        ? Colors.grey
                        : cubit.data['power']['pump'] == 'on'
                            ? Colors.green
                            : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    color: Colors.grey,
                    height: 0.5,
                  ),
                ),
                Expanded(
                  child: defaultButton(
                    text: 'ultraSonic is ${cubit.data == null ? '' : {
                        cubit.data['power']['ultraSonic']
                      }.toList()[0]}',
                    onPressed: () {
                      cubit.update('power/ultraSonic',
                          '${cubit.data['power']['ultraSonic']}');
                    },
                    isOn: cubit.data == null
                        ? false
                        : cubit.data['power']['ultraSonic'] == 'on'
                            ? true
                            : false,
                    colorIcon: cubit.data == null
                        ? Colors.grey
                        : cubit.data['power']['ultraSonic'] == 'on'
                            ? Colors.green
                            : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    color: Colors.grey,
                    height: 0.5,
                  ),
                ),
                Expanded(
                  child: defaultButton(
                    text: 'Water is ${cubit.data == null ? '' : {
                        cubit.data['power']['pump']
                      }.toList()[0]}',
                    onPressed: () {
                      cubit.update(
                          'power/pump', '${cubit.data['power']['pump']}');
                    },
                    isOn: cubit.data == null
                        ? false
                        : cubit.data['power']['pump'] == 'on'
                            ? true
                            : false,
                    colorIcon: cubit.data == null
                        ? Colors.grey
                        : cubit.data['power']['pump'] == 'on'
                            ? Colors.green
                            : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
