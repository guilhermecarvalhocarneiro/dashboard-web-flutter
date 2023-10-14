import 'package:flutter/material.dart';

import '../../../core/extensions/open_modal_window.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/custom_card.dart';
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
                  child: GridView.count(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 4,
                    children: <Widget>[
                      const CustomCard(
                        child: Column(
                          children: [
                            Text('Teste 1'),
                            Text('Teste 2'),
                          ],
                        ),
                      ),
                      CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Formulário de registro '),
                            const SizedBox(height: 12),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Username',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 12),
                            SizedBox(
                                width: double.infinity,
                                height: 32,
                                child: ElevatedButton(onPressed: () {}, child: const Text('Enviar')))
                          ],
                        ),
                      ),
                      const CustomCard(
                        child: Text('Teste 3'),
                      ),
                      const CustomCard(
                        child: Text('Teste 3'),
                      ),
                    ],
                  ),
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
