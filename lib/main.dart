import 'dart:async';
import 'package:farm_app0/layout/home/home.dart';
import 'package:farm_app0/shared/bloc_observer.dart';
import 'package:farm_app0/shared/components/constants.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  try {
    distance = CacheHelper.getData(key: 'distance');
  } catch (e) {
    CacheHelper.saveData(key: 'distance', value: 0);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
      statusBarIconBrightness: Brightness.light,
    ));
    return BlocProvider(
      create: (context) => AppCubit()..getData()..checkNetwork(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeFarm(),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool start = false;
  bool start1 = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeFarm()));
    });
    Timer(Duration(milliseconds: 0), () {
      setState(() {
        start = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        start1 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * .8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            transform: Matrix4.translationValues(start ? 0 : 400, 0, 0),
            curve: Curves.fastLinearToSlowEaseIn,
            height: w,
            width: start1 ? w : w * .8,
            child: Image.asset(
              'assets/img/launch_icon/icon.png',
            ),
          ),
          SizedBox(
            height: w / 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: LinearProgressIndicator(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
