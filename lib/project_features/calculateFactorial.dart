import 'dart:math';
import '../base_project/calculate_command.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculateFactorial {
  // Pre-process !(...) calls to evaluate factorial expressions
  static String processFactorial(String question, CalculateCommand calculator) {
    final regex = RegExp(r'!\(([^()]+?)\)'); // Matches !(...) pattern

    // Keep processing until there are no more !(...) patterns left
    while (regex.hasMatch(question)) {
      question = question.replaceAllMapped(regex, (match) {
        String innerContent = match.group(1)!;

        // Evaluate the inner content if it’s an expression
        String evaluatedContent = calculator.execute(innerContent, "").last;

        if (_isNumeric(evaluatedContent)) {
          int result = factorial(int.parse(evaluatedContent));
          return result.toString();
        } else {
          throw StateError("Inner content inside factorial is not a valid number or resolvable equation: $evaluatedContent");
        }
      });
    }

    return question;
  }

  // Helper function to compute factorial
  static int factorial(int n) {
    if (n < 0) throw ArgumentError("Factorial is not defined for negative numbers");
    return n <= 1 ? 1 : n * factorial(n - 1);
  }

  // Helper function to check if a string is a numeric value
  static bool _isNumeric(String str) {
    return int.tryParse(str) != null;
  }
}