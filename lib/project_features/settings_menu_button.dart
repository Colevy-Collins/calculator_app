import 'package:flutter/material.dart';
import 'package:calculator/base_project/command.dart';

class SettingsWidget extends StatelessWidget {
  final Color currentColor;
  final Function(Color) onColorChange;

  const SettingsWidget({
    Key? key,
    required this.currentColor,
    required this.onColorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonText = currentColor == Colors.blue
        ? 'Change Menu Color to Purple'
        : 'Change Menu Color to Blue';
    Color nextColor = currentColor == Colors.blue ? Colors.purple : Colors.blue;

    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onColorChange(nextColor);
                Navigator.pop(context);
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}


class SettingsCommand implements Command {
  final VoidCallback onSettingsPressed;

  SettingsCommand({required this.onSettingsPressed});

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    onSettingsPressed();
    return [userQuestion, userAnswer];
  }
}

