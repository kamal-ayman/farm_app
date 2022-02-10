import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        // cubit.setData();
        cubit.checkNetwork();
        cubit.getData();
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Stack(
            children: [
              Image.asset(
                'assets/img/screen/control.png',
                fit: BoxFit.cover,
                width: w,
              ),
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Control',
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
              Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 250, left: 30, right: 30, bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            defaultPower(
                              width: w,
                              imgName: 'water_power',
                              powerName: 'Pump Water',
                              statePower:
                                  '${cubit.Default ? 'Disable' : cubit.pumpPower ? 'on' : 'off'}',
                              powerColor: cubit.Default
                                  ? Colors.grey
                                  : cubit.pumpPower
                                      ? Colors.blue
                                      : Colors.white,
                              textColor: cubit.Default
                                  ? Colors.white
                                  : cubit.pumpPower
                                      ? Colors.white
                                      : Colors.blue,
                              onPressed: () {
                                cubit.Default ? null : cubit.update('pump');
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            defaultPower(
                              width: w,
                              imgName: 'warning',
                              powerName: 'Warning System',
                              statePower:
                                  '${cubit.Default ? 'Disable' : cubit.ultraSonicPower ? 'on' : 'off'}',
                              powerColor: cubit.Default
                                  ? Colors.grey
                                  : cubit.ultraSonicPower
                                      ? Colors.red
                                      : Colors.white,
                              textColor: cubit.Default
                                  ? Colors.white
                                  : cubit.ultraSonicPower
                                      ? Colors.white
                                      : Colors.red,
                              onPressed: () {
                                cubit.Default ? null : cubit.update('ultra');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
