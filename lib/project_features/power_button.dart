import '../base_project/command.dart';
import 'package:math_expressions/math_expressions.dart';
import '../project_features/validate.dart';

class PowerCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    // Append ^ to indicate the power operation, allowing the user to enter an exponent after it
    userQuestion += '^';
    return [userQuestion, userAnswer];
  }
}

