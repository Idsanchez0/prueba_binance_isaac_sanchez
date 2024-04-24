import 'package:flutter/cupertino.dart';

import '../../../utils/size/size_config.dart';
import '../../atoms/texts/buttons/button_bold.dart';

class CustomIconTextButton extends StatelessWidget {
  final dynamic color;
  final dynamic border;
  final dynamic text;
  final dynamic colorText;
  final double radius;
  final IconData icon;
  const CustomIconTextButton(
      {super.key,
      required this.color,
      required this.border,
      required this.colorText,
      required this.text,
      required this.radius,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 1.5 * SizeConfig.heightMultiplier,
            bottom: 1.5 * SizeConfig.heightMultiplier,
            left: 4 * SizeConfig.widthMultiplier,
            right: 4 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: border),
            borderRadius: BorderRadius.all(
                Radius.circular(radius * SizeConfig.widthMultiplier))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 12 * SizeConfig.imageSizeMultiplier,
              color: border,
            ),
            SizedBox(
              height: .5 * SizeConfig.heightMultiplier,
            ),
            Container(
                alignment: Alignment.center,
                child: ButtonBold(
                  title: text,
                  color: colorText,
                  align: TextAlign.center,
                  fontWeight: FontWeight.w100,
                ))
          ],
        ));
  }
}
