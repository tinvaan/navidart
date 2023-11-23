
import 'package:flutter/material.dart';

import '../favorites/forms.dart';


/// Add a new favorite
class AddFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Adding a new favorite');
    return Center(child: NewFavoriteForm());
  }
}
