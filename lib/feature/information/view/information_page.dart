import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/atoms/texts/header/h1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/ui/design/templates/footers/footer.dart';
import '../../../core/global/texts_global.dart';
import '../../../core/ui/utils/paths/colors_utils.dart';
import '../../../core/ui/utils/routes/routes.dart';
import '../../../core/ui/utils/size/size_config.dart';
import '../widgets/profile_buttons_widget.dart';
import '../widgets/profile_list_items_widget.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});
  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {
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
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => routes.mainExplore(context: context);
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const Footer(page: 'profile'),
        body: SafeArea(
          bottom: false,
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: H1(
                          title: textsGlobal.information,
                          color: colors.primary500,
                          align: TextAlign.center)),
                  SizedBox(
                    height: 5 * SizeConfig.heightMultiplier,
                  ),
                  ProfileListItemsWidget(
                    typeUser: typeUser,
                  ),
                ],
              ),
              const ProfileButtonsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
