import '../base_project/command.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    Parser parser = Parser();
    Expression expression = parser.parse(question);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    return [question, answer]; // Returns the evaluated result as a string
  }
}