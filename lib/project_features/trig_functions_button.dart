import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/base_project/command.dart';

class SinCommand implements Command {
  final Command CalculateCommand;

  SinCommand(this.CalculateCommand);

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    List<String> calcResult = CalculateCommand.execute(userQuestion, userAnswer);
    String evaluatedAnswer = calcResult[1];

    double? value = double.tryParse(evaluatedAnswer);
    if (value == null) {
      return [userQuestion, 'Error: Invalid input'];
    }

    // Required to be in radians.
    double radians = value * (3.141592653589793 / 180);

    try {
      Parser p = Parser();
      Expression exp = p.parse('sin($radians)');
      ContextModel cm = ContextModel();
      String result = exp.evaluate(EvaluationType.REAL, cm).toString();
      return [userQuestion, result];
    } catch (e) {
      return [userQuestion, 'Error: Calculation error'];
    }
  }
}

class CosCommand implements Command {
  final Command CalculateCommand;

  CosCommand(this.CalculateCommand);

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    List<String> calcResult = CalculateCommand.execute(userQuestion, userAnswer);
    String evaluatedAnswer = calcResult[1]; // The evaluated result

    double? value = double.tryParse(evaluatedAnswer);
    if (value == null) {
      return [userQuestion, 'Error: Invalid input'];
    }

    // Required to be in radians.
    double radians = value * (3.141592653589793 / 180);

    try {
      Parser p = Parser();
      Expression exp = p.parse('cos($radians)');
      ContextModel cm = ContextModel();
      String result = exp.evaluate(EvaluationType.REAL, cm).toString();
      return [userQuestion, result];
    } catch (e) {
      return [userQuestion, 'Error: Calculation error'];
    }
  }
}

class TanCommand implements Command {
  final Command CalculateCommand;

  TanCommand(this.CalculateCommand);

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    List<String> calcResult = CalculateCommand.execute(userQuestion, userAnswer);
    String evaluatedAnswer = calcResult[1];

    double? value = double.tryParse(evaluatedAnswer);
    if (value == null) {
      return [userQuestion, 'Error: Invalid input'];
    }
    // Required to be in radians.
    double radians = value * (3.141592653589793 / 180);

    try {
      Parser p = Parser();
      Expression exp = p.parse('tan($radians)');
      ContextModel cm = ContextModel();
      String result = exp.evaluate(EvaluationType.REAL, cm).toString();
      return [userQuestion, result];
    } catch (e) {
      return [userQuestion, 'Error: Calculation error'];
    }
  }
}
