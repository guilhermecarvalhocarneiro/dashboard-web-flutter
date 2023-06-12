///
/// Para estudar como implementar métodos de callBack que atualizem a 'tela' pai,
/// utilizar como referência a implementação do CustomTextFormField contido no arquivo
/// [lib/core/user_interface/widget/CustomTextFormField] do projeto [iteeia] na [linha 1056]
/// e.g.:
/// ```dart
///  class CustomTextFormField extends StatelessWidget {
///   final String labelText;
///   final String hintText;
///   final FormFieldValidator<String>? customValidator;
///   final ValueChanged<String>? customOnChanged;
///   final List<TextInputFormatter>? inputFormatters;
///   final FocusNode? focusNode;
///   final TextInputType keyBoardType;
///   final bool obscureValue;
///   final bool readOnly;
///   final int? maxLineField;
///   final int? maxLengthCharacter;
///   final TextEditingController controller;
///   final bool hiddenCounter;
///
///   const CustomTextFormField(
///       {Key? key,
///       required this.labelText,
///       required this.hintText,
///       required this.controller,
///       this.customValidator,
///       this.customOnChanged,
///       this.inputFormatters,
///       this.focusNode,
///       this.keyBoardType = TextInputType.text,
///       this.obscureValue = false,
///       this.readOnly = false,
///       this.maxLineField = null,
///       this.maxLengthCharacter = null,
///       this.hiddenCounter = false})
///       : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       crossAxisAlignment: CrossAxisAlignment.start,
///       mainAxisAlignment: MainAxisAlignment.start,
///       children: [
///         CustomTextFormFieldLabel(labelText: labelText),
///         Container(
///           margin: const EdgeInsets.only(bottom: 18),
///           child: TextFormField(
///             controller: controller,
///             validator: customValidator,
///             onChanged: customOnChanged,
///             inputFormatters: inputFormatters,
///             keyboardType: keyBoardType,
///             obscureText: obscureValue,
///             readOnly: readOnly,
///             maxLines: maxLineField,
///             focusNode: this.focusNode,
///             maxLength: maxLengthCharacter ?? null,
///             decoration: CustomTextFormFieldStyle.textFieldStyle(hintText: hintText, hiddenCounter: hiddenCounter),
///           ),
///         )
///       ],
///     );
///   }
///  }
/// ```
/// e também no arquivo [lib/apps;checklist/pages/actionPlan.dart] do projeto [iteeia] na [linha 185]
/// os métodos são para componentes do tipo TextField, mas o conceito é o mesmo para qualquer componente
/// e.g.:
/// ```dart
/// 
///  String? validadorResponsavel(String? textValue) {
///   if (textValue != null) {
///     if (textValue.isEmpty) {
///       return 'Informe o nome do responsável';
///     }
///   } else {
///     return 'Informe o nome do responsável';
///   }
///   return null;
///  }
/// 
/// Widget buildTextFormsFieldsDynamicResponsavel(int index) {
///    return CustomTextFormField(
///      labelText: 'Responsável',
///      hintText: 'Informe o nome do responsável por essa ação',
///      controller: _responsavelControllers[index],
///      customValidator: validadorResponsavel,
///      customOnChanged: (text) {
///        _respostasDesconformes[index].responsavel = text;
///      },
///    );
///  }
/// ```
///
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
