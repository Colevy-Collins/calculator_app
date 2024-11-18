import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/project_features/square_root_button.dart';
void main() {
  group('Square Root', () {
    test("Checking return type is a List of Strings.", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("sqrt(64)","8");
        // Assert
        expect(result, isA<List<String>>());
    });
    test("Checking the list is length of 2.", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("sqrt(81)","0");
        // Assert
        expect(result.length, 2);
    });
    // testing returned values.
    test("Checking expected value is returned.", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("sqrt(64)","8");
        // Assert
        expect(result.contains("8"), true);
    });
    test("Checking first object in string contains sqrt(", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("sqrt(48)","7");
        // Assert
        expect(result[0].contains("sqrt("), true);
    });

    test("Checking when empty strings are input question is output correctly.", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("","");
        // Assert
        expect(result[0].contains("sqrt("), true);
    });
    test("Checking when empty strings are input answer is output correctly.", () {
        // Arrange
        SquareRootCommand command = SquareRootCommand();
        var result;
        // Act
        result = command.execute("","");
        // Assert
        expect(result[1].contains(""), true);
    });
  });
}