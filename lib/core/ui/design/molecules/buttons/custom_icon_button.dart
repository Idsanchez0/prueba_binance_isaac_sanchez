import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/size/size_config.dart';

class CustomIconButton extends StatelessWidget {
  final dynamic color;
  final dynamic border;
  final double radius;
  final String icon;
  const CustomIconButton(
      {super.key,
      required this.color,
      required this.border,
      required this.radius,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 1.5 * SizeConfig.heightMultiplier,
            bottom: 1.5 * SizeConfig.heightMultiplier,
            left: 5 * SizeConfig.widthMultiplier,
            right: 5 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: border),
            borderRadius: BorderRadius.all(
                Radius.circular(radius * SizeConfig.widthMultiplier))),
        child: SvgPicture.asset(
          icon,
          color: border,
          height: 6 * SizeConfig.imageSizeMultiplier,
          width: 6 * SizeConfig.imageSizeMultiplier,
        ));
  }
}
