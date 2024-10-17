import 'command.dart';
import '../project_features/validate.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateCommand implements Command {
  final List<String> _basicOperators = ['+', '-', '*', '/'];

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    Validator validator = Validator(userQuestion, userAnswer);
    String question = validator.getQuestion;
    String answer = validator.getAnswer;


    if(validator.getError == false) {
      Parser parser = Parser();
      Expression expression = parser.parse(question);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    }

    return [question, answer]; // Returns the evaluated result as a string
  }
}