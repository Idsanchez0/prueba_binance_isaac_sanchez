import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/texts_global.dart';
import '../../../utils/paths/colors_utils.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/xsm_p.dart';

class Footer extends StatefulWidget {
  final String page;
  const Footer({
    super.key,
    required this.page,
  });

  @override
  State<Footer> createState() => _Footer();
}

class _Footer extends State<Footer> {
  String typeUser = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      typeUser = prefs.getString('userType').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 3 * SizeConfig.heightMultiplier,
          top: 1 * SizeConfig.heightMultiplier),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFEBEBEB), width: 1))),
      child: Table(
        children: [
          TableRow(children: [
            TableCell(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () => routes.mainExplore(context: context),
                    child: Icon(
                      PhosphorIcons.currencyCircleDollar(),
                      color: widget.page == 'criptos'
                          ? colors.primary500
                          : colors.neutral500,
                      size: 7 * SizeConfig.imageSizeMultiplier,
                    )),
                XsmP(
                    title: textsGlobal.symbols,
                    color: widget.page == 'criptos'
                        ? colors.primary500
                        : colors.neutral500,
                    align: TextAlign.center,
                    fontWeight: FontWeight.normal)
              ],
            )),
            TableCell(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () => routes.chartsPage(context: context),
                    child: Icon(
                      PhosphorIcons.chartLineUp(),
                      color: widget.page == 'chart'
                          ? colors.primary500
                          : colors.neutral500,
                      size: 7 * SizeConfig.imageSizeMultiplier,
                    )),
                XsmP(
                    title: textsGlobal.charts,
                    color: widget.page == 'chart'
                        ? colors.primary500
                        : colors.neutral500,
                    align: TextAlign.center,
                    fontWeight: FontWeight.normal)
              ],
            )),
            TableCell(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () => routes.informationPage(context: context),
                    child: Icon(
                      PhosphorIcons.info(),
                      color: widget.page == 'info'
                          ? colors.primary500
                          : colors.neutral500,
                      size: 7 * SizeConfig.imageSizeMultiplier,
                    )),
                XsmP(
                    title: textsGlobal.information,
                    color: widget.page == 'info'
                        ? colors.primary500
                        : colors.neutral500,
                    align: TextAlign.center,
                    fontWeight: FontWeight.normal)
              ],
            )),
          ])
        ],
      ),
    );
  }
}
