import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/base_project/command.dart';

class ECommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;


    if (answer != "=") {
      question += "e";
      return [question, answer];
    }

    try {

      // Append "e" symbolically to the question for display
      question += "e";

      // Replace instances of "7e" with "7 * 2.718281828" explicitly
      String formattedQuestion = question.replaceAllMapped(
        RegExp(r'(\d+)e'), // Match numbers directly followed by "e"
            (match) => '${match.group(1)}*2.718281828',
      ).replaceAll(
        'e', '2.718281828', // Replace standalone "e" with its value
      );

      // Use math_expressions to evaluate the formatted question
      Parser parser = Parser();
      Expression exp = parser.parse(formattedQuestion);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/base_project/command.dart';

class ECommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;


    if (answer != "=") {
      question += "e";
      return [question, answer];
    }

    try {

      // Append "e" symbolically to the question for display
      question += "e";

      // Replace instances of "7e" with "7 * 2.718281828" explicitly
      String formattedQuestion = question.replaceAllMapped(
        RegExp(r'(\d+)e'), // Match numbers directly followed by "e"
            (match) => '${match.group(1)}*2.718281828',
      ).replaceAll(
        'e', '2.718281828', // Replace standalone "e" with its value
      );

      // Use math_expressions to evaluate the formatted question
      Parser parser = Parser();
      Expression exp = parser.parse(formattedQuestion);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      // Update the answer with the calculated result
      answer = result.toStringAsFixed(6); // Format result to 6 decimal places
    } catch (e) {
      // Gracefully handle any errors
      answer = "Error";
    }

    return [question, answer];
  }
}

      // Update the answer with the calculated result
      answer = result.toStringAsFixed(6); // Format result to 6 decimal places
    } catch (e) {
      // Gracefully handle any errors
      answer = "Error";
    }

    return [question, answer];
  }
}