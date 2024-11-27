import 'package:calculator/base_project/command.dart';

class SinCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    // Append `sin()` to the current question without evaluating
    String question = userQuestion + 'sin(';
    return [question, userAnswer];
  }
}

class CosCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    // Append `cos()` to the current question without evaluating
    String question = userQuestion + 'cos(';
    return [question, userAnswer];
  }
}

class TanCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    // Append `tan()` to the current question without evaluating
    String question = userQuestion + 'tan(';
    return [question, userAnswer];
  }
}
