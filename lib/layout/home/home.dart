import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Farm App - ${cubit.widgetsName[cubit.index]}'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
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
                cubit.changeIndex(value);
                cubit.Anime(value.isEven);
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
              onPressed: () {
                // Add your onPressed code here!
              },
              label: const Text('Connect'),
              icon: const Icon(Icons.cloud),
              backgroundColor: Colors.green,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
