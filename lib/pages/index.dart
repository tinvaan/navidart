import 'package:flutter/material.dart';

import '../widgets/canvas.dart';
import '../widgets/navbar.dart';


class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: Placeholder()))]));
    });
  }
}
