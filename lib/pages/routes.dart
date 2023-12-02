
import 'package:go_router/go_router.dart';

import '../pages/index.dart';
import '../pages/favorites/create.dart';
import '../pages/favorites/display.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => Index()),
    GoRoute(path: '/favorites', builder: (context, state) => Display()),
    GoRoute(path: '/favorites/add',
            builder: (context, state) => Create(name: state.uri.queryParameters['name'],
                                                phone: state.uri.queryParameters['phone']))
  ]
);
