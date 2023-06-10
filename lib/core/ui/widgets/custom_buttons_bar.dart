import 'package:flutter/material.dart';

import '../../helpers/nuvols_logger.dart';
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
          CustomButton(
            labelButton: 'Salvar',
            callbackButtonPressed: callbackSaveButtonPressedOne,
          ),
          CustomButton(
            labelButton: 'Salvar e continuar editando',
            width: 250,
            typeButton: CustomButtonType.secundary,
            callbackButtonPressed: callbackSaveButtonPressedTwo,
          ),
          CustomButton(
            labelButton: 'Voltar',
            typeButton: CustomButtonType.terceary,
            callbackButtonPressed: callbackSaveButtonPressedTree,
          ),
        ],
      ),
    );
  }

  /// Função para callback do botão de salvar
  void callbackSaveButtonPressedOne() {
    NuvolsLogger.instance.info('Clicando no botão Salvar');
  }
  void callbackSaveButtonPressedTwo() {
    NuvolsLogger.instance.info('Salvar e continuar editando');
  }
  void callbackSaveButtonPressedTree() {
    NuvolsLogger.instance.info('Voltar');
  }
}
