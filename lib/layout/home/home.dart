import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:farm_app0/modules/dashbord_screen.dart';
import 'package:farm_app0/modules/settings_screen.dart';
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
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.checkNetwork();
          return Scaffold(
            appBar: AppBar(
              title: Text('Farm App - ${cubit.widgetsName[cubit.index]}'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingScreen()));
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
              backgroundColor: Colors.green[400],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/img/wall1.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  child: cubit.widgetsScreen[cubit.index],
                  color: Color.fromRGBO(0, 0, 0, 150),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              onTap: (value) {
                cubit.getData();
                cubit.changeIndex(value);
              },
              currentIndex: cubit.index,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard_outlined),
                    title: Text('DashBord')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contactless_outlined),
                    title: Text('Control')),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              label: Text('${!cubit.checkNet ? 'Disconnected' : 'Connected'}'),
              icon: Icon(!cubit.checkNet ? Icons.cloud_off : Icons.cloud),
              backgroundColor: !cubit.checkNet ? Colors.red : Colors.green,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
