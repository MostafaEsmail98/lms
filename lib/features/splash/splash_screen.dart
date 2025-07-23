import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/helpers/constants.dart';
import 'package:lms/core/helpers/shared_pref_helper.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:lms/core/theming/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    final token = await SharedPrefHelper.getSecuredString("token");

    await Future.delayed(const Duration(seconds: 2));
    if (token.isNotEmpty) {
      if (context.mounted) {
        context.pushReplacement(AppRoutes.homeLayout);
      }
    } else {
      if (context.mounted) {
        context.pushReplacement(AppRoutes.signIn);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.backgroundSignIn, width: double.infinity),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text('Welcome to Our App', style: AppStyles.textBold24(context)),
          ],
        ),
      ),
    );
  }
}
