
import 'package:flutter/material.dart';

import '../utils.dart';


class Canvas extends StatefulWidget {
  final Widget page;
  const Canvas({required this.page, super.key}); // ctor

  @override
  State<Canvas> createState() => _CanvasState();
}


class _CanvasState extends State<Canvas> {
  @override
  Widget build(BuildContext context) {
    return container(widget.page, context);
  }
}