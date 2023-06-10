import 'package:flutter/material.dart';

import '../../../core/helpers/general.dart';
import '../../../core/mocks/form_page.dart';
import '../../../core/mocks/list_page.dart';
import '../../../core/ui/widgets/custom_buttons_bar.dart';

class IndexPageHome extends StatefulWidget {
  const IndexPageHome({super.key});

  @override
  State<IndexPageHome> createState() => _IndexPageHomeState();
}

class _IndexPageHomeState extends State<IndexPageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10, bottom: 16.0, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Home'),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              child:
                  GeneralHelperUtilsClass.instance.getRandomBoolean() ? const MockFormPage() : const MockContactTable(),
            ),
          ),
          const CustomButtonsBar(),
        ],
      ),
    );
  }
}
