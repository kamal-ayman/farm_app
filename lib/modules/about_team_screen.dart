import 'package:farm_app0/layout/home/home.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            cubit.getData();
            return Scaffold(
              // backgroundColor: Colors.grey[200],
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(30),
                              // color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              300)),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/img/team.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Red team',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Material(
                        elevation: 5,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadiusDirectional.circular(30),
                        child: Container(
                          height: 380,
                          width: 340,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: defaultTextView(
                                      name: 'nour',
                                      image: 'assets/img/team.png')),
                              Expanded(
                                  child: defaultTextView(
                                      name: 'kamal',
                                      image: 'assets/img/team.png')),
                              Expanded(
                                  child: defaultTextView(
                                      name: 'moamen',
                                      image: 'assets/img/team.png')),
                              Expanded(
                                  child: defaultTextView(
                                      name: 'mohamed',
                                      image: 'assets/img/team.png')),
                              Expanded(
                                  child: defaultTextView(
                                      name: 'el bet eman ',
                                      image: 'assets/img/team.png')),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                elevation: 5,

                                borderRadius:
                                BorderRadiusDirectional.circular(30.0),
                                color: Colors.blue,
                                child: Container(
                                  height: 50,
                                  // width: 100,
                                  // decoration: BoxDecoration(
                                  //   color: Colors.blue,
                                  //   // borderRadius:
                                  //   //     BorderRadiusDirectional.circular(30.0),
                                  // ),
                                  child: MaterialButton(

                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeFarm(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Thank you'.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(30.0),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
