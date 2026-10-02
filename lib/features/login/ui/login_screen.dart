import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        _phoneController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 900;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (wide) const Expanded(flex: 5, child: _BrandPanel()),
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 420),
                            child: _form(context, showLogo: !wide),
                          ),
                        ),
                      ),
                      const PositionedDirectional(
                        top: 20,
                        end: 24,
                        child: LanguagePill(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _form(BuildContext context, {required bool showLogo}) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showLogo) ...[
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: AppLogo(size: 52),
            ),
            const SizedBox(height: 20),
          ],
          Text(
            context.tr('login_title'),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.tr('login_body'),
            style: const TextStyle(fontSize: 14, color: AppColors.muted),
          ),
          const SizedBox(height: 28),
          _label(context.tr('phone_label')),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: context.tr('phone_hint'),
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: AppColors.hint,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr('phone_required');
              }
              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return context.tr('phone_invalid');
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          _label(context.tr('password_label')),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            onFieldSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              hintText: context.tr('password_hint'),
              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.hint),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.hint,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr('password_required');
              }
              if (value.length < 8) {
                return context.tr('password_short');
              }
              return null;
            },
          ),
          const SizedBox(height: 28),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginStateSuccess) {
                context.pushReplacementNamed(Routes.dashboardScreen);
              } else if (state is LoginStateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorHandler.apiErrorModel.message ??
                          context.tr('unknown_error'),
                    ),
                    backgroundColor: AppColors.primaryDark,
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is LoginStateLoading
                  ? const SizedBox(
                      height: 52,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : FilledButton(
                      onPressed: _submit,
                      child: Text(context.tr('sign_in')),
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
      ),
    );
  }
}

/// Red panel beside the form on wide screens, with the app name and what it is for.
class _BrandPanel extends StatelessWidget {
  const _BrandPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.water_drop_rounded,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                context.tr('app_name'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            context.tr('app_role'),
            style: const TextStyle(
              fontSize: 36,
              height: 1.25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.tr('login_body'),
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final key in const [
                'nav_dashboard',
                'nav_inventory',
                'nav_past_requests',
              ])
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Text(
                    context.tr(key),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
