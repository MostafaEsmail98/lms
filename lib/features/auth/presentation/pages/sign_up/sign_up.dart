import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/helpers/constants.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:lms/core/theming/styles.dart';

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

    return Scaffold(
      body: SingleChildScrollView(
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
    );
  }
}
