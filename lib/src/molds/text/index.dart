import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taiper_editor/src/molds/mold.dart';
import 'title.dart';
import 'body.dart';

class TextMold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextMoldState();
}

class _TextMoldState extends State<TextMold> with ClayblockMoldMixin {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final data = getClayblockData(context);
    controller.text = data.value;
    controller.addListener( () {
      updateValue(context, controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = getClayblockData(context);
    final modifier = data.type.contains("/") ? data.type.split("/")[1] : null;

    Widget mold = BodyTextMold();
    if (modifier == "title") {
      mold = TitleTextMold();
    }
    return ListenableProvider.value(value: controller, child: mold);
  }
}
