
import 'package:flutter/material.dart';

import 'pages/routes.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData style = ThemeData(useMaterial3: true,
                                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent));
    return MaterialApp.router(routerConfig: appRouter, theme: style);
  }
}


void main() {
  runApp(const App());
}
