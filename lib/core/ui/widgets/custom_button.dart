import 'package:flutter/material.dart';

import '../../../core/extensions/size.dart';
import '../default_size_values/button_sizes.dart';

enum CustomButtonType { primary, secundary, terceary }

class CustomButton extends StatefulWidget {
  final String labelButton;
  final double width;
  final double height;
  final CustomButtonType typeButton;
  final void Function() callbackButtonPressed;

  const CustomButton({
    super.key,
    required this.labelButton,
    required this.callbackButtonPressed,
    this.width = 0,
    this.height = 40,
    this.typeButton = CustomButtonType.primary,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _widhtButton = 0;
  double _heightButton = 0;

  @override
  Widget build(BuildContext context) {
    _widhtButton = widget.width != 0 ? widget.width : context.percentWidth(defaultPercentWidthButton);
    _heightButton = widget.height != 0 ? widget.height : context.percentHeight(defaultPercentHeightButton);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton(
        onPressed: widget.callbackButtonPressed,
        style: getButtonStyle(),
        child: Text(
          widget.labelButton,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    switch (widget.typeButton) {
      case CustomButtonType.primary:
        return getPrimaryButtonStyle;
      case CustomButtonType.secundary:
        return getSecundaryButtonStyle;
      case CustomButtonType.terceary:
        _widhtButton = widget.width != 0 ? widget.width : 85;
        return getTercearyButtonStyle;
      default:
        return getPrimaryButtonStyle;
    }
  }

  ButtonStyle get getPrimaryButtonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(_widhtButton, _heightButton),
      maximumSize: Size(_widhtButton, _heightButton),
      elevation: 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: defaultVerticalPaddingButton),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }

  ButtonStyle get getSecundaryButtonStyle {
    return ElevatedButton.styleFrom(
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
    );
  }

  ButtonStyle get getTercearyButtonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(_widhtButton, _heightButton),
      maximumSize: Size(_widhtButton, _heightButton),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue[900],
      shadowColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: defaultVerticalPaddingButton,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
