import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
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

class Remove extends StatefulWidget {
  @override
  State<Remove> createState() => _RemoveState();
}


/// Stateful widget states
class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> params = GoRouterState.of(context).uri.queryParameters;
    Widget page = params.keys.contains('empty') ? ShowFavorites() : EmptyFavorites();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(body: Row(mainAxisSize: MainAxisSize.min,
                                children: [container(page, context),],));
    });
  }
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(body: Row(mainAxisSize: MainAxisSize.min,
                                children: [container(AddFavorites(), context)],));
    });
  }
}

// TODO: Implement remove screen {iff required}
class _RemoveState extends State<Remove> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(body: Row(mainAxisSize: MainAxisSize.min,
                                children: [container(EmptyFavorites(), context)],));
    });
  }
}
