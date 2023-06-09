import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
    width: double.infinity,
    height: double.infinity,
      'assets/images/bg-12.jpg',
      fit: BoxFit.cover,
    );
  }
}
