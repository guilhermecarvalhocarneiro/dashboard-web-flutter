import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../default_size_values/icon_sizes.dart';
import '../default_size_values/text_menu_submenu_sizes.dart';

class CustomToolbarItens extends StatefulWidget {
  final List<Map<String, dynamic>> menuItens;
  final String menuSelected;
  final void Function(
    bool showContextMenu,
    bool showContextMenuIsEnabled,
    String menuSelected,
    String subMenuSelected,
    List<Map<String, dynamic>> subMenuItens,
    bool itenToolbarIsChanged,
  ) callbackMenuItensSelected;
  final void Function(String) callbackItemToolbarSelected;

  const CustomToolbarItens({
    super.key,
    required this.menuItens,
    required this.callbackMenuItensSelected,
    required this.callbackItemToolbarSelected,
    required this.menuSelected,
  });

  @override
  State<CustomToolbarItens> createState() => _CustomToolbarItensState();
}

class _CustomToolbarItensState extends State<CustomToolbarItens> {
  String _toolbarItemSelected = '';

  @override
  Widget build(BuildContext context) {
    _toolbarItemSelected = _toolbarItemSelected.isNotEmpty ? _toolbarItemSelected : widget.menuSelected;
    return Column(
      children: widget.menuItens.map((item) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _toolbarItemSelected == item['title']
                    ? CustomColors.instance.customBackgroundColorMenuItenSelected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  widget.callbackMenuItensSelected(true, true, item['title'], '', item['sub_itens'], true);
                  setState(() {
                    _toolbarItemSelected = item['title'];
                  });
                },
                icon: Icon(item['icon']),
                iconSize: _toolbarItemSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                color:
                    _toolbarItemSelected == item['title'] ? CustomColors.instance.customMenuItenSelected : Colors.white,
                hoverColor: Colors.deepOrange,
              ),
            ),
            InkWell(
              onTap: () {
                widget.callbackMenuItensSelected(true, true, item['title'], '', item['sub_itens'], true);
                setState(() {
                  _toolbarItemSelected = item['title'];
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    color: _toolbarItemSelected == item['title']
                        ? CustomColors.instance.customMenuItenSelected
                        : Colors.white,
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

  /// * ============================================================================
  /// * ============================================================================
  /// * Área para métodos e funções auxiliares da classe
  /// * ============================================================================
  /// * ============================================================================
}
