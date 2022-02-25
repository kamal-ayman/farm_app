import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
        );
      },
    );
  }
}
