import 'dart:math';
import '../base_project/calculate_command.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculateLog10 {
  // Pre-process Log10(...) calls to be compatible with math_expressions
  static String processLog10(String question, CalculateCommand calculator) {
    final regex = RegExp(r'Log10\(([^()]+?)\)');

    // Keep processing until there are no more Log10(...) patterns left
    while (regex.hasMatch(question)) {
      question = question.replaceAllMapped(regex, (match) {
        String innerContent = match.group(1)!;

        // If innerContent is numeric, calculate it directly
        if (_isNumeric(innerContent)) {
          return (log10(double.parse(innerContent))).toString();
        } else {
          // If innerContent is an expression, evaluate it first
          String evaluatedContent = calculator.execute(innerContent, "").last;
          if (_isNumeric(evaluatedContent)) {
            return (log10(double.parse(evaluatedContent))).toString();
          } else {
            // Return log(expression) / ln(10) for non-numeric content
            return '(log($evaluatedContent) / ${ln10.toString()})';
          }
        }
      });
    }

    return question;
  }

  // Helper function to calculate log10 using dart:math
  static double log10(double x) {
    return log(x) / ln10;
  }

  // Helper function to check if a string is a numeric value
  static bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }
}