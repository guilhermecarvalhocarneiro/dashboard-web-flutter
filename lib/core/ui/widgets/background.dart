import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
