import 'package:flutter/material.dart';

import '../../extensions/size.dart';
import '../default_size_values/button_sizes.dart';
import 'custom_button.dart';

class CustomButtonsBar extends StatefulWidget {
  const CustomButtonsBar({super.key});

  @override
  State<CustomButtonsBar> createState() => _CustomButtonsBarState();
}

class _CustomButtonsBarState extends State<CustomButtonsBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomPrimaryButton(labelButton: 'Salvar'),
          CustomSecundaryButton(
            labelButton: 'Salvar e continuar editando',
            width: context.percentWidth(defaultPercentWidthSecondaryButtonBar),
          ),
          CustomTercearyButton(
            labelButton: 'Voltar',
            width: context.percentWidth(defaultPercentWidthTercearyButton),
          ),
        ],
      ),
    );
  }
}
