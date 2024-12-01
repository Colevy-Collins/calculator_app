# Calculator Application User Manual

## Introduction
Welcome to the Calculator Application! This manual will guide you through the features and usage of the application. 
This calculator application allows you to build an equation than evaluate it to get the result. 
It supports basic arithmetic operations, exponential functions, logarithmic functions, trigonometric functions and more.

## Features
- Basic arithmetic operations (+, -, *, /)
- Exponential function (e, x², xʸ, √)
- Logarithmic functions (Log10 and natural logarithm(log))
- Trigonometric functions (sin, cos, tan)
- Memory functions (M+, ANS)
- Constants (π)
- Advanced functions (n!, ±, %)

## Using the Calculator

### Basic Operations
1. **Addition**: Enter the first number, press the `+` button, enter the second number, and press `=` to get the result.
2. **Subtraction**: Enter the first number, press the `-` button, enter the second number, and press `=` to get the result.
3. **Multiplication**: Enter the first number, press the `*` button, enter the second number, and press `=` to get the result.
4. **Division**: Enter the first number, press the `/` button, enter the second number, and press `=` to get the result.
Note: You can build complex expressions using multiple operations.

### Logarithmic Functions
1. **Logarithm Base 10**:
   - Press the `Log10` button to append `Log10(` to the current input.
   - Enter the number and press `)` to close the parenthesis.
   - Press `=` to evaluate the logarithm base 10 of the number.

2. **Natural Logarithm (ln)**:
   - Press the `ln` button to append `ln(` to the current input.
   - Enter the number and press `)` to close the parenthesis.
   - Press `=` to evaluate the natural logarithm of the number.

### Trigonometric Functions
1. **Sine Function**:
   - Press the `sin` button to append `sin(` to the current input.
   - Enter the angle in radians and press `)` to close the parenthesis.
   - Press `=` to evaluate the sine of the angle.

2. **Cosine Function**: 
   - Press the `cos` button to append `cos(` to the current input.
   - Enter the angle in radians and press `)` to close the parenthesis.
   - Press `=` to evaluate the cosine of the angle.

3. **Tangent Function**: 
   - Press the `tan` button to append `tan(` to the current input.
   - Enter the angle in radians and press `)` to close the parenthesis.
   - Press `=` to evaluate the tangent of the angle.

### Memory Functions
1. **Memory Addition (M+)**:

### Exponential Function
1. **Square Function (x²)**:
   - Enter the number and press the `x²` button to square the number.
   - Press `=` to evaluate the square of the number.

2. **Exponential Function (xʸ)**:
   - Enter the base number, press the `xʸ` button, enter the exponent, and press `=` to get the result.
   - Press `=` to evaluate the exponential function.

3. **Square Root Function (√)**:
   - Enter the number and press the `√` button to calculate the square root of the number.
   - Press `=` to evaluate the square root of the number.

### Constants
1. **Pi (π)**:
   - Press the `π` button to append `π` to the current input.
   - Press `=` to evaluate the value of π.

2. **Using Euler's Number (e)**:
   - Press the `e` button to append `e` to the current input.
   - Press `=` to evaluate the expression involving `e`.

### Advanced Functions
1. **Factorial Function (n!)**:
   - Enter the number and press the `n!` button to calculate the factorial of the number.
   - Press `=` to evaluate the factorial of the number.

2. **Negation Function (±)**:
   - Press the `±` button to negate the current input.

3. **Modulus Function (%)**:
   - Enter the first number, press the `%` button, enter the second number, and press `=` to get the result.
   - Press `=` to evaluate the modulus of the two numbers.

4. **ANS Function**:
   - Press the `ANS` button to append the previous result to the current input.
   - Press `=` to evaluate the expression with the previous result.

5. **Clear Function (C)**:
   - Press the `C` button to clear the current input.

6. **Delete Function (DEL)**:
   - Press the `DEL` button to delete the last character in the input.

7. **Equal Function (=)**:
   - Press the `=` button to evaluate the current input.

8. **Settings Function**:
   - Press the `Settings` button to access the settings menu.

## Error Handling
- If an invalid input is detected, the calculator will display an error message.
- Ensure that all expressions are correctly formatted before pressing `=`.

## Troubleshooting
- **Unexpected Results**: Check the input for any syntax errors.
- **Application does not display results**: Check the input for any syntax errors.

## Testing the Application
- To run the basic tests for the application, run the following command in your terminal:
  ```
  flutter test 
  ```
- To run advanced test to observe the application as it performs simulated actions.
   ```
   flutter test integration_test/app_test.dart  
   ```