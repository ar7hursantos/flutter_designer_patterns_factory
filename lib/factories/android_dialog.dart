import 'package:flutter/material.dart';
import 'package:flutter_designer_patterns_factory/factories/dialog_action.dart';
import 'package:flutter_designer_patterns_factory/factories/idialog.dart';

class AndroidDialog implements IDialog {
  
  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions?.map((a) {
        return FlatButton(
          child: a.child,
          onPressed: a.onPressed,
        );
      })?.toList(),
    );
  }
}
