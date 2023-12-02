
import 'package:flutter/material.dart';


/// Display an alert dialog
Widget alert(BuildContext ctx,  title, List<String> messages) {
  List<Text> texts = messages.map((m) => Text(m)).toList();
  return AlertDialog(title: Text(title),
                     content: SingleChildScrollView(child: ListBody(children: texts)),
                     actions: [TextButton(child: Text('Close'), onPressed: () => Navigator.of(ctx, rootNavigator: true).pop('Close'))]
  );
}


/// Wraps a widget around a container element
Widget container(w, ctx) {
  return Container(color: Theme.of(ctx).colorScheme.primaryContainer, child: w);
}