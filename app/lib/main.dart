import 'package:flutter/material.dart';
import 'package:flutter_memo/logger.dart';
import 'package:flutter_memo/ui/page/details.dart';
import 'package:flutter_memo/ui/page/home.dart';
import 'package:flutter_memo/ui/page/note.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(
      ProviderScope(
        observers: [RiverpodLogger()],
        child: const MyApp(),
      ),
    );

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'note',
          builder: (context, state) => const NotePage(),
        ),
        GoRoute(
          path: 'detail/:noteId',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['noteId'] ?? '');
            return DetailPage(id);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
