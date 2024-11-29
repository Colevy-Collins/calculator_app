import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:calculator/project_features/power_button.dart';

void main() {
  group('power button', () {
    test("Checking return type is a List of Strings.", () {
      // Arrange
      PowerCommand command = PowerCommand();
      var result;
      // Act
      result = command.execute("2^3","8");
      // Assert
      expect(result, isA<List<String>>());
    });
    test("Checking the list is length of 2.", () {
      // Arrange
      PowerCommand command = PowerCommand();
      var result;
      // Act
      result = command.execute("3^3","27");
      // Assert
      expect(result.length, 2);
    });
    // testing returned values.
    test("Checking expected value is returned.", () {
      // Arrange
      PowerCommand command = PowerCommand();
      var result;
      // Act
      result = command.execute("5^3","125");
      // Assert
      expect(result.contains("125"), true);
    });
    test("Checking when empty strings are input question is output correctly.", () {
      // Arrange
      PowerCommand command = PowerCommand();
      var result;
      // Act
      result = command.execute("","");
      // Assert
      expect(result[1].contains(""), true);
    });
    test("Checking when empty strings are input answer is output correctly.", () {
      // Arrange
      PowerCommand command = PowerCommand();
      var result;
      // Act
      result = command.execute("","");
      // Assert
      expect(result[1].contains(""), true);
    });
  });
}