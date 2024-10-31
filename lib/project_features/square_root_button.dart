import '../base_project/command.dart';

class SquareRootCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = userQuestion + "Sqrt(";

    return [question, answer];

  }
}