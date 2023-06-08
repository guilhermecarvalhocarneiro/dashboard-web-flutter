import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/extensions/size.dart';
import '../../../core/helpers/general.dart';
import '../../../core/mocks/form_page.dart';
import '../../../core/mocks/list_page.dart';
import '../../../core/mocks/menu_itens.dart';
import '../../../core/theme/colors.dart';
import '../../../core/ui/default_opacity_values/dashboard_opacity.dart';
import '../../../core/ui/default_size_values/icon_sizes.dart';
import '../../../core/ui/widgets/background.dart';
import '../../../core/ui/widgets/custom_buttons_bar.dart';
import '../../../core/ui/widgets/footer.dart';
import '../../../core/ui/widgets/header.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool showContextMenu = true;
  bool showContextMenuIsEnabled = false;
  String menuSelected = '';
  List<Map<String, dynamic>> menuItensSelected = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Executando o build');
    return Scaffold(
      body: buildLayout(),
    );
  }

  Widget buildLayout() {
    return Stack(
      children: [
        const CustomBackground(),
        Row(
          children: [
            buildCustomToolbar(),
            Expanded(
              child: Column(
                children: [
                  const CustomHeader(),
                  buildCustomGlobalContent(context),
                  const CustomFooter(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Widget para construir a área central da tela
  Widget buildCustomGlobalContent(BuildContext context) {
    debugPrint('Executando o buildCustomGlobalContent');
    return Expanded(
      child: Row(
        children: [
          buildCustomContextMenu(context),
          buildContentArea(context, null),
        ],
      ),
    );
  }

  /// Widget para construir a toolbar lateral
  Widget buildCustomToolbar() {
    debugPrint('Executando o buildCustomToolbar');
    return Container(
      padding: const EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
        maxWidth: context.percentWidth(context.percentWidthFactor),
        minWidth: context.percentWidth(context.percentWidthFactor),
      ),
      color: CustomColors.instance.customBlackUIColorWithOpcatity,
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.bars,
              color: Colors.white,
              size: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: context.percentWidth(.5),
            height: 1,
            color: Colors.white.withOpacity(.35),
          ),
          buildCustomMenuItens(context),
        ],
      ),
    );
  }

  /// Widget para construir os itens do menu
  /// retornando uma lista de itens convertidos
  /// do tipo Map
  Widget buildCustomMenuItens(BuildContext context) {
    return Column(
      children: menuItens.map((item) {
        return Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  menuItensSelected = item['sub_itens'];
                  menuSelected = item['title'];
                });
              },
              icon: Icon(item['icon']),
              iconSize: menuSelected == item['title']
                  ? context.percentWidth(defaultPercentWidthToolbarIconSelected)
                  : context.percentWidth(defaultPercentWidthToolbarIcon),
              color: Colors.white,
              hoverColor: Colors.deepOrange,
            ),
            const SizedBox(height: .8),
            Text(
              item['title'],
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth(defaultPercentWidhtLabelIcon),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }

  /// Widget para construir a área do content principal
  Widget buildContentArea(BuildContext context, Widget? child) {
    return Flexible(
      flex: 8,
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: CustomColors.instance.customContentAreaAppUIColorWithOpcatity,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Agenda de Contato'),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12),
                child: GeneralHelperUtilsClass.instance.getRandomBoolean()
                    ? const MockFormPage()
                    : const MockContactTable(),
              ),
            ),
            const CustomButtonsBar(),
          ],
        ),
      ),
    );
  }

  /// Widget para contruir o menu de contexto
  Widget buildCustomContextMenu(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInToLinear,
      width: showContextMenu ? context.percentWidth(.12) : 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: showContextMenu ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.only(top: 12),
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            color: CustomColors.instance.customSubMenuAppUIColorWithOpcatity,
            borderRadius: BorderRadius.circular(12),
          ),
          child: menuItensSelected.isNotEmpty
              ? Column(
                  children: menuItensSelected.map((item) {
                    return Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(item['icon']),
                          iconSize: context.percentWidth(defaultPercentWidthIcon),
                          color: Colors.black,
                          hoverColor: Colors.deepOrange,
                        ),
                        const SizedBox(height: .8),
                        Text(
                          item['title'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: context.percentWidth(defaultPercentWidhtLabelIcon),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }).toList(),
                )
              : Container(),
        ),
      ),
    );
  }
}
