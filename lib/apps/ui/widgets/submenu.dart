import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/ui/default_size_values/icon_sizes.dart';
import '../../../core/ui/default_size_values/screen_areas_sizes.dart';
import '../../../core/ui/default_size_values/text_menu_submenu_sizes.dart';

class CustomSubmenu extends StatefulWidget {
  final bool showContextMenu;
  final bool showContextMenuIsEnabled;
  final String menuSelected;
  final String subMenuSelected;
  final List<Map<String, dynamic>> menuItensSelected;

  const CustomSubmenu({
    super.key,
    required this.showContextMenu,
    required this.showContextMenuIsEnabled,
    required this.menuSelected,
    required this.subMenuSelected,
    required this.menuItensSelected,
  });

  @override
  State<CustomSubmenu> createState() => _CustomSubmenuState();
}

class _CustomSubmenuState extends State<CustomSubmenu> {

  @override
  Widget build(BuildContext context) {    
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
          child: widget.menuItensSelected.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.menuItensSelected.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            // subMenuSelected = item['title'];
                          });
                        },
                        icon: Icon(
                          item['icon'],
                          size: widget.subMenuSelected == item['title'] ? toolbarIconsSelectedWidth : toolbarIconsMaxWidth,
                          color: widget.subMenuSelected == item['title']
                              ? CustomColors.instance.customIconLabelSubMenuItenSelected
                              : Colors.black,
                        ),
                        label: Text(
                          item['title'],
                          style: TextStyle(
                            color: widget.subMenuSelected == item['title']
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
