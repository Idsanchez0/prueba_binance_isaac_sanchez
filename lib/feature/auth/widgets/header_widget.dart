import 'package:flutter/material.dart';

import '../../../core/ui/design/atoms/texts/body/md_p.dart';
import '../../../core/ui/design/atoms/texts/header/h1.dart';
import '../../../core/ui/utils/size/size_config.dart';

class HeaderWidget extends StatefulWidget {
  final String title;
  final String text;
  final Function back;
  const HeaderWidget(
      {super.key, required this.title, required this.text, required this.back});
  @override
  State<HeaderWidget> createState() => _HeaderWidget();
}

class _HeaderWidget extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => widget.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 7 * SizeConfig.imageSizeMultiplier,
          ),
        ),
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        H1(title: widget.title, color: Colors.black, align: TextAlign.start),
        SizedBox(
          height: .5 * SizeConfig.heightMultiplier,
        ),
        MdP(
            title: widget.text,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
      ],
    );
  }
}
