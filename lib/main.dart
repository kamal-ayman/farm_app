import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:farm_app0/layout/home/home.dart';
import 'package:farm_app0/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SplashScreen()),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeFarm()));
    });
  }
  @override
  Widget build(BuildContext context) {
    // AssetsAudioPlayer.newPlayer().open(
    //   Audio("assets/voice/1.mp3"),
    //   autoStart: true,
    //   showNotification: false,
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLiquidFill(
              text: 'Smart Farm',
              waveColor: Colors.blueAccent,
              waveDuration: Duration(seconds: 1),
              loadDuration: Duration(seconds: 2),
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
