import 'package:flutter/material.dart';

import '../../../core/helpers/nuvols_logger.dart';
import '../../../core/theme/colors.dart';
import '../../../core/ui/default_size_values/icon_sizes.dart';
import '../../../core/ui/default_size_values/screen_areas_sizes.dart';
import '../../../core/ui/default_size_values/text_menu_submenu_sizes.dart';

class CustomSubmenu extends StatefulWidget {
  final bool showContextMenu;
  final bool showContextMenuIsEnabled;
  final String menuSelected;
  final String subMenuSelected;
  final List<Map<String, dynamic>> subMenuItens;
  final void Function(String) callbackSubItemMenuSelected;

  const CustomSubmenu({
    super.key,
    required this.showContextMenu,
    required this.showContextMenuIsEnabled,
    required this.menuSelected,
    required this.subMenuSelected,
    required this.subMenuItens,
    required this.callbackSubItemMenuSelected,
  });

  @override
  State<CustomSubmenu> createState() => _CustomSubmenuState();
}

class _CustomSubmenuState extends State<CustomSubmenu> {
  String _subMenuSelected = '';

  @override
  Widget build(BuildContext context) {
    _subMenuSelected = _subMenuSelected.isNotEmpty ? _subMenuSelected : widget.subMenuSelected;
    NuvolsLogger.instance.debug('Valor do _subMenuSelected: $_subMenuSelected');
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInToLinear,
      width: subMenuBarMaxWidth,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: widget.showContextMenu ? 1 : 0,
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
          child: widget.subMenuItens.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.subMenuItens.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: TextButton.icon(
                        onPressed: () {
                          widget.callbackSubItemMenuSelected(item['title']);
                          setState(() {
                            _subMenuSelected = item['title'];
                          });
                        },
                        icon: Icon(
                          item['icon'],
                          size: _subMenuSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                          color: _subMenuSelected == item['title']
                              ? CustomColors.instance.customIconLabelSubMenuItenSelected
                              : Colors.black,
                        ),
                        label: Text(
                          item['title'],
                          style: TextStyle(
                            color: _subMenuSelected == item['title']
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
