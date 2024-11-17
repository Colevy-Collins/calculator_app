import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/project_features/add_to_memory_button.dart';

void main() {
  group('MemoryAddCommand', () {
    tearDown(() {
      MemoryAddCommand.answerMemory.clear();
    });
    test("Test null safety for answerMemory.", () {
      // null safety
      expect(MemoryAddCommand.answerMemory, isNotNull);
    });
    test("Test that answerMemory is empty at initialization.", () {
      // Test initial result is empty
      expect(MemoryAddCommand.answerMemory, isEmpty);
    });
    test("Test that answerMemory is a list of strings.", (){
      // test that it is a list
      expect(MemoryAddCommand.answerMemory, isA<List<String>>());
    });
    test("Test answer is being added to answerMemoryList", () {
      // Arrange
      MemoryAddCommand command = MemoryAddCommand();
      // Act
      command.execute("1+1","2");
      // Assert
      expect(MemoryAddCommand.answerMemory.contains("2"), true);
    });
    test("Testing that execute returns question and answer as a list.", () {
      // Arrange
      MemoryAddCommand command = MemoryAddCommand();
      var result;
      // Act
      result = command.execute("1+4","5");
      // Assert
      expect(result, isA<List<String>>());
    });
    test("Testing that execute returns expected question & answer values.", () {
      // Arrange
      MemoryAddCommand command = MemoryAddCommand();
      List<String> result = List.empty(growable: true);
      // Act
      result.addAll(command.execute("2+2", "4"));
      // Assert
      expect(result[0],"2+2");
      expect(result[1],"4");
    });
    test("Testing that answerMemory stays between instances of MemoryAddCommand.", () {
      // Arrange
      MemoryAddCommand command1 = MemoryAddCommand();
      MemoryAddCommand command2 = MemoryAddCommand();
      List<String> result = List.empty(growable: true);
      List<String> result2 = List.empty(growable: true);
      // Act
      result.addAll(command1.execute("4+5", "9"));
      result2.addAll(command2.execute("3+7","10"));
      // Assert
      expect(MemoryAddCommand.answerMemory[0],"9");
      expect(MemoryAddCommand.answerMemory[1],"10");
    });
  });
}
