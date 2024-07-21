import 'package:flutter/material.dart';

enum ButtonTheme {
  light,
  dark,
}

class Button extends StatefulWidget {
  final String text;
  final ButtonTheme theme;
  final String path;
  final bool isPushBack;

  const Button({
    super.key,
    this.text = "Click Me",
    this.theme = ButtonTheme.dark,
    this.path = '',
    this.isPushBack = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    if (widget.theme == ButtonTheme.dark) {
      return ElevatedButton(
        onPressed: () => widget.isPushBack
            ? Navigator.pop(context)
            : Navigator.pushNamed(context, widget.path),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: BorderSide(
            color: Colors.grey[300]!,
          ),
          overlayColor: Colors.grey[300],
        ),
        child: Text(widget.text),
      );
    } else {
      return ElevatedButton(
        onPressed: () => widget.isPushBack
            ? Navigator.pop(context)
            : Navigator.pushNamed(context, widget.path),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: const BorderSide(
            color: Colors.white,
          ),
          overlayColor: Colors.grey[300],
        ),
        child: Text(widget.text),
      );
    }
  }
}
