import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  void showAlert({
    required BuildContext context,
    required String title,
    required Widget child,
    VoidCallback? onCancel,
    VoidCallback? onAccept,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title, style: TextStyle(color: primaryColor)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Divider(color: primaryColor), child],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                if (onCancel != null) {
                  onCancel();
                }
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Accept'),
              onPressed: () {
                if (onAccept != null) {
                  onAccept();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
      barrierDismissible: true,
    );
  }

  void showSnackBar({
    required BuildContext context,
    required String message,
    int? duration,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor,
        content: Text(message),
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }
}
