import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_designer_patterns_factory/factories/android_dialog.dart';
import 'package:flutter_designer_patterns_factory/factories/dialog_action.dart';
import 'package:flutter_designer_patterns_factory/factories/idialog.dart';
import 'package:flutter_designer_patterns_factory/factories/ios_dialog.dart';

class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T> showAlertDialog<T>({
    Widget title,
    Widget content,
    List<DialogAction> actions,
    bool forceAndroid=false,
    bool forceIos=false
  }) {
    IDialog dialogData;

    if ((Platform.isIOS || forceIos) && !forceAndroid) {
      dialogData = IosDialog();
    } else if((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (context) => dialogData.create(
        context,
        title ?? Text('Não informado'),
        content ?? Text('Não informado'),
        actions ?? [],
      ),
    );
  }
}
