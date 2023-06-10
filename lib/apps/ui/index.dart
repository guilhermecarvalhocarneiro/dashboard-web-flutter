import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/extensions/size.dart';
import '../../core/helpers/general.dart';
import '../../core/mocks/form_page.dart';
import '../../core/mocks/list_page.dart';
import '../../core/mocks/menu_itens.dart';
import '../../core/theme/colors.dart';
import '../../core/ui/default_size_values/icon_sizes.dart';
import '../../core/ui/default_size_values/screen_areas_sizes.dart';
import '../../core/ui/default_size_values/text_menu_submenu_sizes.dart';
import '../../core/ui/widgets/background.dart';
import '../../core/ui/widgets/custom_buttons_bar.dart';
import '../../core/ui/widgets/footer.dart';
import '../../core/ui/widgets/header.dart';
import 'widgets/submenu.dart';
import 'widgets/toolbar_itens.dart';

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
    return Expanded(
      child: Row(
        children: [
          CustomSubmenu(
            showContextMenu: showContextMenu,
            showContextMenuIsEnabled: showContextMenuIsEnabled,
            menuSelected: menuSelected,
            subMenuSelected: subMenuSelected,
            menuItensSelected: menuItensSelected,
            callbackSubItemMenuSelected: callbackSubMenuSelected,
          ),
          buildContentArea(context, null),
        ],
      ),
    );
  }

  /// Widget para construir a toolbar lateral
  Widget buildCustomToolbar() {
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
          CustomToolbarItens(
            menuItens: menuItens,
            callbackMenuItensSelected: callBackSetValuesWhenMenuItemIsChoosen,
            callbackItemToolbarSelected: callbackItemToolbarSelected,
            menuSelected: menuSelected,
          ),
          // buildCustomToolbarItens(context),
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
                  setValuesWhenMenuItemIsChoosen(
                    showContextMenu = true,
                    showContextMenuIsEnabled = true,
                    menuSelected = item['title'],
                    subMenuSelected = '',
                    menuItensSelected = item['sub_itens'],
                  );
                },
                icon: Icon(item['icon']),
                iconSize: menuSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                color: menuSelected == item['title'] ? CustomColors.instance.customMenuItenSelected : Colors.white,
                hoverColor: Colors.deepOrange,
              ),
            ),
            InkWell(
              onTap: () {
                setValuesWhenMenuItemIsChoosen(
                  showContextMenu = true,
                  showContextMenuIsEnabled = true,
                  menuSelected = item['title'],
                  subMenuSelected = '',
                  menuItensSelected = item['sub_itens'],
                );
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

  /// * ============================================================================
  /// * ============================================================================
  /// * Área para métodos e funções auxiliares da classe
  /// * ============================================================================
  /// * ============================================================================

  /// Método auxiliar para setar os valores quando um item do
  /// submenu for clicado
  void setValuesWhenMenuItemIsChoosen(
    bool showContextMenu,
    bool showContextMenuIsEnabled,
    String menuSelected,
    String subMenuSelected,
    List<Map<String, dynamic>> menuItensSelected,
  ) {
    debugPrint('Valor do setValuesWhenMenuItemIsChoosen: $menuItensSelected');
    setState(() {
      showContextMenu = showContextMenu;
      showContextMenuIsEnabled = showContextMenuIsEnabled;
      menuSelected = menuSelected;
      subMenuSelected = subMenuSelected;
      menuItensSelected = menuItensSelected;
    });
    debugPrint('Valor do menuItensSelected após o SetState: $menuItensSelected');
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackSubMenuSelected(String subMenuSelected) {
    debugPrint('Valor do subMenuSelected: $subMenuSelected');
    // setState(() {
    //   subMenuSelected = subMenuSelected;
    // });
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackItemToolbarSelected(String toolbarItemSelected) {
    debugPrint('Valor do toolBarItemSelected: $toolbarItemSelected');
    // setState(() {
    //   subMenuSelected = subMenuSelected;
    // });
  }

  /// Método auxiliar para setar os valores quando um item do
  /// submenu for clicado
  void callBackSetValuesWhenMenuItemIsChoosen(
    bool showContextMenu,
    bool showContextMenuIsEnabled,
    String menuSelected,
    String subMenuSelected,
    List<Map<String, dynamic>> menuItensSelected,
  ) {
    setValuesWhenMenuItemIsChoosen(
      showContextMenu = showContextMenu,
      showContextMenuIsEnabled = showContextMenuIsEnabled,
      menuSelected = menuSelected,
      subMenuSelected = subMenuSelected,
      menuItensSelected = menuItensSelected,
    );
  }
}
