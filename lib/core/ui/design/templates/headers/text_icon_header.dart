import 'package:flutter/material.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/md_p.dart';

class TextIconHeader extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function onTap;
  final bool? dark;
  const TextIconHeader({
    super.key,
    required this.title,
    required this.onTap,
    this.dark,
  });
  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  State<TextIconHeader> createState() => _TextIconHeader();
}

class _TextIconHeader extends State<TextIconHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: widget.dark == true ? Colors.black : Colors.white,
        surfaceTintColor: widget.dark == true ? Colors.black : Colors.white,
        leading: GestureDetector(
          onTap: () => widget.onTap(),
          child: Icon(
            Icons.arrow_back,
            color: widget.dark == true ? Colors.white : Colors.black,
            size: 6 * SizeConfig.imageSizeMultiplier,
          ),
        ),
        shape: Border(bottom: BorderSide(color: colors.neutral500, width: .5)),
        title: MdP(
            title: widget.title,
            color: widget.dark == true ? Colors.white : Colors.black,
            align: TextAlign.center,
            fontWeight: FontWeight.bold));
  }
}
