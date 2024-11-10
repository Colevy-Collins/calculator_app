import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final Function(Color) onColorChange;

  const SettingsWidget({Key? key, required this.onColorChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              onColorChange(Colors.blue);
            },
            child: Text('Change Menu Color to Blue'),
          ),
        ],
      ),
    );
  }
}
