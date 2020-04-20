import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taiper_editor/src/controller.dart';
import 'package:taiper_editor/src/lister.dart';

class TaiperEditorContainer extends StatefulWidget {
  final TaiperEditingController controller;

  const TaiperEditorContainer({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaiperEditorContainerState();
}

class _TaiperEditorContainerState extends State<TaiperEditorContainer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget.controller != null
            ? widget.controller
            : TaiperEditingController([]),
            child: MoldLister());
  }
}