import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:prueba_binance_isaac_sanchez/feature/information/widgets/profile_item_widget.dart';

import '../../../core/ui/utils/size/size_config.dart';

class ProfileListItemsWidget extends StatefulWidget {
  final String typeUser;
  const ProfileListItemsWidget({super.key, required this.typeUser});
  @override
  State<ProfileListItemsWidget> createState() => _ProfileListItemsWidget();
}

class _ProfileListItemsWidget extends State<ProfileListItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItemWidget(
          title: 'Isaac David Sánchez Chacaguasay',
          icon: PhosphorIcons.userCircle(),
        ),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
        ProfileItemWidget(
          title: 'Senior Flutter Developer',
          icon: PhosphorIcons.code(),
        ),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
        ProfileItemWidget(
          title: '(+593) 994-935-022',
          icon: PhosphorIcons.whatsappLogo(),
        ),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
        ProfileItemWidget(
          title: 'idsanchezch@gmail.com',
          icon: PhosphorIcons.microsoftOutlookLogo(),
        ),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
      ],
    );
  }
}
