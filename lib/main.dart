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
  Color menuColor = Colors.deepPurple;

  late final ButtonPad buttonPad;

  @override
  void initState() {
    super.initState();
    buttonPad = ButtonPad(onSettingsPressed: _openSettingsMenu);
  }

  void pressedButton(String button) {
    List<String> result = buttonPad.pressedButton(button, userQuestion, userAnswer);
    setState(() {
      userQuestion = result[0];
      userAnswer = result[1];
    });
  }

  void _openSettingsMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SettingsWidget(
          currentColor: menuColor,
          onColorChange: (Color newColor) {
            setState(() {
              menuColor = newColor; // Update the menu color
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuColor.withOpacity(0.2), // Apply menu color to background for effect
      body: Column(
        children: [
          // Q and A
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double fontSize = constraints.maxHeight * 0.2; // Adjust font size based on available height
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Flexible(child:
                          Text(
                            key: const Key('userQuestion'),
                            userQuestion,
                            style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                            ),
                          ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(child:
                          Text(
                            key: const Key('userAnswer'),
                            userAnswer,
                            style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                            ),
                          ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          // Buttons with AspectRatio for consistent sizing
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int rows = buttonPad.getGrid().length; // Number of rows in the grid
                int columns = buttonPad.getGrid()[0].length; // Number of columns in the grid
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
                    int row = index ~/ columns; // Integer division to get row
                    int col = index % columns; // Modulo to get column
                    String buttonLabel = buttonPad.getGrid()[row][col] ?? '';

                    return AspectRatio(
                      aspectRatio: 1, // Ensures the buttons are square
                      child: MyButton(
                        child: buttonLabel, // Button label
                        buttonColor: Colors.deepPurple[100]!, // Button color
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
        ],
      ),
    );
  }
}

