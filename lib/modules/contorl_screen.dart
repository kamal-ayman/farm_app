import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: cubit.firebase.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var power = snapshot.data!.docs[1];
          return Column(
            children: [
              Expanded(
                  child: defaultButton(
                      text: 'ultraSonic',
                      onPressed: () {
                        cubit.update('s1', power['s1'] == 'on' ? 'off' : 'on');
                      },
                      colorIcon: power['s1'] == 'on'?Colors.green: Colors.grey,
                      isOn: power['s1'] == 'on' ? true : false)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  color: Colors.grey,
                  height: 0.5,
                ),
              ),
              Expanded(
                  child: defaultButton(
                      text: 'water',
                      onPressed: () {
                        cubit.update('s2', power['s2'] == 'on' ? 'off' : 'on');
                      },
                      colorIcon: power['s2'] == 'on'?Colors.green: Colors.grey,
                      isOn: power['s2'] == 'on' ? true : false)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  color: Colors.grey,
                  height: 0.5,
                ),
              ),
              Expanded(
                  child: defaultButton(
                      text: 'اي حاجة 😂',
                      onPressed: () {
                        cubit.update('s3', power['s3'] == 'on' ? 'off' : 'on');
                      },
                      colorIcon: power['s3'] == 'on'?Colors.green: Colors.grey,
                      isOn: power['s3'] == 'on' ? true : false)),
            ],
          );
          snapshot.data!.docs.map(
            (farm) {},
          );
        },
      ),
    );
  }
}
