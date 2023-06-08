import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../core/extensions/size.dart';
import '../../theme/colors.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: context.percentHeight(0.065),
      color: CustomColors.instance.customHeaderAppUIColorWithOpcatity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Text(
              'Header',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Icon(
                  LineIcons.envelope,
                  color: Colors.white,
                  size: context.percentHeight(0.03),
                ),
                const SizedBox(width: 5),
                Icon(
                  LineIcons.bell,
                  color: Colors.white,
                  size: context.percentHeight(0.03),
                ),
                const SizedBox(width: 5),
                Icon(
                  LineIcons.calendar,
                  color: Colors.white,
                  size: context.percentHeight(0.03),
                ),
                const SizedBox(width: 8),
                Icon(
                  LineIcons.userCircle,
                  color: Colors.white,
                  size: context.percentHeight(0.04),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
