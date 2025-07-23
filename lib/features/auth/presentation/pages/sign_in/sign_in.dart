import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/helpers/constants.dart';
import 'package:lms/core/theming/strings.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/features/auth/presentation/manager/auth_cubit.dart';

import '../../../../../core/di/sl.dart';
import '../../../../../core/routing/app_router.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorSignIn) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthLoadingSignIn) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Loading..."),
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (state is AuthSuccessSignIn) {
              context.pushReplacement(AppRoutes.homeLayout);
            }
          },
          child: Form(
            key: formKey,
            child: GestureDetector(
              onTap: () {
                emailFocusNode.unfocus();
                passwordFocusNode.unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.backgroundSignIn,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppStrings.welcomeBack2,
                      style: AppStyles.textBold24(
                        context,
                      ).copyWith(color: Colors.black87),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          AppTextFormField(
                            focusNode: emailFocusNode,
                            controller: emailController,
                            hintText: "Email",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            hintStyle: AppStyles.textSemiBold16(
                              context,
                            ).copyWith(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            hintText: "Password",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            hintStyle: AppStyles.textSemiBold16(
                              context,
                            ).copyWith(color: Colors.grey),
                            isObscureText: true,
                          ),
                          const SizedBox(height: 20),
                          AppTextButton(
                            buttonWidth: MediaQuery.sizeOf(context).width * .5,
                            buttonText: "Sign In",
                            textStyle: AppStyles.textMedium20(context),
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                sl<AuthCubit>().signIn(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        context.push(AppRoutes.signUp);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          AppStrings.dontHaveAnAccount,
                          style: AppStyles.textSemiBold16(
                            context,
                          ).copyWith(color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
