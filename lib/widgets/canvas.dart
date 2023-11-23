
import 'package:flutter/material.dart';

import '../utils.dart';


class Canvas extends StatefulWidget {
  @override
  State<Canvas> createState() => _CanvasState();
}


class _CanvasState extends State<Canvas> {
  Widget _page = Placeholder();

  @override
  Widget build(BuildContext context) {
    return container(_page, context);
  }
}