import 'package:flutter/material.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';

class CustomDropDownButton extends StatefulWidget {
  final String valueSelected;
  final String text;
  final dynamic data;
  final Function onChange;
  const CustomDropDownButton({
    super.key,
    required this.valueSelected,
    required this.text,
    required this.onChange,
    required this.data,
  });
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButton();
}

class _CustomDropDownButton extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0.5 * SizeConfig.heightMultiplier),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: 2 * SizeConfig.widthMultiplier,
                right: 2 * SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                    Radius.circular(2 * SizeConfig.widthMultiplier))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat',
                      color: colors.neutral500),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: colors.neutral500,
                  size: 7 * SizeConfig.imageSizeMultiplier,
                ),
                // Not necessary for Option 1
                value: widget.valueSelected == '' ? null : widget.valueSelected,
                isExpanded: true,
                onChanged: (newValue) {
                  widget.onChange(newValue);
                },
                items: (widget.data as List<String>).map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        location,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )));
  }
}
