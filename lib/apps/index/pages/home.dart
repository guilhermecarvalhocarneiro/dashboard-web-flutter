import 'package:flutter/material.dart';

import '../../../core/extensions/open_modal_window.dart';
import '../../../core/mocks/form_page.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/modal_window_slide.dart';

class IndexPageHome extends StatefulWidget {
  // Método Callback que será invocado pela tela filha
  // para mostrar ou ocultar a janela modal
  final Function({bool showModal}) callbackShowModalWindow;

  const IndexPageHome({super.key, required this.callbackShowModalWindow});

  @override
  State<IndexPageHome> createState() => _IndexPageHomeState();
}

class _IndexPageHomeState extends State<IndexPageHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, right: 10, bottom: 16.0, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: context.textStyles.textBold,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: const MockFormPage(),
                  // GeneralHelperUtilsClass.instance.getRandomBoolean() ? const MockFormPage() : const MockContactTable(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                  labelButton: 'Adicionar novo registro',
                  callbackButtonPressed: () {
                    Navigator.of(context).push(
                      context.openModalWindow(
                        const ModalWindowSlide(
                          child: Text('Teste'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
