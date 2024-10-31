import '../base_project/command.dart';
// import 'validate.dart';
// import 'package:math_expressions/math_expressions.dart';

class SquareRootCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;
    // Validator validator = Validator(userQuestion, userAnswer);

    question = userQuestion + "sqrt(";

    /* if(validator.getError == false) {
      Parser parser = Parser();
      Expression expression = parser.parse(question);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    }
    */

    return [question, answer];

  }
}