import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/paths/images_utils.dart';
import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/sm_p.dart';
import '../../atoms/texts/header/h2.dart';

class MainExploreHeader extends StatefulWidget implements PreferredSizeWidget {
  const MainExploreHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  State<MainExploreHeader> createState() => _MainExploreHeader();
}

class _MainExploreHeader extends State<MainExploreHeader> {
  String name = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: colors.primary500,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5 * SizeConfig.widthMultiplier),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(bottom: .75 * SizeConfig.heightMultiplier),
          alignment: Alignment.center,
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(9),
            },
            children: [
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: const Border.fromBorderSide(
                              BorderSide(color: Colors.white)),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(imagesUtils.userImage))),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H2(
                              title: 'Hola $name',
                              color: Colors.white,
                              align: TextAlign.start),
                          const SmP(
                              title: '¿Qué deseas hacer hoy?',
                              color: Colors.white,
                              align: TextAlign.start,
                              fontWeight: FontWeight.normal)
                        ],
                      ),
                    ))
              ])
            ],
          ),
        ));
  }
}
