import 'command.dart';
import '../project_features/validate.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateCommand implements Command {

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    Validator validator = Validator(userQuestion, userAnswer);
    String question = validator.getQuestion;
    String answer = validator.getAnswer;


    if(validator.getError == false) {
      // create temp variable here to hold question value
      //check if has log10 and send to log here
      // check if has factorial and send to factorial here

      Parser parser = Parser();
      Expression expression = parser.parse(question);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
      // set question value to the tempQuestion value
    }

    return [question, answer]; // Returns the evaluated result as a string
  }
}