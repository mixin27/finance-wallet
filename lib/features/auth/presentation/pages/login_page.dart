import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref
        .read(loginViewModelProvider.notifier)
        .login(_emailController.text.trim(), _passwordController.text);

    if (!mounted) return;

    if (success) {
      context.go('/main');
    } else {
      final errorMessage = ref.read(loginViewModelProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage ?? 'Login failed'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.space24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.space48),

                // Logo/Icon
                Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 80,
                      color: AppColors.primary,
                    )
                    .animate()
                    .scale(
                      delay: 100.ms,
                      duration: 500.ms,
                      curve: Curves.elasticOut,
                    )
                    .shimmer(delay: 600.ms, duration: 800.ms),

                const SizedBox(height: AppDimensions.space24),

                // Title
                Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey900,
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: AppDimensions.space8),

                Text(
                      'Sign in to continue',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.grey500),
                    )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: AppDimensions.space48),

                // Email Field
                TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Password Field
                TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      validator: Validators.password,
                      onFieldSubmitted: (_) => _handleLogin(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space24),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // todo(mixin27): Implement forgot password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot password coming soon!'),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ).animate().fadeIn(delay: 800.ms, duration: 600.ms),

                const SizedBox(height: AppDimensions.space24),

                // Login Button
                ElevatedButton(
                      onPressed: state.isLoading ? null : _handleLogin,
                      child: state.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.white,
                                ),
                              ),
                            )
                          : const Text('Sign In'),
                    )
                    .animate()
                    .fadeIn(delay: 900.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0)
                    .shimmer(delay: 1500.ms, duration: 1000.ms),

                const SizedBox(height: AppDimensions.space32),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.space16,
                      ),
                      child: Text(
                        'OR',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.grey400,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),

                const SizedBox(height: AppDimensions.space24),

                // Register Button
                OutlinedButton(
                      onPressed: () {
                        context.push('/register');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.space16,
                        ),
                      ),
                      child: const Text('Create Account'),
                    )
                    .animate()
                    .fadeIn(delay: 1100.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0),

                const SizedBox(height: AppDimensions.space48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
