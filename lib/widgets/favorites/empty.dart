import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class EmptyFavorites extends StatefulWidget {
  @override
  State<EmptyFavorites> createState() => _EmptyFavoritesState();
}


/// Show an empty favorites prompt
class _EmptyFavoritesState extends State<EmptyFavorites> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No favorites yet.'),
        SizedBox(height: 10),
        ElevatedButton.icon(
          label: Text('Add New'),
          icon: Icon(Icons.person_add),
          onPressed: () { setState(() { context.go('/favorites/add'); });}
        )
      ],
    ),);
  }
}
