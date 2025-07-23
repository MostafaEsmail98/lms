import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/helpers/constants.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/features/auth/presentation/manager/auth_cubit.dart';

import '../../../../../core/di/sl.dart';
import '../../../../../core/theming/strings.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode nameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorSignUp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthLoadingSignUp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Loading..."),
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (state is AuthSuccessSignUp) {
              context.pushReplacement(AppRoutes.homeLayout);
            }
          },
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                nameFocusNode.unfocus();
                emailFocusNode.unfocus();
                passwordFocusNode.unfocus();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.backgroundSignIn, width: double.infinity),
                  const SizedBox(height: 20),
                  Text('Welcome to LMS', style: AppStyles.textBold24(context)),
                  const SizedBox(height: 10),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          AppTextFormField(
                            focusNode: nameFocusNode,
                            hintText: "Full Name",
                            controller:   nameController,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please enter your full name";
                              }
                              return null;
                            },
                            hintStyle: AppStyles.textSemiBold16(
                              context,
                            ).copyWith(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            focusNode: emailFocusNode,
                            controller: emailController,
                            hintText: "Email",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Please enter your email";
                              }
                              // Add more validation if needed
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
                              if (p0.length < 6) {
                                return "Password must be at least 6 characters";
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
                            buttonText: "Sign Up",
                            textStyle: AppStyles.textMedium20(context),
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                sl<AuthCubit>().signUp(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  nameController.text.trim(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(AppRoutes.signIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        AppStrings.haveAnAccount,
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
    );
  }
}
