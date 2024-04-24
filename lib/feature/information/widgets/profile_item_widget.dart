import 'package:flutter/material.dart';

import '../../../../core/ui/design/atoms/texts/body/md_p.dart';
import '../../../core/ui/utils/paths/colors_utils.dart';
import '../../../core/ui/utils/size/size_config.dart';

class ProfileItemWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  const ProfileItemWidget({super.key, required this.title, required this.icon});
  @override
  State<ProfileItemWidget> createState() => _ProfileItemWidget();
}

class _ProfileItemWidget extends State<ProfileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),
      child: Table(
        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(9)},
        children: [
          TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Icon(
                  widget.icon,
                  color: colors.primary500,
                  size: 7 * SizeConfig.imageSizeMultiplier,
                )),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: MdP(
                    title: widget.title,
                    color: Colors.black,
                    align: TextAlign.start,
                    fontWeight: FontWeight.normal)),
          ])
        ],
      ),
    ));
  }
}
