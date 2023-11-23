import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/canvas.dart';
import '../widgets/navbar.dart';
import '../widgets/favorites/add.dart' show AddFavorites;
import '../widgets/favorites/show.dart' show ShowFavorites;
import '../widgets/favorites/empty.dart' show EmptyFavorites;


/// Stateful widgets
class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}

class Create extends StatefulWidget {
  @override
  State<Create> createState() => _CreateState();
}


/// Stateful widget states
class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> params = GoRouterState.of(context).uri.queryParameters;
    Widget page = params.keys.contains('empty') ? ShowFavorites() : EmptyFavorites();

    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: page))]));
    });
  }
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: AddFavorites()))]));
    });
  }
}
