import 'package:flutter/material.dart';
import 'package:lms/core/helpers/constants.dart';
import 'package:lms/core/theming/strings.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/core/widgets/app_text_button.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    return Scaffold(
      body: Form(
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
                Image.asset(Assets.backgroundSignIn, width: double.infinity),
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
                        hintText: "Email",
                        validator: (p0) {},
                        hintStyle: AppStyles.textSemiBold16(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        focusNode: passwordFocusNode,
                        hintText: "Password",
                        validator: (p0) {},
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {},
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
    );
  }
}
