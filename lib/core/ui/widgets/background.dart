import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(.45),
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
