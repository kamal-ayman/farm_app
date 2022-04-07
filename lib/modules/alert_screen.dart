import 'package:torch_light/torch_light.dart';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:farm_app0/shared/components/constants.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibration/vibration.dart';
import 'package:volume_control/volume_control.dart';

class AlarmSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetsAudioPlayer alert = AssetsAudioPlayer.newPlayer();
    AssetsAudioPlayer descriptionAlert = AssetsAudioPlayer.newPlayer();
    alert.open(
      Audio("assets/alert/alert2.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
      volume: 1,
    );
    descriptionAlert.open(
      Audio("assets/alert/alert3.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
      volume: 1,
    );

    valueControl();
    bool control = true;

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (control) {
            setFlashlight(control);
            Vibration.vibrate(duration: 500);
            control = false;
            setFlashlight(control);
            Timer(Duration(milliseconds: 1000), () {
              control = true;
            });
          }
          VolumeControl.setVolume(1);

          return Scaffold(
            backgroundColor: HexColor('e7464c'),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          circularContainer('e9565c', 150),
                          circularContainer('e95c61', 110),
                          Image(
                            width: 60,
                            height: 60,
                            image: AssetImage('assets/img/ico/alert.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('Alert'.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                Spacer(),
                Text('$warningSystemDistance cm from the house',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: MaterialButton(
                        child: Text(
                          'Click to unlock for 5 minutes',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Vibration.cancel();
                          setFlashlight(false);
                          alert.stop();
                          descriptionAlert.stop();
                          VolumeControl.setVolume(_val);
                          Timer(Duration(seconds: 10), () {
                            isAlert = false;
                          });
                          Navigator.pop(context);
                        },
                        color: HexColor('e95c61'),
                        textColor: Colors.white,
                        height: 45,
                        highlightColor: HexColor('e95c61'),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget circularContainer(String color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: HexColor(color),
        borderRadius: BorderRadius.circular(1000),
      ),
    );
  }
}

Future<void> setFlashlight(control) async {
  if (control) {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      // Handle error
    }
  } else {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      // Handle error
    }
  }
}

double _val = 0;
Future<void> valueControl() async {
  _val = await VolumeControl.volume;
  VolumeControl.setVolume(1);
}