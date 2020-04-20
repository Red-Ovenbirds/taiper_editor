import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleTextMold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    return TextFormField(
        autofocus: true,
        controller: controller,
        style: Theme.of(context).textTheme.title,
        maxLines: null,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        });
  }
}
