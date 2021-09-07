import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                                          'Sensor_1',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(
                                        child: Icon(
                                          Icons.messenger_outline,
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
                                  // borderRadius: BorderRadiusDirectional.circular(18.0),

                                  // color: Colors.grey[200],
                                  borderRadius: BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(5),
                                      bottomEnd: Radius.circular(5)),
                                ),
                                child: Text('Sensor_0',
                                    style: TextStyle(fontSize: 16, color: Colors.white)),
                                height: cubit.anime?100:0,
                                // width: anime == false?width = 0:width = double.maxFinite,
                                padding: EdgeInsets.all(10),
                                duration: Duration(milliseconds: 500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  textFormView(
                      nameSensor: 'Sensor_1',
                      iconSensor: Icons.messenger_outline,
                      data: 'data',
                      anime: cubit.anime),
                  textFormView(
                      nameSensor: 'Sensor_2',
                      iconSensor: Icons.messenger_outline,
                      data: 'data',
                      anime: cubit.anime),
                ],
              ),
            );
          }),
    );
  }
}
