import 'package:flutter/material.dart';

import '../../../core/extensions/size.dart';
import '../default_size_values/button_sizes.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String labelButton;
  final double width;
  final double height;

  const CustomPrimaryButton({
    super.key,
    required this.labelButton,
    this.width = 0,
    this.height = 40,
  });

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  double _widhtButton = 0;
  double _heightButton = 0;

  @override
  Widget build(BuildContext context) {
    _widhtButton = widget.width != 0 ? widget.width : context.percentWidth(defaultPercentWidthButton);
    _heightButton = widget.height != 0 ? widget.height : context.percentHeight(defaultPercentHeightButton);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_widhtButton, _heightButton),
          maximumSize: Size(_widhtButton, _heightButton),
          elevation: 2.5,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: defaultVerticalPaddingButton),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Expanded(
          child: Text(
            widget.labelButton,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class CustomSecundaryButton extends StatefulWidget {
  final String labelButton;
  final double width;
  final double height;


  const CustomSecundaryButton({
    super.key,
    required this.labelButton,
    this.width = 0,
    this.height = 40,
  });

  @override
  State<CustomSecundaryButton> createState() => _CustomSecundaryButtonState();
}

class _CustomSecundaryButtonState extends State<CustomSecundaryButton> {
  double _widhtButton = 0;
  double _heightButton = 0;

  @override
  Widget build(BuildContext context) {
    _widhtButton = widget.width != 0 ? widget.width : context.percentWidth(defaultPercentWidthButton);
    _heightButton = widget.height != 0 ? widget.height : context.percentHeight(defaultPercentHeightButton);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_widhtButton, _heightButton),
          maximumSize: Size(_widhtButton, _heightButton),
          backgroundColor: const Color.fromARGB(248, 235, 231, 231),
          foregroundColor: Colors.blue,
          shadowColor: Colors.white,
          elevation: 0,
          side: const BorderSide(
            color: Colors.blue,
            width: 0.85,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: defaultVerticalPaddingButton),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Expanded(
          child: Text(
            widget.labelButton,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class CustomTercearyButton extends StatefulWidget {
  final String labelButton;
  final double width;
  final double height;

  const CustomTercearyButton({
    super.key,
    required this.labelButton,
    this.width = 0,
    this.height = 40,
  });

  @override
  State<CustomTercearyButton> createState() => _CustomTercearyButtonState();
}

class _CustomTercearyButtonState extends State<CustomTercearyButton> {
  double _widhtButton = 0;
  double _heightButton = 0;

  @override
  Widget build(BuildContext context) {
    _widhtButton = widget.width != 0 ? widget.width : context.percentWidth(defaultPercentWidthButton);
    _heightButton = widget.height != 0 ? widget.height : context.percentHeight(defaultPercentHeightButton);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_widhtButton, _heightButton),
          maximumSize: Size(_widhtButton, _heightButton),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue[900],
          shadowColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: defaultVerticalPaddingButton),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        child: Expanded(
          child: Text(
            widget.labelButton,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
