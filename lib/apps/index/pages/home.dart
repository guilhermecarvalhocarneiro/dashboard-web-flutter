import 'package:flutter/material.dart';

import '../../../core/mocks/form_page.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/modal_window.dart';

class IndexPageHome extends StatefulWidget {
  const IndexPageHome({super.key});

  @override
  State<IndexPageHome> createState() => _IndexPageHomeState();
}

class _IndexPageHomeState extends State<IndexPageHome> {
  bool _showModalWindow = false;

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
                    setState(() {
                      _showModalWindow = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        // Janela modal
        Visibility(
          visible: _showModalWindow,
          child: const ModalWindow(
            child: Text(
              'Modal Window',
            ),
          ),
        ),
      ],
    );
  }
}
