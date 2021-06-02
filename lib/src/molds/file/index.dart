import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:taiper_editor/src/molds/mold.dart';

class FileMold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileMoldState();
}

class _FileMoldState extends State<FileMold> with ClayblockMoldMixin {
  String src = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controllerSrc = getClayblockData(context).value;
    if (controllerSrc != src)
      setState(() {
        src = controllerSrc;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(src.split('/').last, textAlign: TextAlign.center),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(children: <Widget>[
            Expanded(
              child: FlatButton(
                  color: Theme.of(context).accentColor,
                  colorBrightness: Theme.of(context).accentColorBrightness,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.insert_drive_file)],
                  ),
                  onPressed: () => didTapFileButton(context)),
            ),
          ]),
        )
      ]),
    );
  }

  didTapFileButton(BuildContext context) async {
    try {
      var file = (await FilePicker.platform.pickFiles()).files.first;
      if (file != null) {
        updateValue(context, file.path);
        setState(() {
          src = file.path;
        });
      }
    } catch (e) {}
  }
}
