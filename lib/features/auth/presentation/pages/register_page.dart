import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref
        .read(registerViewModelProvider.notifier)
        .register(
          email: _emailController.text.trim(),
          username: _usernameController.text.trim(),
          password: _passwordController.text,
          fullName: _fullNameController.text.trim(),
        );

    if (!mounted) return;

    if (success) {
      context.go('/main');
    } else {
      final errorMessage = ref.read(registerViewModelProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage ?? 'Registration failed'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.space24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.space24),

                // Subtitle
                Text(
                      'Join us to start managing your finances better',
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.grey600),
                    )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppDimensions.space32),

                // Full Name Field
                TextFormField(
                      controller: _fullNameController,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) =>
                          Validators.required(value, fieldName: 'Full name'),
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Username Field
                TextFormField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          Validators.required(value, fieldName: 'Username'),
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Choose a username',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Email Field
                TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: Validators.email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Password Field
                TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.next,
                      validator: Validators.password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Create a password',
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
                    .fadeIn(delay: 500.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Confirm Password Field
                TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      textInputAction: TextInputAction.done,
                      validator: _validateConfirmPassword,
                      onFieldSubmitted: (_) => _handleRegister(),
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),

                const SizedBox(height: AppDimensions.space32),

                // Register Button
                ElevatedButton(
                      onPressed: state.isLoading ? null : _handleRegister,
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
                          : const Text('Create Account'),
                    )
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 600.ms)
                    .slideY(begin: 0.3, end: 0)
                    .shimmer(delay: 1300.ms, duration: 1000.ms),

                const SizedBox(height: AppDimensions.space24),

                // Terms and Privacy
                Text(
                  'By creating an account, you agree to our\nTerms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.grey500),
                ).animate().fadeIn(delay: 800.ms, duration: 600.ms),

                const SizedBox(height: AppDimensions.space32),

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('Sign In'),
                    ),
                  ],
                ).animate().fadeIn(delay: 900.ms, duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
