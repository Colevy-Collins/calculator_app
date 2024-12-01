import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.child,
    required this.buttonColor,
    required this.textColor,
    required this.function,
  }) : super(key: key);

  final String child;
  final Color buttonColor, textColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate size based on available space
            double size = constraints.maxWidth * 0.25; // Adjust as needed
            double fontSize = size * 0.2; // Adjust font size relative to button size

            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: size,
                width: size,
                color: buttonColor,
                child: Center(
                  child: Text(
                    child,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
