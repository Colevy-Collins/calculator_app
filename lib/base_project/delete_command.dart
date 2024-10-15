import 'command.dart';

class DeleteCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = userQuestion.isNotEmpty ? userQuestion.substring(0, userQuestion.length - 1) : userQuestion;

    return [question, answer];

  }
}