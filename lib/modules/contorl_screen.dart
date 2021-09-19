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
                    text:
                        '${cubit.Default ? 'Disabled' : 'Water is ${cubit.pumpPower ? 'on' : 'off'}'}',
                    onPressed: () {
                      cubit.Default ? null : cubit.update('pump');
                    },
                    isOn: cubit.Default ? false : cubit.pumpPower,
                    colorIcon: cubit.Default
                        ? Colors.grey
                        : cubit.pumpPower
                            ? Colors.green
                            : Colors.grey,
                    disable: cubit.Default,
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
                    text:
                        '${cubit.Default ? 'Disabled' : 'ultraSonic is ${cubit.ultraSonicPower ? 'on' : 'off'}'}',
                    onPressed: () {
                      cubit.Default ? null : cubit.update('ultra');
                    },
                    isOn: cubit.Default ? false : cubit.ultraSonicPower,
                    colorIcon: cubit.Default
                        ? Colors.grey
                        : cubit.ultraSonicPower
                            ? Colors.green
                            : Colors.grey,
                    disable: cubit.Default,
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
                    text:
                        '${cubit.Default ? 'Disabled' : 'Water is ${cubit.pumpPower ? 'on' : 'off'}'}',
                    onPressed: () {
                      cubit.Default ? null : cubit.update('pump');
                    },
                    isOn: cubit.Default ? false : cubit.pumpPower,
                    colorIcon: cubit.Default
                        ? Colors.grey
                        : cubit.pumpPower
                            ? Colors.green
                            : Colors.grey,
                    disable: cubit.Default,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    color: Colors.grey,
                    height: 0.5,
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
