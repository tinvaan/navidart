
import 'package:go_router/go_router.dart';

import '../pages/index.dart';
import '../pages/favorites.dart' as favorites;


final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => Index()),
    GoRoute(path: '/favorites', builder: (context, state) => favorites.Display()),
    GoRoute(path: '/favorites/add',
            builder: (context, state) => favorites.Create(name: state.uri.queryParameters['name'],
                                                          phone: state.uri.queryParameters['phone']))
  ]
);
