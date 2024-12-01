import 'command.dart';
import '../project_features/validate.dart';
import 'package:math_expressions/math_expressions.dart';
import '../project_features/calculateLog10.dart';
import '../project_features/calculateFactorial.dart';

class CalculateCommand implements Command {

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    Validator validator = Validator(userQuestion, userAnswer);
    String question = validator.getQuestion;
    String answer = validator.getAnswer;

    if(validator.getError == false) {
      String questionHolder = question;
      question = CalculateLog10.processLog10(question, this);
      question = CalculateFactorial.processFactorial(question, this);

      try {
        Parser parser = Parser();
        Expression expression = parser.parse(question);
        ContextModel cm = ContextModel();
        double eval = expression.evaluate(EvaluationType.REAL, cm);
        answer = eval.toString();
        // set question value to the tempQuestion value
        question = questionHolder;
      } catch (e) {
        if(e.toString() == "Bad state: No element") {
          answer = "Error: Invalid Expression";
        } else if(e.toString() == "RangeError (length): Invalid value: Valid value range is empty: -1") {
          answer = "Error: Invalid Expression";
        } else if(e.toString() == "Bad state: Variable not bound: Log10") {
          answer = "Error: Invalid Expression";
        }else{
          throw e;
        }
      }
    }

    return [question, answer]; // Returns the evaluated result as a string
  }
}