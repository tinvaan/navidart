
import 'package:flutter/material.dart';

import '../../utils.dart';
import '../favorites/forms.dart';

import '../../pages/favorites.dart' show Display;


/// Add a new favorite
class AddFavorites extends StatefulWidget {
  final String? name;
  final String? phone;

  // ctor
  AddFavorites({super.key, this.name, this.phone});

  @override
  State<AddFavorites> createState() => _AddFavoritesState();
}

class _AddFavoritesState extends State<AddFavorites> {
  @override
  Widget build(BuildContext context) {
    if (widget.name == null || widget.phone == null) {
      return container(Center(child: NewFavoriteForm()), context);
    }

    print('Adding a new favorite(${widget.name}, ${widget.phone})');
    return container(Center(child: Display()), context);
  }
}
