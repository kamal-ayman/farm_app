import 'package:farm_app0/shared/components/components.dart';
import 'package:flutter/material.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: defaultButton(
                  text: 'Sensor_0',
                  onPressed: () {
                    print('hello');
                  },
                  colorIcon: Colors.green,
                  isOn: false)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              color: Colors.grey,
              height: 0.5,
            ),
          ),
          Expanded(
              child: defaultButton(
                  text: 'Sensor_1',
                  onPressed: () {},
                  colorIcon: Colors.green,
                  isOn: false)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              color: Colors.grey,
              height: 0.5,
            ),
          ),
          Expanded(
              child: defaultButton(
                  text: 'Sensor_2',
                  onPressed: () {},
                  colorIcon: Colors.white,
                  isOn: false)),
        ],
      ),
    );
  }
}
