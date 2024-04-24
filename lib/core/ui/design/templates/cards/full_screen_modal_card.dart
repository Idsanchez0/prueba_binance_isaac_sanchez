import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../global/texts_global.dart';
import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';
import '../../atoms/texts/body/md_p.dart';
import '../../atoms/texts/header/h2.dart';
import '../../molecules/buttons/custom_button.dart';

class FullScreenModalCard extends StatefulWidget {
  final String title;
  final String text;
  final String image;
  final Function onTap;
  const FullScreenModalCard(
      {super.key,
      required this.image,
      required this.title,
      required this.text,
      required this.onTap});
  @override
  State<FullScreenModalCard> createState() => _FullScreenModalCard();
}

class _FullScreenModalCard extends State<FullScreenModalCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(right: 8 * SizeConfig.widthMultiplier),
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: colors.neutral100,
              border:
                  Border.fromBorderSide(BorderSide(color: colors.neutral100)),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(4.5 * SizeConfig.imageSizeMultiplier),
              child: SvgPicture.asset(
                widget.image,
                color: colors.primary500,
                fit: BoxFit.contain,
              ),
            )),
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        H2(title: widget.title, color: Colors.black, align: TextAlign.center),
        SizedBox(
          height: 1 * SizeConfig.heightMultiplier,
        ),
        MdP(
            title: widget.text,
            color: Colors.black,
            align: TextAlign.center,
            fontWeight: FontWeight.normal),
        SizedBox(
          height: 8 * SizeConfig.heightMultiplier,
        ),
        GestureDetector(
            onTap: () => widget.onTap(),
            child: CustomButton(
                color: colors.primary500,
                border: colors.primary500,
                colorText: Colors.white,
                text: textsGlobal.accept,
                radius: 50))
      ],
    );
  }
}
