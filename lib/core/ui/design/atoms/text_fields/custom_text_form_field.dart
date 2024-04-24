import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/atoms/texts/buttons/captions.dart';

import '../../../utils/paths/colors_utils.dart';
import '../../../utils/size/size_config.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic inputType;
  final bool? isDocument;
  final bool enable;
  final dynamic hintText;
  final bool isFocused;
  final bool? isCed;
  final bool? time;
  final bool? prefixIcon;
  final bool? error;
  final Function? onChangeData;
  final TextAlign? align;
  final String? type;
  final String? icon;
  final String? messageError;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.inputType,
      required this.enable,
      required this.hintText,
      this.align,
      this.isDocument,
      this.type,
      this.error,
      required this.isFocused,
      this.isCed,
      this.onChangeData,
      this.icon,
      this.prefixIcon,
      this.time,
      this.messageError});
  @override
  State<CustomTextFormField> createState() => _CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormField> {
  bool? showError;
  String? messageError;

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
                child: TextFormField(
                  textAlign:
                      (widget.align != null) ? widget.align! : TextAlign.start,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(
                        color: colors.neutral500,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                    hintText: widget.hintText,
                    fillColor: Colors.white,
                    prefixIcon: widget.prefixIcon == true
                        ? Icon(
                            Icons.attach_money,
                            color: colors.neutral500,
                          )
                        : null,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.error == true
                                ? colors.error500
                                : showError == true
                                    ? colors.error500
                                    : Colors.blue,
                            width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(2 * SizeConfig.widthMultiplier))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.error ?? showError == true
                                ? colors.error500
                                : colors.neutral500,
                            width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(2 * SizeConfig.widthMultiplier))),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.error ?? showError == true
                                ? colors.error500
                                : widget.isFocused
                                    ? Colors.blue
                                    : colors.neutral500,
                            width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(2 * SizeConfig.widthMultiplier))),
                  ),
                  keyboardType: widget.inputType,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.black,
                  enabled: widget.enable,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.black),
                  onChanged: (x) {
                    widget.onChangeData!(x);
                  },
                  inputFormatters: [
                    if (widget.isDocument == true) ...[
                      LengthLimitingTextInputFormatter(
                          widget.isCed == true ? 10 : 15),
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[a-zA-Z0-9]+$'))
                    ],
                    if (widget.inputType == TextInputType.number) ...[
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    if (widget.hintText ==
                        "Teléfono del contacto de emergencia") ...[
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+]+'))
                    ],
                    if (widget.hintText ==
                        "Ingresa el celular del titular") ...[
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    if (widget.inputType == TextInputType.name ||
                        widget.inputType == TextInputType.text &&
                            widget.isDocument != true) ...[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      LengthLimitingTextInputFormatter(70),
                    ]
                  ],
                ))),
        if (widget.error == true && widget.messageError != '') ...[
          Container(
              alignment: Alignment.centerLeft,
              child: Captions(
                  title: widget.messageError ?? '',
                  color: colors.error500,
                  align: TextAlign.left))
        ]
      ],
    );
  }
}
