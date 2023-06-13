/// Widget que será chamado sobrepondo-se à tela atual
/// podendo ser utilizado para renderizor um form de inserção

import 'package:flutter/material.dart';

class ModalWindow extends StatefulWidget {
  final Widget child;

  const ModalWindow({super.key, required this.child});

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
      child: FractionallySizedBox(
        widthFactor: .75,
        heightFactor: 1,
        child: Container(
          color: Colors.white,
          child: widget.child,
        ),
      ),
    );
  }
}
