import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/project_features/add_to_memory_button.dart';

void main() {
  group('MemoryAddCommand', () {
    test("Test that the answer is added to the memorylist correctly", () {
      // Arrange
      final MemmoryAddCommand = MemoryAddCommand();

      // Act
      
      // Test initial result is empty
      expect(MemoryAddCommand.answerMemory, isEmpty);
    });
  });
}
