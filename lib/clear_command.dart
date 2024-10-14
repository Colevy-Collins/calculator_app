import 'command.dart';

class ClearCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = ''; // Clears the input
    answer = ''; // Clears the answer
    return [question, answer]; // Clears the input
  }
}