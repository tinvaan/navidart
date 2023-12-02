
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/canvas.dart';
import '../widgets/navbar.dart';
import '../widgets/favorites/add.dart' show AddFavorites;
import '../widgets/favorites/show.dart' show ShowFavorites;
import '../widgets/favorites/empty.dart' show EmptyFavorites;


/// Stateful widgets
class Create extends StatefulWidget {
  final String? name;
  final String? phone;

  // ctor
  Create({super.key, this.name, this.phone});

  @override
  State<Create> createState() => _CreateState();
}

class Display extends StatefulWidget {
  @override
  State<Display> createState() => _DisplayState();
}


/// Stateful widget states
class _CreateState extends State<Create> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: AddFavorites(name: widget.name, phone: widget.phone)))]));
    });
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
    });
  }
}

class _DisplayState extends State<Display> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    Widget page = favorites.isEmpty ? EmptyFavorites() : ShowFavorites();
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Scaffold(body: Row(children: [SafeArea(child: Navbar(constraints: constraints,)),
                                           Expanded(child: Canvas(page: page))]));
    });
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favorites = prefs.getStringList('favorites') ?? [];
    });
  }
}
