import 'package:flutter/material.dart';


/// Wraps a widget around a container element
Widget container(w, ctx) {
  return Container(color: Theme.of(ctx).colorScheme.primaryContainer, child: w);
}