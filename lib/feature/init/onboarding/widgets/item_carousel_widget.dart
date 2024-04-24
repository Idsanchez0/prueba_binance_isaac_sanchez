import 'package:flutter/material.dart';

import '../../../../core/ui/design/atoms/texts/body/md_p.dart';
import '../../../../core/ui/design/atoms/texts/header/h1.dart';
import '../../../../core/ui/utils/size/size_config.dart';

class ItemCarouselWidget extends StatefulWidget {
  final String title;
  final String text;
  const ItemCarouselWidget({
    super.key,
    required this.title,
    required this.text,
  });
  @override
  State<ItemCarouselWidget> createState() => _ItemCarouselWidget();
}

class _ItemCarouselWidget extends State<ItemCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        H1(title: widget.title, color: Colors.black, align: TextAlign.center),
        SizedBox(
          height: 1 * SizeConfig.heightMultiplier,
        ),
        MdP(
            title: widget.text,
            color: Colors.black,
            align: TextAlign.center,
            fontWeight: FontWeight.w100)
      ],
    );
  }
}
