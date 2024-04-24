import 'package:flutter/material.dart';

import '../../../utils/paths/colors_utils.dart';

class CustomRadio extends StatefulWidget {
  final String value;
  final String groupValue;
  final Function onChanged;
  const CustomRadio(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);
    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4.5),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected ? colors.primary500 : colors.neutral500),
            shape: BoxShape.circle,
            color: selected ? colors.primary500 : Colors.white),
        child: const Icon(
          Icons.circle,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
