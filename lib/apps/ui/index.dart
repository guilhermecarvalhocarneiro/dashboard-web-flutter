import 'package:flutter/material.dart';

import '../../core/helpers/general.dart';
import '../../core/helpers/nuvols_logger.dart';
import '../../core/mocks/form_page.dart';
import '../../core/mocks/list_page.dart';
import '../../core/theme/colors.dart';
import '../../core/ui/widgets/background.dart';
import '../../core/ui/widgets/custom_buttons_bar.dart';
import '../../core/ui/widgets/footer.dart';
import '../../core/ui/widgets/header.dart';
import 'widgets/submenu.dart';
import 'widgets/toolbar.dart';

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
  List<Map<String, dynamic>> subMenuOfToolbarItenSelected = [];

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
            CustomToolbar(
              callbackMenuItensSelected: setValuesWhenMenuItemIsChoosen,
              callbackItemToolbarSelected: callbackItemToolbarSelected,
            ),
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
            subMenuItens: subMenuOfToolbarItenSelected,
            callbackSubItemMenuSelected: callbackSubMenuSelected,
          ),
          // buildContentArea(context, null),
        ],
      ),
    );
  }

  /// Widget para construir a área do content principal
  Widget buildContentArea(BuildContext context, Widget? child) {
    return Flexible(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
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
            const CustomButtonsBar(), // Erro do Build ocorre aqui
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
    setState(() {
      showContextMenu = showContextMenu;
      showContextMenuIsEnabled = showContextMenuIsEnabled;
      menuSelected = menuSelected;
      subMenuSelected = subMenuSelected;
      subMenuOfToolbarItenSelected = menuItensSelected;
    });
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackSubMenuSelected(String subMenuSelected) {
    NuvolsLogger.instance.info('Valor do subMenuSelected: $subMenuSelected');
    // setState(() {
    //   subMenuSelected = subMenuSelected;
    // });
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackItemToolbarSelected(String toolbarItemSelected) {
    NuvolsLogger.instance.info('Valor do toolbarItemSelected: $toolbarItemSelected');
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
    List<Map<String, dynamic>> subMenuItens,
  ) {
    setValuesWhenMenuItemIsChoosen(
      showContextMenu = showContextMenu,
      showContextMenuIsEnabled = showContextMenuIsEnabled,
      menuSelected = menuSelected,
      subMenuSelected = subMenuSelected,
      subMenuOfToolbarItenSelected = subMenuItens,
    );
  }
}
