
import 'package:flutter/material.dart';

import '../../utils.dart';
import '../favorites/forms.dart';


/// Add a new favorite
class AddFavorites extends StatelessWidget {
  final String? name;
  final String? phone;

  // ctor
  AddFavorites({super.key, this.name, this.phone});

  @override
  Widget build(BuildContext context) {
    print('Adding a new favorite($name, $phone)');
    return container(Center(child: NewFavoriteForm()), context);
  }
}
