import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/lg_p.dart';
import '../../atoms/texts/body/md_p.dart';

class SymbolCard extends StatefulWidget {
  final String title;
  final String price;
  final Color color;
  final Color border;
  final Color colorText;
  const SymbolCard({
    super.key,
    required this.title,
    required this.price,
    required this.color,
    required this.border,
    required this.colorText,
  });
  @override
  State<SymbolCard> createState() => _SymbolCard();
}

class _SymbolCard extends State<SymbolCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: widget.border),
          borderRadius: BorderRadius.all(
              Radius.circular(3 * SizeConfig.widthMultiplier))),
      padding: EdgeInsets.symmetric(vertical: 1 * SizeConfig.heightMultiplier),
      width: double.infinity,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(7),
          2: FlexColumnWidth(6),
        },
        children: [
          TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Icon(
                  PhosphorIcons.currencyCircleDollar(),
                  color: widget.colorText,
                  size: 10 * SizeConfig.imageSizeMultiplier,
                )),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: LgP(
                    title: widget.title,
                    color: widget.colorText,
                    align: TextAlign.start,
                    fontWeight: FontWeight.bold)),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: MdP(
                    title: '\$ ${widget.price}',
                    color: widget.colorText,
                    align: TextAlign.start,
                    fontWeight: FontWeight.normal))
          ])
        ],
      ),
    );
  }
}
