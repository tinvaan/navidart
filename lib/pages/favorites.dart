import 'package:flutter/material.dart';

import '../widgets/favorites/add.dart' show AddFavorites;
import '../widgets/favorites/show.dart' show ShowFavorites;
import '../widgets/favorites/empty.dart' show EmptyFavorites;


class Favorites extends StatefulWidget {
  @override
  State<Favorites> createState() => _FavoritesState();
}


class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(body: Row(mainAxisSize: MainAxisSize.min,
                                children: [EmptyFavorites(), AddFavorites(), ShowFavorites()],));
    });
  }
}
