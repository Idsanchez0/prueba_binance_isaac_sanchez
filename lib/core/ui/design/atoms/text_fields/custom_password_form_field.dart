import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final dynamic text;
  final Function? onChangeData;
  final Function? onChangeData2;
  final dynamic colorBorder;
  final dynamic colorUnderlineBorder;
  const CustomPasswordFormField(
      {super.key,
      required this.controller,
      required this.text,
      this.onChangeData,
      this.onChangeData2,
      this.colorBorder,
      this.colorUnderlineBorder});
  @override
  State<CustomPasswordFormField> createState() => _CustomPasswordFormField();
}

class _CustomPasswordFormField extends State<CustomPasswordFormField> {
  bool isObscured = true;
  visiblePassword() {
    if (isObscured.toString() == 'false') {
      setState(() {
        isObscured = true;
      });
    } else if (isObscured.toString() == 'true') {
      setState(() {
        isObscured = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.transparent,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(
                    color: colors.neutral500,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
                hintText: widget.text,
                fillColor: Colors.white,
                suffixIcon: GestureDetector(
                    onTap: () => visiblePassword(),
                    child: Icon(
                      isObscured
                          ? PhosphorIcons.eyeClosed()
                          : PhosphorIcons.eye(),
                      size: 6 * SizeConfig.imageSizeMultiplier,
                    )),
                suffixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Colors.blue
                        : colors.neutral500),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.colorBorder ?? Colors.blue, width: 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(2 * SizeConfig.widthMultiplier))),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.colorUnderlineBorder ?? colors.neutral500,
                      width: 1),
                  borderRadius: BorderRadius.all(
                      Radius.circular(2 * SizeConfig.widthMultiplier)),
                ),
              ),
              onChanged: (x) => widget.onChangeData == null
                  ? widget.onChangeData2!(x)
                  : widget.onChangeData!(),
              cursorColor: Colors.black,
              obscureText: isObscured,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
              ),
            )),
      ],
    );
  }
}
