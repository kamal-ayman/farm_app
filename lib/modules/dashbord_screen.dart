import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                defaultInfo(
                  width: w,
                  img: 'assets/img/ico/temp.png',
                  dataName: 'Temperature',
                  dataValue: '${cubit.temperature}',
                  typeName: '°',
                  typeSize: 10,
                ),
                defaultInfo(
                  width: w,
                  img: 'assets/img/ico/warning.png',
                  dataName: 'Warning System',
                  dataValue: '  ${cubit.warningSystem}',
                  typeName: 'cm',
                  typeSize: 15,
                ),
              ],
            ),
            SizedBox(
              height: h * .04,
            ),
            Row(
              children: [
                defaultInfo(
                  width: w,
                  img: 'assets/img/ico/air.png',
                  dataName: 'Humidity Air',
                  dataValue: '${cubit.airHumidity}',
                  typeName: '%',
                  typeSize: 15,
                ),
                defaultInfo(
                  width: w,
                  img: 'assets/img/ico/water.png',
                  dataName: 'Humidity Soil',
                  dataValue: '${cubit.soilHumidity}',
                  typeName: '%',
                  typeSize: 15,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
