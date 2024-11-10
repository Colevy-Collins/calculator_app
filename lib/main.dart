import 'package:flutter/material.dart';
import 'package:calculator/base_project/command_export.dart';
import 'package:calculator/project_features/command_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userQuestion = '';
  String userAnswer = '';
  Color menuColor = Colors.deepPurple; // Default color for the menu

  final List<List<String?>> buttons = ButtonPad().getGrid();

  void pressedButton(String button) {
    if (button == 'Settings') {
      _openSettingsMenu();
    } else {
      List<String> result = ButtonPad().pressedButton(button, userQuestion, userAnswer);
      setState(() {
        userQuestion = result[0];
        userAnswer = result[1];
      });
    }
  }

  void _openSettingsMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String buttonText = menuColor == Colors.blue ? 'Change Menu Color to Purple' : 'Change Menu Color to Blue';
        Color nextColor = menuColor == Colors.blue ? Colors.purple : Colors.blue;

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Settings Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      menuColor = nextColor; // Update the menu color
                    });
                    Navigator.pop(context);
                  },
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuColor.withOpacity(0.2), // Apply menu color to background for effect
      body: Column(children: [
        // Q and A
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 75),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        userQuestion,
                        style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userAnswer,
                        style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        ),
                      ),
                    ],
                  )
                ]),
            height: 200,
          ),
        ),

        // Buttons with AspectRatio for consistent sizing
        Expanded(
          flex: 2,
          child: LayoutBuilder(
            builder: (context, constraints) {
              int rows = buttons.length; // Number of rows in the grid
              int columns = buttons[0].length; // Number of columns in the grid
              double buttonWidth = constraints.maxWidth / columns; // Adjust width based on columns
              double buttonHeight = constraints.maxHeight / rows; // Adjust height based on rows

              return GridView.builder(
                itemCount: rows * columns, // Total buttons count
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns, // Use dynamic column count
                  childAspectRatio: buttonWidth / buttonHeight,
                ),
                itemBuilder: (context, index) {
                  // Calculate the row and column
                  int row = index ~/ columns; // Integer division to get row
                  int col = index % columns; // Modulo to get column
                  String buttonLabel = buttons[row][col] ??
                      ''; // Provide a default empty string if null

                  return AspectRatio(
                    aspectRatio: 1, // Ensures the buttons are square
                    child: MyButton(
                      child: buttonLabel, // Button label
                      buttonColor: Colors.deepPurple[100],
                      textColor: Colors.black,
                      function: () {
                        pressedButton(buttonLabel);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
