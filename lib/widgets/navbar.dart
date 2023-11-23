
import 'package:flutter/material.dart';


class Navbar extends StatefulWidget {
  final BoxConstraints constraints;
  const Navbar({required this.constraints, super.key}); // ctor

  @override
  State<Navbar> createState() => _NavbarState();
}


class _NavbarState extends State<Navbar> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> pages = [
      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
      NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites'))
    ];
    return NavigationRail(
      destinations: pages,
      selectedIndex: _index,
      extended: widget.constraints.maxWidth >= 600,
      onDestinationSelected: (value) { setState(() { _index = value; }); },
    );
  }
}