import 'dart:math';
import '../base_project/command.dart';

class PiCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    userQuestion += pi.toString();
    return [userQuestion, userAnswer];
  }
}