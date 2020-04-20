import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String confirmationText;
  final String cancelText;
  const ConfirmationDialog(
      {Key key, this.message, this.confirmationText, this.cancelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Text(message),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            cancelText,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        FlatButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(confirmationText)),
      ],
    );
  }
}
