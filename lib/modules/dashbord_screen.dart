
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBordScreen extends StatefulWidget {
  @override
  _DashBordScreenState createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.checkNetwork();
          cubit.getData();
          // cubit.setData();

          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: Stack(
              children: [
                Image.asset(
                  'assets/img/screen/dashboard.png',
                  width: w,

                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 190, right: 40.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '${cubit.checkNet ? 'Connected' : 'Disconnect'}',
                                  style: TextStyle(
                                      color: cubit.checkNet
                                          ? Colors.white
                                          : Colors.red,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/img/ico/cloud.png',
                            width: 50,
                            height: 50,
                            color: cubit.checkNet ? Colors.white : Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 250, left: 10, right: 10, bottom: 10.0),
                    child: Column(
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
                              typeSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: w * .04,),
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
                    ),
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
