import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String labelButton;
  final double width;

  const CustomPrimaryButton({
    super.key,
    required this.labelButton,
    this.width = 200,
  });

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            widget.width,
            55,
          ),
          maximumSize: Size(
            widget.width,
            55,
          ),
          elevation: 2.5,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Text(
          widget.labelButton,
        ),
      ),
    );
  }
}

class CustomSecundaryButton extends StatefulWidget {
  final String labelButton;
  final double width;
  const CustomSecundaryButton({
    super.key,
    required this.labelButton,
    this.width = 200,
  });

  @override
  State<CustomSecundaryButton> createState() => _CustomSecundaryButtonState();
}

class _CustomSecundaryButtonState extends State<CustomSecundaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widget.width, 55),
          maximumSize: Size(widget.width, 55),
          backgroundColor: const Color.fromARGB(248, 235, 231, 231),
          foregroundColor: Colors.blue,
          shadowColor: Colors.white,
          elevation: 0,
          side: const BorderSide(
            color: Colors.blue,
            width: 0.85,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Text(widget.labelButton),
      ),
    );
  }
}

class CustomTercearyButton extends StatefulWidget {
  final String labelButton;
  final double width;
  const CustomTercearyButton({
    super.key,
    required this.labelButton,
    this.width = 200,
  });

  @override
  State<CustomTercearyButton> createState() => _CustomTercearyButtonState();
}

class _CustomTercearyButtonState extends State<CustomTercearyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widget.width, 55),
          maximumSize: Size(widget.width, 55),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue[900],
          shadowColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Text(
          widget.labelButton,
          style: const TextStyle(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
