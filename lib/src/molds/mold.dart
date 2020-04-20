import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taiper/taiper.dart';
import 'package:taiper_editor/src/widgets/confirmation_dialog.dart';
import 'package:taiper_editor/taiper_editor.dart';
import 'index.dart';

class ClayblockMold extends StatelessWidget {
  final Map<String, Widget> molds = {
    "text": TextMold(),
    //will be populated with each
    //correspondent Clayblock strings
  };

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ClayblockData>(context, listen: false);
    final type = data.type.split("/")[0];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(Icons.drag_handle), onPressed: null),
        SizedBox(width: 4),
        Expanded(child: molds[type] ?? TextMold()),
        SizedBox(width: 4),
        IconButton(
            color: Theme.of(context).errorColor,
            icon: Icon(Icons.delete),
            onPressed: () async {
              bool response = await showDialog(
                  context: context, builder: (context) => ConfirmationDialog(message: "Deseja realmente remover este item?", confirmationText: "Excluir", cancelText: "Cancelar",));
              if (response) {
                final controller = Provider.of<TaiperEditingController>(context,
                    listen: false);
                final index = Provider.of<int>(context, listen: false);
                controller.removeEntry(index);
              }
            })
      ],
    );
  }
}
