import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBordScreen extends StatefulWidget {
  @override
  _DashBordScreenState createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: cubit.firebase.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    var data = snapshot.data!.docs[0];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textFormView(
                          nameSensor: 'ultraSonic',
                          iconSensor: Icons.messenger_outline,
                          data: '${data['d1']}',
                        ),
                        textFormView(
                          nameSensor: 'water',
                          iconSensor: Icons.messenger_outline,
                          data: '${data['d2']}',
                        ),
                        textFormView(
                          nameSensor: 'اي حاجة برضو😂',
                          iconSensor: Icons.messenger_outline,
                          data: '${data['d3']}',
                        ),
                      ],
                    );
                  }),
            );
          }),
    );
  }
}
