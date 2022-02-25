import 'dart:async';

import 'package:farm_app0/modules/about_screens/about_team_screen.dart';
import 'package:farm_app0/modules/settings_screen/settings_screen.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeFarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final p = MediaQuery.of(context).padding.top;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        Timer(Duration(seconds: 1), () {
          cubit.checkNetwork();
          cubit.getData();
        });
        return Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              Container(color: [HexColor('#ffad2b'),HexColor('#1693dc')][cubit.index], width: w, height: p,),
              Transform.translate(
                offset: Offset(0, p),
                child: Image.asset(
                  [
                    'assets/img/screen/dashboard.png',
                    'assets/img/screen/control.png',
                  ][cubit.index],
                  width: w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: p),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ['Dashboard', 'Control'][cubit.index],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * .25 + p, right: w * .08),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Container(
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.45),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                        Transform.translate(
                          offset: Offset(0, -2),
                          child: Image.asset(
                            'assets/img/ico/cloud.png',
                            width: 50,
                            height: 50,
                            color: cubit.checkNet ? Colors.white : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: cubit.widgetsScreen[cubit.index]),
              ),
              Padding(
                padding: EdgeInsets.only(top: p/2, left: p/2),
                child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: Transform.translate(
              offset: Offset(0, -p),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(color: Colors.blue,height: p,),
                  Container(
                    color: Colors.blue,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios_outlined),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 187,
                          child: DrawerHeader(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    radius: 50,
                                    child: Image.asset(
                                      'assets/img/ico/team.png',
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: new Border.all(
                                      color: Colors.white,
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,),
                                  child: Text(
                                    'Venoms',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard_outlined),
                    selected: cubit.index == 0 ? true : false,
                    tileColor: Colors.white,
                    title: Text(
                      'DashBoard',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      cubit.changeIndex(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Control',
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(Icons.contactless_outlined),
                    selected: cubit.index == 1 ? true : false,
                    tileColor: Colors.white,
                    onTap: () {
                      cubit.changeIndex(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.navigate_next_rounded),
                      ],
                    ),
                    leading: Icon(Icons.settings_outlined),
                    tileColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.navigate_next_rounded),
                      ],
                    ),
                    leading: Icon(Icons.info),
                    selected: cubit.index == 3 ? true : false,
                    tileColor: Colors.white,
                    focusColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutScreen()),
                      );
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
