import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:calculator/project_features/square_button.dart';

void main() {
  group('square button', () {
    test("Checking return type is a List of Strings.", () {
      // Arrange
      SquareCommand command = SquareCommand();
      var result;
      // Act
      result = command.execute("2^2","4");
      // Assert
      expect(result, isA<List<String>>());
    });
    test("Checking the list is length of 2.", () {
      // Arrange
      SquareCommand command = SquareCommand();
      var result;
      // Act
      result = command.execute("5^2","25");
      // Assert
      expect(result.length, 2);
    });
    // testing returned values.
    test("Checking expected value is returned.", () {
      // Arrange
      SquareCommand command = SquareCommand();
      var result;
      // Act
      result = command.execute("7^2","49");
      // Assert
      expect(result.contains("49"), true);
    });
    test("Checking when empty strings are input question is output correctly.", () {
      // Arrange
      SquareCommand command = SquareCommand();
      var result;
      // Act
      result = command.execute("","");
      // Assert
      expect(result[1].contains(""), true);
    });
    test("Checking when empty strings are input answer is output correctly.", () {
      // Arrange
      SquareCommand command = SquareCommand();
      var result;
      // Act
      result = command.execute("","");
      // Assert
      expect(result[1].contains(""), true);
    });
  });
}
