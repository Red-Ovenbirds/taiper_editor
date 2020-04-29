import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../taiper_editor.dart';
import 'molds/index.dart';

class MoldLister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaiperEditingController>(
        builder: (context, controller, child) {
      List<Widget> rows = createRows(controller);
      return ReorderableListView(
          header: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
            child: Text("Pressione e segure para mudar os itens de ordem", textAlign: TextAlign.center,),
          ),
          children: rows,
          onReorder: (oldIndex, newIndex) =>
              //Changing instantly caused bug where global keys were still duplicated
              //Probably because of the move transition
              Future.delayed(Duration(milliseconds: 50), () {
                controller.moveEntry(oldIndex, newIndex);
              }));
    });
  }

  List<Widget> createRows(TaiperEditingController controller) {
    final entries = controller.data.asMap().entries;
    return entries
        .map((entry) => MultiProvider(providers: [
              Provider.value(value: entry.value),
              //Index is also being provided because
              //TaiperEditingController methods require it 
              Provider.value(value: entry.key)
            ], key: controller.keys[entry.key], child: ClayblockMold()))
        .toList();
  }
}
