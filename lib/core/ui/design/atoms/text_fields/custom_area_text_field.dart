import 'package:flutter/material.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';

class CustomAreaTextField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic inputType;
  final bool enable;
  final dynamic hintText;
  final Function onChange;
  final Function onComplete;
  final Function onTap;
  const CustomAreaTextField({
    super.key,
    required this.inputType,
    required this.enable,
    required this.hintText,
    required this.controller,
    required this.onChange,
    required this.onComplete,
    required this.onTap,
  });
  @override
  State<CustomAreaTextField> createState() => _CustomAreaTextField();
}

class _CustomAreaTextField extends State<CustomAreaTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.transparent,
            child: Theme(
                data: ThemeData(
                  disabledColor: Colors.black,
                ),
                child: GestureDetector(
                  child: TextField(
                    controller: widget.controller,
                    maxLines: 6,
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle: TextStyle(
                          color: colors.neutral500,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400),
                      hintText: widget.hintText,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.neutral500, width: 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colors.neutral500, width: 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(2 * SizeConfig.widthMultiplier))),
                    ),
                    keyboardType: widget.inputType,
                    cursorColor: Colors.black,
                    enabled: widget.enable,
                    onTap: () => widget.onTap(),
                    onEditingComplete: () => widget.onComplete(),
                    onChanged: (x) => widget.onChange(x),
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                    ),
                  ),
                ))),
      ],
    );
  }
}
