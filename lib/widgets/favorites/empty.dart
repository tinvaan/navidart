import 'package:flutter/material.dart';


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
        Row(mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.person_add),
                label: Text('Add New'),
                onPressed: () {
                  // setState(() { add(app); });
                },
              ),
            ],
        ),
      ],
    ),);
  }
}
