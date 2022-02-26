import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:farm_app0/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AlarmSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetsAudioPlayer alert = AssetsAudioPlayer.newPlayer();
    alert.open(
      Audio("assets/alert/alert2.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
      volume: .1,
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                      alert.stop();
                      isAlert = false;
                      Navigator.pop(context);
                    },
                    color: HexColor('e95c61'),
                    // elevation: 0,
                    textColor: Colors.white,
                    height: 45,
                    highlightColor: HexColor('e95c61'),
                    // highlightElevation: 0,
                  )),
                ],
              ),
            )
          ],
        ),
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
