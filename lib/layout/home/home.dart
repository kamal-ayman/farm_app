import 'package:farm_app0/modules/about_team_screen.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFarm extends StatefulWidget {
  @override
  _HomeFarmState createState() => _HomeFarmState();
}

class _HomeFarmState extends State<HomeFarm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.getData();
          return Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                cubit.widgetsScreen[cubit.index],
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
              // elevation: 50,
              child: ListView(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
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
                    title: Text(
                      'Default is ${cubit.Default ? 'ON' : 'OFF'}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    leading: cubit.Default
                        ? Icon(
                            Icons.power,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.wifi,
                            color: Colors.white,
                          ),
                    tileColor: !cubit.Default ? Colors.red : Colors.blue,
                    onTap: () {
                      cubit.update('default');
                      Navigator.pop(context);
                      cubit.changeIndex(cubit.index);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'About',
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(Icons.info),
                    selected: cubit.index == 2 ? true : false,
                    tileColor: Colors.white,
                    focusColor: Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
