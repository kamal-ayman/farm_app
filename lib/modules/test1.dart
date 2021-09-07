import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final firebase = FirebaseFirestore.instance.collection('farm');

  update(s) {
    try {
      firebase.doc('sensor').update({s: 'on'});
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    update('s2');
                  },
                  child: Text(
                    'update',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: firebase.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print('${snapshot.data!.docs[0]['s3']}');
                    return Center(child: Container(child: Text('${snapshot.data!.docs[0]['s3']}'),));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
