import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/index.dart' show Index;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        ),
        home: Index(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}

void main() {
  runApp(const App());
}
