import 'package:flutter/material.dart';
import 'package:navidart/pages/favorites.dart';


class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
  var pageIndex = 0;

  Widget active(index) {
    switch (index) {
      case 0: // Home page
        return Placeholder();
      case 1: // Show favorites
        return Favorites();
      default:
        throw UnimplementedError("no widget defined for $index");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page = active(pageIndex);
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(body: Row(children: [
            SafeArea(child: NavigationRail(
                     extended: constraints.maxWidth >= 600,
                     destinations: [NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home'),),
                                    NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites'),),],
                     selectedIndex: pageIndex,
                     onDestinationSelected: (value) {
                      setState(() { pageIndex = value; });
                     },),
            ),
            Expanded(child: Container(color: Theme.of(context).colorScheme.primaryContainer, child: page,),),
          ],
        ),
      );
    });
  }
}
