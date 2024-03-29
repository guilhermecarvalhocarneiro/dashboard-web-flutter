import 'package:flutter/material.dart';

import '../../core/helpers/nuvols_logger.dart';
import '../../core/ui/theme/colors.dart';
import '../../core/ui/widgets/background.dart';
import '../../core/ui/widgets/footer.dart';
import '../../core/ui/widgets/header.dart';
import '../../core/ui/widgets/modal_window.dart';
import '../../core/ui/widgets/submenu.dart';
import '../../core/ui/widgets/toolbar.dart';
import '../index/pages/home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool showContextMenu = true;
  bool showContextMenuIsEnabled = false;
  bool itenToolbarIsChanged = false;
  String menuSelected = '';
  String subMenuSelected = '';
  List<Map<String, dynamic>> subMenuOfToolbarItenSelected = [];
  bool _showModalWindow = false;

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

  // Método a ser invocado pela tela filha de Callback que
  // mostrará ou ocultará a janela modal
  void showModalWindow({bool showModal = true}) {
    setState(() {
      _showModalWindow = showModal;
    });
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
        // Janela modal
        Visibility(
          visible: _showModalWindow,
          child: ModalWindow(
            callbackShowModalWindow: showModalWindow,
            child: const Text(
              'Modal Window',
            ),
          ),
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
            itenToolbarIsChanged: itenToolbarIsChanged,
          ),
          buildContentArea(
            context,
            IndexPageHome(
              callbackShowModalWindow: showModalWindow,
            ),
          ),
        ],
      ),
    );
  }

  /// Widget para construir a área do content principal
  Widget buildContentArea(BuildContext context, Widget? child, {bool showBackgroundColorOpacity = true}) {
    return Flexible(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        decoration: showBackgroundColorOpacity
            ? BoxDecoration(
                color: CustomColors.instance.customContentAreaAppUIColorWithOpcatity,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: child,
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
    bool toolbarItenIsChanged,
  ) {
    setState(() {
      showContextMenu = showContextMenu;
      showContextMenuIsEnabled = showContextMenuIsEnabled;
      menuSelected = menuSelected;
      subMenuSelected = subMenuSelected;
      subMenuOfToolbarItenSelected = menuItensSelected;
      itenToolbarIsChanged = toolbarItenIsChanged;
    });
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackSubMenuSelected(String subMenuSelected) {
    NuvolsLogger.instance.info('Valor do subMenuSelected: $subMenuSelected');
    setState(() {
      itenToolbarIsChanged = false;
    });
  }

  /// Função Callback que será passada no construtor da classe CustomSubmenu
  /// que terá a função de atualizar o valor do atributo subMenuSelected
  void callbackItemToolbarSelected(String toolbarItemSelected) {
    NuvolsLogger.instance.info('Valor do toolbarItemSelected: $toolbarItemSelected');
  }
}
