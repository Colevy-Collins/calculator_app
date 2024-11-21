import 'package:calculator/base_project/command_export.dart';
import 'package:calculator/project_features//command_export.dart';

class ButtonPad {
  List<List<String?>> _grid = [];
  final int maxHeight = 6; // Maximum number of rows
  final int maxWidth = 4; // Number of columns (fixed)
  List<String> basicButtons = ['%', '/', '9', '8', '7', '*', '6', '5', '4', '-', '3', '2', '1', '+', '0', '.', '=', '(', ')'];
  late Map<String, Command> commandMap;

  ButtonPad() {
    _initializeGrid();
    squareGrid();
  }

  // Initialize the grid with the provided buttons
  void _initializeGrid() {
    _grid = [['C', 'DEL', 'M+', 'Settings'],
              ['(', ')', '%', '/'],
              ['7', '8', '9', '*'],
              ['4', '5', '6', '-'],
              ['1', '2', '3', '+'],
              ['0', '.', 'ANS', '±'],
              ['x²', 'xʸ', 'π', 'log'],
              ['!', 'ln', 'e', '√'],
              ['sin', 'cos', 'tan', '='],
    ];

    // Initialize the command map
    commandMap = {
      'C': ClearCommand(),
      'DEL': DeleteCommand(),
      '=': CalculateCommand(),
      'ANS': ANSCommand(),
      //'√': SquareRootCommand(),
   //   'log': LogBase10Command(),
      //'x²': SquareCommand(),
      //'xʸ': PowerCommand(),
      //'±': PositiveNegativeCommand(),
      //'π': PiCommand(),
      //'!': FactorialCommand(),
      'ln': NaturalLogCommand(),
      'e': ECommand(),
      //'sin': SinCommand(),
      //'cos': CosCommand(),
      //'tan': TanCommand(),
      //'Settings': SettingsCommand(),
      //'M+': MemoryAddCommand(),
    };

    // Add commands for each number and operator
    for (var button in basicButtons) {
      if (!commandMap.containsKey(button)) {
        commandMap[button] = BasicCommand(button);
      }
    }

      // Add commands for any extra buttons
      for (var row in _grid) {
        for (String? button in row) {
          if (button != null && !commandMap.containsKey(button)) {
            commandMap[button] = BasicCommand('');
          }
        }
      }
    }

  List<String> pressedButton(String button, String userQuestion, String userAnswer) {
    if (commandMap.containsKey(button)) {
      List<String> result = commandMap[button]?.execute(
          userQuestion, userAnswer) ?? [userQuestion, userAnswer];
      return result;
    } else {
      return [userQuestion, userAnswer];
    }
  }

  // Get the current grid
  List<List<String?>> getGrid() {
    return _grid;
  }

 void squareGrid() {
    for (var row in _grid) {
      while(row.length < maxWidth) {
        row.add('');
      }
    }

    for (var row in _grid) {
      while(row.length < maxWidth) {
        row.add('');
      }
    }
  }

}
