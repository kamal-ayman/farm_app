import 'package:farm_app0/network/local/cache_helper.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/components/constants.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Settings'),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    defaultPower(
                        powerName: 'Default',
                        textColor: Colors.white,
                        statePower: '${cubit.Default ? 'ON' : 'OFF'}',
                        imgName: '',
                        onPressed: () {
                          cubit.update('default');
                        },
                        powerColor: cubit.Default ? Colors.blue : Colors.red,
                        width: width,
                        iconPower: cubit.Default ? Icons.power : Icons.wifi),
                  ],
                ),
                Row(
                  children: [
                    defaultPower(
                      powerName: 'Change Alarm',
                      textColor: Colors.white,
                      statePower: '',
                      imgName: '',
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => alarmSetDialog(width, cubit, context),
                        );
                      },
                      powerColor: Colors.amber.shade900,
                      width: width,
                      iconPower: Icons.warning_amber_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget alarmSetDialog(w, AppCubit cubit, context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 130,
          child: Column(
            children: [
              defaultTextForm(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.text = "";
                        Navigator.pop(context);
                      },
                      child: Text(
                        'cancel',
                        style: TextStyle(fontSize: 17, color: Colors.red),
                      )),
                  TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          distance = int.parse(controller.text);
                          CacheHelper.saveData(key: 'distance', value: distance);
                          Navigator.pop(context);
                          controller.text = "";
                        }
                      },
                      child: Text(
                        'ok',
                        style: TextStyle(fontSize: 17, color: Colors.green),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultTextForm() {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: (s) {
          if (s!.isEmpty) {
            return 'Enter a number';
          }
          try {
            if (int.parse(s) > 1000) {
              return 'number must between 1 to 1000';
            }
          } catch (e) {
            return 'must enter a number!';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Enter Distance(CM)',
          prefixIcon: Icon(Icons.social_distance_rounded),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
