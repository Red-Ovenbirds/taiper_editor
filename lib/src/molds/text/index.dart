import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taiper/taiper.dart';
import 'package:taiper_editor/taiper_editor.dart';
import 'title.dart';
import 'body.dart';

class TextMold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextMoldState();
}

class _TextMoldState extends State<TextMold> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final data = Provider.of<ClayblockData>(context, listen: false);
    controller.text = data.value;
    controller.addListener( () {
      final editingController = Provider.of<TaiperEditingController>(context, listen: false);
      final index = Provider.of<int>(context, listen: false);
      
      data.value = controller.text;

      editingController.updateEntry(index, data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ClayblockData>(context, listen: false);
    final modifier = data.type.contains("/") ? data.type.split("/")[1] : null;

    Widget mold = BodyTextMold();
    if (modifier == "title") {
      mold = TitleTextMold();
    }
    return ListenableProvider.value(value: controller, child: mold);
  }
}
