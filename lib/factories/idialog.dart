import 'package:flutter/material.dart';
import 'package:flutter_designer_patterns_factory/factories/dialog_action.dart';

abstract class IDialog {

  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction> actions);


}