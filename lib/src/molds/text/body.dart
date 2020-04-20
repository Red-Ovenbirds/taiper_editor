import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyTextMold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<TextEditingController>(context, listen: false);
    return TextFormField(
      autofocus: true,
      controller: controller,
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
