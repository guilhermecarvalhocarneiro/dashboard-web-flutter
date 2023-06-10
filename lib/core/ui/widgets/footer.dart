import 'package:flutter/material.dart';

import '../../../core/extensions/size.dart';
import '../theme/colors.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight(.035),
      padding: const EdgeInsets.only(right: 10),
      color: CustomColors.instance.customFooterAppUIColorWithOpcatity,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Rodapé',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
