import 'dart:math';
import '../base_project/calculate_command.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculateSquareRoot {
  // Pre-process Log10(...) calls to be compatible with math_expressions
  static String processSquareRoot(String question, CalculateCommand calculator) {
    final regex = RegExp(r'sqrt\(([^()]+?)\)');

    // Keep processing until there are no more sqrt(...) patterns left
    while (regex.hasMatch(question)) {
      question = question.replaceAllMapped(regex, (match) {
        String innerContent = match.group(1)!;

        // If innerContent is numeric, calculate it directly
        if (_isNumeric(innerContent)) {
          return (sqrt(double.parse(innerContent))).toString();
        } else {
          // If innerContent is an expression, evaluate it first
          String evaluatedContent = calculator.execute(innerContent, "").last;
          if (_isNumeric(evaluatedContent)) {
            return (sqrt(double.parse(evaluatedContent))).toString();
          } else {
            // Return sqrt(expression) for non-numeric content
            return 'sqrt($evaluatedContent)';
          }
        }
      });
    }

    return question;
  }

  // Helper function to check if a string is a numeric value
  static bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }
}