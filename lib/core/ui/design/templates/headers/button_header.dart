import 'package:flutter/material.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/md_p.dart';

class ButtonHeader extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function onTap;
  const ButtonHeader({
    super.key,
    required this.title,
    required this.onTap,
  });
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  State<ButtonHeader> createState() => _ButtonHeader();
}

class _ButtonHeader extends State<ButtonHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        shape: Border(bottom: BorderSide(color: colors.neutral500, width: .5)),
        centerTitle: false,
        actions: [
          Container(
              margin: EdgeInsets.only(right: 3 * SizeConfig.widthMultiplier),
              child: GestureDetector(
                onTap: () => widget.onTap(),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                  size: 6 * SizeConfig.imageSizeMultiplier,
                ),
              )),
        ],
        title: Container(
            margin: EdgeInsets.only(left: 3 * SizeConfig.widthMultiplier),
            child: MdP(
                title: widget.title,
                color: Colors.black,
                align: TextAlign.start,
                fontWeight: FontWeight.bold)));
  }
}
