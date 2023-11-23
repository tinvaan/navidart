
import 'package:flutter/material.dart';


/// Add a new favorite
class AddFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Adding a new favorite');
    var name = TextEditingController();
    var number = TextEditingController();

    return Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Add a new favorite'),
          SizedBox(height: 10),
          TextField(controller: name),
          SizedBox(height: 10),
          TextField(controller: number),
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.edit_note))
        ]
      )
    );
  }
}
