import 'package:flutter/material.dart';

import '../../../utils/size/size_config.dart';

class MiddleModalTemplate {
  middleModal(context, Widget child, Color? color) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.25),
      builder: (BuildContext context) {
        return Center(
            child: Material(
                borderRadius: BorderRadius.all(
                    Radius.circular(3 * SizeConfig.widthMultiplier)),
                type: MaterialType.transparency,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 5 * SizeConfig.heightMultiplier),
                  child: Container(
                    width: 90 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                      color: color ?? Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(3 * SizeConfig.widthMultiplier)),
                    ),
                    child: child,
                  ),
                )));
      },
    );
  }
}

MiddleModalTemplate middleModals = MiddleModalTemplate();
