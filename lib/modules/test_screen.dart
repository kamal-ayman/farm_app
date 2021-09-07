import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApp extends StatefulWidget {
  @override
  _FireStoreAppState createState() => _FireStoreAppState();
}

class _FireStoreAppState extends State<FireStoreApp> {
  final textController = TextEditingController();

  List<String> sensors = ['s1', 's2', 's3'];
  @override
  Widget build(BuildContext context) {
    CollectionReference farm = FirebaseFirestore.instance.collection('farm');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
              stream: farm.orderBy('Sensor').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading'));
                }
                return Row(
                  children: snapshot.data!.docs.map((farm) {
                    return Center(
                      child: ListTile(
                        title: Text(farm['s1']),
                        onLongPress: () {
                          farm.reference.delete();
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            // farm.doc('sensor').update({'s1': 's1 i'});
            farm.doc().update({'name': textController.text});
            textController.clear();
          },
        ),
      ),
    );
  }
}
