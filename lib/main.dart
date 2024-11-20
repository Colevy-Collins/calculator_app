import 'package:flutter/material.dart';
import 'package:calculator/base_project/command_export.dart';
import 'package:calculator/project_features/command_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

  final List<List<String?>> buttons = ButtonPad().getGrid();

  void pressedButton(String button) {
    List<String> result = ButtonPad().pressedButton(button, userQuestion, userAnswer);
    setState(() {
      userQuestion = result[0];
      userAnswer = result[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(children: [
        // Q and A
     Expanded(
  flex: 1,
  child: Container(
    padding: EdgeInsets.only(left: 5, right: 5, top: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  key: Key('userQuestion'),
                  userQuestion,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  key: Key('userAnswer'),
                  userAnswer,
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
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
