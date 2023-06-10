import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/extensions/size.dart';
import '../../../core/mocks/menu_itens.dart';
import '../../../core/theme/colors.dart';
import '../../../core/ui/default_size_values/screen_areas_sizes.dart';
import 'toolbar_itens.dart';

class CustomToolbar extends StatefulWidget {
  final void Function(
    bool showContextMenu,
    bool showContextMenuIsEnabled,
    String menuSelected,
    String subMenuSelected,
    List<Map<String, dynamic>> subMenuItens,
  ) callbackMenuItensSelected;
  final void Function(String) callbackItemToolbarSelected;

  const CustomToolbar({
    super.key,
    required this.callbackMenuItensSelected,
    required this.callbackItemToolbarSelected,
  });

  @override
  State<CustomToolbar> createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  List<Map<String, dynamic>> subMenuOfToolbarItenSelected = [];
  String menuSelected = '';

  @override
  Widget build(BuildContext context) {
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
            callbackMenuItensSelected: widget.callbackMenuItensSelected,
            callbackItemToolbarSelected: widget.callbackItemToolbarSelected,
            menuSelected: menuSelected,
          ),
        ],
      ),
    );
  }
}
