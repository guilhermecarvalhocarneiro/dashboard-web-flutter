/// Widget que será chamado sobrepondo-se à tela atual
/// podendo ser utilizado para renderizor um form de inserção

import 'package:flutter/material.dart';

/// Classe que renderiza a janela modal
/// [Parameters]
///   [child] - Widget que será renderizado na janela modal
///   [showModalWindow] - Método callback que atualiza a tela 'pai' para mostrar a janela modal
/// [Return] - Retorna um Widget
class ModalWindow extends StatefulWidget {
  final Widget child;
  final Function({bool showModal}) callbackShowModalWindow;

  const ModalWindow({
    super.key,
    required this.child,
    required this.callbackShowModalWindow,
  });

  @override
  State<ModalWindow> createState() => _ModalWindowState();
}

class _ModalWindowState extends State<ModalWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      color: Colors.black.withOpacity(.5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              widget.callbackShowModalWindow(showModal: false);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * .35,
              color: Colors.transparent,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * .65,
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      widget.callbackShowModalWindow(showModal: false);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                widget.child,
              ],
            ),
          )
        ],
      ),
    );
  }
}
