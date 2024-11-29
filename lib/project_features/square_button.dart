import '../base_project/command.dart';
import 'package:math_expressions/math_expressions.dart';

class SquareCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    // Append ^2 to the input to signal squaring in the final calculation
    userQuestion += '^2';
    return [userQuestion, userAnswer];
  }
}