import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/theme_provider.dart';

import '../../providers/auth_provider.dart';
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

                Text(
                  ref
                      .read(authServiceProvider)
                      .currentUser
                      ?.email ??
                      'No Email',

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerLeft,

                  child: TextButton.icon(
                    onPressed: () async {
                      await ref
                          .read(authServiceProvider)
                          .signOut();
                    },

                    icon: const Icon(
                      Icons.logout,
                    ),

                    label: const Text(
                      'Logout',
                    ),
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
          ListTile(
            leading: const Icon(
              Icons.chat,
            ),

            title: const Text(
              'Movie Chat',
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),

            onTap: () {
              context.push('/chat');
            },
          ),
        ],
      ),
    );
  }
}