import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final themeMode =
    ref.watch(themeProvider);

    final isDark =
        themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(24),

              color:
              Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,
            ),

            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Movie Explorer',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Track your favorite movies',
                  style: TextStyle(
                    color:
                    Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          SwitchListTile(
            value: isDark,

            onChanged: (value) {
              ref
                  .read(
                themeProvider.notifier,
              )
                  .toggleTheme(value);
            },

            secondary: const Icon(
              Icons.dark_mode,
            ),

            title: const Text(
              'Dark Mode',
            ),
          ),
        ],
      ),
    );
  }
}