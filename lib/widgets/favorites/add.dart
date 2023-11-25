
import 'package:flutter/material.dart';

import '../../utils.dart';
import '../favorites/forms.dart';


/// Add a new favorite
class AddFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Adding a new favorite');
    return container(Center(child: NewFavoriteForm()), context);
  }
}
