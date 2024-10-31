// Adds the current userAnswer to a list for later retrieval.
// Where to put list for further reach? Into main.dart?
import '../base_project/command.dart';

class MemoryAddCommand implements Command {
   final answerMemory = List.empty(growable: true);
  @override

  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;
    
      answerMemory.add(userAnswer);

      answerMemory.forEach((answer){
        print(answer);
      });

    return [question, answer];
  }
}