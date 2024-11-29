import 'dart:math'; // Import the Dart math library
import 'package:calculator/base_project/command.dart';

class NaturalLogCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    try {
      // When "ln" is clicked, append "ln(" to the question
      if (answer != "=" && !question.contains("ln(")) {
        question += "ln("; // Add the open parenthesis
        return [question, ""]; // Wait for number input
      }

      // Append the number after the open parenthesis
      if (question.endsWith("ln(") && answer.isNotEmpty && answer != "=") {
        question += answer; // Add the number dynamically
        return [question, ""]; // Show updated question
      }

      // Perform the calculation when "=" is pressed
      if (answer == "=") {
        // Ensure the input ends with a valid number and parentheses
        if (!question.endsWith(")") && !question.contains("ln(")) {
          throw Exception("Invalid input format: Use 'ln(number)'.");
        }

        // Extract the number inside parentheses
        String insideParentheses = question.split("ln(").last;
        double number = double.parse(insideParentheses);

        // Validate the number for natural logarithm
        if (number <= 0) {
          throw Exception("Natural logarithm undefined for numbers ≤ 0.");
        }

        // Calculate the natural logarithm
        double lnResult = log(number);

        // Format and return the updated question and answer
        question = "$question) = ${lnResult.toStringAsFixed(6)}"; // Add closing parenthesis
        answer = lnResult.toStringAsFixed(6);
      }
    } catch (e) {
      answer = "Error: ${e.toString()}"; // Handle errors gracefully
    }

    return [question, answer];
  }
}