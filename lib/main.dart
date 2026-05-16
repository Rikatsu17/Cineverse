import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'providers/theme_provider.dart';

import 'router/app_router.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions
        .currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: CineVerseApp(),
    ),
  );
}
class CineVerseApp extends ConsumerWidget {
  const CineVerseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'CineVerse',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),

      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),

      themeMode:
      ref.watch(themeProvider),

      routerConfig: appRouter,
    );
  }
}