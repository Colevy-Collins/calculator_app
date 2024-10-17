import 'command.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateCommand implements Command {
  final List<String> _basicOperators = ['+', '-', '*', '/'];

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;


    // Add * before ( if it does not have a basic operator before it
    for (int i = 1; i < question.length; i++) {
      if (question[i] == '(' && !_basicOperators.contains(question[i - 1])) {
        question = question.substring(0, i) + '*' + question.substring(i);
        i++; // Move to the next character to avoid infinite loop
      }
    }
    // Verify that every '(' has a corresponding ')'
    int openParens = 0;
    for (int i = 0; i < question.length; i++) {
      if (question[i] == '(') {
        openParens++;
      } else if (question[i] == ')') {
        openParens--;
      }
      if (openParens < 0) {
        answer = 'Error: Unmatched parenthesis';
        return [question, answer];
      }
    }
    if (openParens != 0) {
      answer = 'Error: Unmatched parenthesis';
      return [question, answer];
    }

    Parser parser = Parser();
    Expression expression = parser.parse(question);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    return [question, answer]; // Returns the evaluated result as a string
  }
}