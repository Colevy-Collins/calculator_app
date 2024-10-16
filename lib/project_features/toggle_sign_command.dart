import '../base_project/command.dart';

class ToggleSignCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    if (userQuestion.isNotEmpty && !userQuestion.startsWith('-')) {
      userQuestion = '-' + userQuestion;
    } else if (userQuestion.startsWith('-')) {
      userQuestion = userQuestion.substring(1);
    }
    return [userQuestion, userAnswer];
  }
}
