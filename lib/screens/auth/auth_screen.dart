import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  ConsumerState<AuthScreen> createState() =>
      _AuthScreenState();
}

class _AuthScreenState
    extends ConsumerState<AuthScreen> {
  // Controllers
  final _emailController =
  TextEditingController();

  final _passwordController =
  TextEditingController();

  // Form key
  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();

  bool isLogin = true;

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      final auth =
      ref.read(authServiceProvider);

      if (isLogin) {
        await auth.signIn(
          email:
          _emailController.text.trim(),

          password:
          _passwordController.text.trim(),
        );
      } else {
        await auth.register(
          email:
          _emailController.text.trim(),

          password:
          _passwordController.text.trim(),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
            const EdgeInsets.all(32),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const Icon(
                    Icons.movie_creation,
                    size: 90,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    isLogin
                        ? 'Welcome Back'
                        : 'Create Account',

                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    isLogin
                        ? 'Login to continue'
                        : 'Register new account',

                    style: TextStyle(
                      color:
                      Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // EMAIL
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 10,
                    ),

                    child: TextFormField(
                      controller:
                      _emailController,

                      keyboardType:
                      TextInputType
                          .emailAddress,

                      textCapitalization:
                      TextCapitalization
                          .none,

                      autocorrect: false,

                      decoration:
                      const InputDecoration(
                        border:
                        OutlineInputBorder(),

                        hintText:
                        'Email Address',

                        prefixIcon:
                        Icon(Icons.email),
                      ),

                      validator: (
                          String? value,
                          ) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Email Required';
                        }

                        if (!value.contains('@')) {
                          return 'Invalid Email';
                        }

                        return null;
                      },
                    ),
                  ),

                  // PASSWORD
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 10,
                    ),

                    child: TextFormField(
                      controller:
                      _passwordController,

                      obscureText: true,

                      keyboardType:
                      TextInputType
                          .visiblePassword,

                      textCapitalization:
                      TextCapitalization
                          .none,

                      autocorrect: false,

                      decoration:
                      const InputDecoration(
                        border:
                        OutlineInputBorder(),

                        hintText: 'Password',

                        prefixIcon:
                        Icon(Icons.lock),
                      ),

                      validator: (
                          String? value,
                          ) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Password Required';
                        }

                        if (value.length < 6) {
                          return 'Minimum 6 characters';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,

                    height: 55,

                    child: FilledButton(
                      onPressed:
                      isLoading
                          ? null
                          : submit,

                      child:
                      isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                        isLogin
                            ? 'Login'
                            : 'Register',
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },

                    child: Text(
                      isLogin
                          ? 'Create Account'
                          : 'Already have account?',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}