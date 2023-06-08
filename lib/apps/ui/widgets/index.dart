import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/extensions/size.dart';
import '../../../core/mocks/menu_itens.dart';
import '../../../core/theme/colors.dart';
import '../../../core/ui/widgets/background.dart';
import '../../../core/ui/widgets/custom_button.dart';
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
  bool showSubMenuContato = false;
  bool showSubMenuFeed = false;
  bool showSubMenuHome = false;
  bool showSubMenuSobre = false;
  bool fixedSubMenuContato = false;
  bool fixedSubMenuFeed = false;
  bool fixedSubMenuHome = false;
  bool fixedSubMenuSobre = false;
  double _widhtSubMenu = 200;
  String menuSelected = '';
  List<Map<String, dynamic>> menuItensSelected = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Executando o build');
    _widhtSubMenu = context.percentWidth(.12);
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
        buildSubMenuItensToolbar(),
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
            onPressed: () {
              setState(() {});
            },
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
                });
              },
              icon: Icon(item['icon']),
              iconSize: context.percentWidth(.018),
              color: Colors.white,
              hoverColor: Colors.deepOrange,
            ),
            const SizedBox(height: .8),
            Text(
              item['title'],
              style: TextStyle(
                color: Colors.white,
                fontSize: context.percentWidth(.0055),
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
          color: Colors.white.withOpacity(.78),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Coluna Direita'),
            Row(
              children: [
                CustomPrimaryButton(labelButton: 'Botão de Exemplo'),
                CustomSecundaryButton(labelButton: 'Botão Secundário'),
                CustomTercearyButton(labelButton: 'Botão Terciário'),
              ],
            ),
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
            color: Colors.white.withOpacity(.65),
            borderRadius: BorderRadius.circular(12),
          ),
          child: menuItensSelected.isNotEmpty
              ? Column(
                  children: menuItensSelected.map((item) {
                    return Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            buildSubMenuWthItens(context, item['title']);
                          },
                          icon: Icon(item['icon']),
                          iconSize: context.percentWidth(.018),
                          color: Colors.black,
                          hoverColor: Colors.deepOrange,
                        ),
                        const SizedBox(height: .8),
                        Text(
                          item['title'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: context.percentWidth(.0055),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }).toList(),
                )
              : const Column(
                  children: [
                    Center(
                      child: Text('Coluna Esquerda'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  /// Método responsável por mostrar/ocultar o container
  /// com os subitens de cada menu
  void buildSubMenuWthItens(BuildContext context, String menu) {
    switch (menu.toLowerCase()) {
      case 'contato':
        setState(() {
          showContextMenuIsEnabled = true;
          showSubMenuContato = true;
          showSubMenuSobre = false;
          showSubMenuFeed = false;
          showSubMenuHome = false;
        });
        break;
      case 'home':
        setState(() {
          showContextMenuIsEnabled = true;
          showSubMenuHome = true;
          showSubMenuSobre = false;
          showSubMenuFeed = false;
          showSubMenuContato = false;
        });
        break;
      case 'sobre':
        setState(() {
          showContextMenuIsEnabled = true;
          showSubMenuSobre = true;
          showSubMenuFeed = false;
          showSubMenuHome = false;
          showSubMenuContato = false;
        });
        break;
      case 'feed':
        setState(() {
          showContextMenuIsEnabled = true;
          showSubMenuFeed = true;
          showSubMenuSobre = false;
          showSubMenuHome = false;
          showSubMenuContato = false;
        });
        break;
      default:
    }
  }

  /// Método para fixar o submenu
  void fixedSubMenu(String menuSelected) {
    if (menuSelected.toLowerCase() == 'contato') {
      setState(() {
        fixedSubMenuContato = !fixedSubMenuContato;
        fixedSubMenuHome = false;
        fixedSubMenuSobre = false;
        fixedSubMenuFeed = false;
      });
    }
    if (menuSelected.toLowerCase() == 'home') {
      setState(() {
        fixedSubMenuHome = !fixedSubMenuHome;
        fixedSubMenuContato = false;
        fixedSubMenuSobre = false;
        fixedSubMenuFeed = false;
      });
    }
    if (menuSelected.toLowerCase() == 'sobre') {
      setState(() {
        fixedSubMenuSobre = !fixedSubMenuSobre;
        fixedSubMenuContato = false;
        fixedSubMenuHome = false;
        fixedSubMenuFeed = false;
      });
    }
    if (menuSelected.toLowerCase() == 'feed') {
      setState(() {
        fixedSubMenuFeed = !fixedSubMenuFeed;
        fixedSubMenuContato = false;
        fixedSubMenuHome = false;
        fixedSubMenuSobre = false;
      });
    }
  }

  /// Método para construir o submenu de cada item da
  /// toolbar que deverá aparecer do lado direito de cada
  /// item do menu com uma margem esquerda de 12px
  Widget buildSubMenuItensToolbar() {
    final leftMargin = context.percentWidth(context.percentWidthFactor) + 2;
    final marginTopSubMenu = context.percentHeight(0.075);
    if ((showSubMenuHome && showContextMenu) || fixedSubMenuHome) {
      return Container(
        margin: EdgeInsets.only(left: leftMargin, top: marginTopSubMenu),
        width: _widhtSubMenu,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orange,
        ),
      );
    }
    if ((showSubMenuContato && showContextMenu) || fixedSubMenuContato) {
      return Container(
        margin: EdgeInsets.only(left: leftMargin, top: marginTopSubMenu),
        width: _widhtSubMenu,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurpleAccent,
        ),
      );
    }
    if ((showSubMenuFeed && showContextMenu) || fixedSubMenuFeed) {
      return Container(
        margin: EdgeInsets.only(left: leftMargin, top: marginTopSubMenu),
        width: _widhtSubMenu,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
      );
    }
    if ((showSubMenuSobre && showContextMenu) || fixedSubMenuSobre) {
      return Container(
        margin: EdgeInsets.only(left: leftMargin, top: marginTopSubMenu),
        width: _widhtSubMenu,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightGreenAccent,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
