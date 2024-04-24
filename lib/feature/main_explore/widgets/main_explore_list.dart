import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/templates/cards/symbol_card.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/routes/routes.dart';

import '../../../core/ui/utils/paths/colors_utils.dart';
import '../../../core/ui/utils/size/size_config.dart';

class MainExploreList extends StatefulWidget {
  final dynamic data;
  const MainExploreList({super.key, required this.data});
  @override
  State<MainExploreList> createState() => _MainExploreList();
}

class _MainExploreList extends State<MainExploreList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.data == null ? 0 : widget.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => routes.chartsPage(
                      context: context, page: widget.data[index]['symbol']),
                  child: SymbolCard(
                    title: widget.data[index]['symbol'],
                    price: widget.data[index]['bidPrice'],
                    border: colors.primary500,
                    color: (index % 2) == 0 ? Colors.white : colors.primary500,
                    colorText:
                        (index % 2) == 0 ? colors.primary500 : Colors.white,
                  ));
            }));
  }
}
