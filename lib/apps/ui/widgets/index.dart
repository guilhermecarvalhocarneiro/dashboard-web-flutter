import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/extensions/size.dart';
import '../../../core/helpers/general.dart';
import '../../../core/mocks/form_page.dart';
import '../../../core/mocks/list_page.dart';
import '../../../core/mocks/menu_itens.dart';
import '../../../core/theme/colors.dart';
import '../../../core/ui/default_size_values/icon_sizes.dart';
import '../../../core/ui/default_size_values/screen_areas_sizes.dart';
import '../../../core/ui/default_size_values/text_menu_submenu_sizes.dart';
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
  String subMenuSelected = '';
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
      constraints: const BoxConstraints(
        maxWidth: toolbarMaxWidth,
        minWidth: toolbarMinWidth,
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
          buildCustomToolbarItens(context),
        ],
      ),
    );
  }

  /// Widget para construir os itens do menu
  /// retornando uma lista de itens convertidos
  /// do tipo Map
  Widget buildCustomToolbarItens(BuildContext context) {
    return Column(
      children: menuItens.map((item) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: menuSelected == item['title']
                    ? CustomColors.instance.customBackgroundColorMenuItenSelected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    menuItensSelected = item['sub_itens'];
                    menuSelected = item['title'];
                    subMenuSelected = '';
                  });
                },
                icon: Icon(item['icon']),
                iconSize: menuSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                color: menuSelected == item['title'] ? CustomColors.instance.customMenuItenSelected : Colors.white,
                hoverColor: Colors.deepOrange,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  menuItensSelected = item['sub_itens'];
                  menuSelected = item['title'];
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    color: menuSelected == item['title'] ? CustomColors.instance.customMenuItenSelected : Colors.white,
                    fontSize: toolbarLabelIconMenuSize,
                  ),
                ),
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
      width: subMenuBarMaxWidth,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: showContextMenu ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.only(top: 12, left: 12),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: menuItensSelected.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            subMenuSelected = item['title'];
                          });
                        },
                        icon: Icon(
                          item['icon'],
                          size: subMenuSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                          color: subMenuSelected == item['title']
                              ? CustomColors.instance.customIconLabelSubMenuItenSelected
                              : Colors.black,
                        ),
                        label: Text(
                          item['title'],
                          style: TextStyle(
                            color: subMenuSelected == item['title']
                                ? CustomColors.instance.customIconLabelSubMenuItenSelected
                                : Colors.black,
                            fontSize: subMenuLabelIconMenuSize,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Container(),
        ),
      ),
    );
  }
}
