import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'command.dart';
import 'clear_command.dart';
import 'delete_command.dart';
import 'calculate_command.dart';
import 'basic_command.dart';

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
  late Map<String, Command> commandMap;

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', '*',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the command map
    commandMap = {
      'C': ClearCommand(),
      'DEL': DeleteCommand(),
      '=': CalculateCommand(),
    };

    // Add commands for each number and operator
    for (String button in buttons) {
      if (!commandMap.containsKey(button)) {
        commandMap[button] = BasicCommand(button);
      }
    }
  }

  void pressedButton(String button) {
    if (commandMap.containsKey(button)) {
      List<String> result = commandMap[button]?.execute(userQuestion, userAnswer) ?? [userQuestion, userAnswer];
      setState(() {
        userQuestion = result[0];
        userAnswer = result[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
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
              double buttonWidth = constraints.maxWidth / 4; // 4 columns
              double buttonHeight = constraints.maxHeight / 5; // 5 rows

              return GridView.builder(
                itemCount: buttons.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: buttonWidth / buttonHeight,
                ),
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1, // Ensures the buttons are square
                    child: MyButton(
                      child: buttons[index], //button label
                      buttonColor: Colors.deepPurple[100],
                      textColor: Colors.black,
                      function: () {
                        pressedButton(buttons[index]);
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
