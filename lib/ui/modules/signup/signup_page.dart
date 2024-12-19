import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/domain/validators/email_validator.dart';
import 'package:my_garden/domain/validators/name_validator.dart';
import 'package:my_garden/domain/validators/password_validator.dart';
import 'package:my_garden/shared/components/custom_button.dart';
import '../../helpers/i18n/resources.dart';
import '../../../shared/utils/app_colors.dart';
import '../../../shared/components/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    'lib/ui/assets/images/logo.svg',
                    height: 65,
                    width: 58,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 6),
                  child: Text(
                    R.string.signUpPageTitle,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  R.string.subTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryGreenColor,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 12,
                    children: [
                      CustomTextField(
                        label: R.string.nameLabel,
                        inputController: firstNameController,
                        validator: (value) =>
                            NameValidator.validate(value ?? ''),
                      ),
                      CustomTextField(
                        label: R.string.lastNameLabel,
                        inputController: lastNameController,
                        validator: (value) =>
                            NameValidator.lastNameValidate(value ?? ''),
                      ),
                      CustomTextField(
                        label: R.string.emailLabel,
                        inputController: emailController,
                        validator: (value) =>
                            EmailValidator.validate(value ?? ''),
                      ),
                      CustomTextField(
                        label: R.string.passwordLabel,
                        inputController: passwordController,
                        isSecret: true,
                        validator: (value) =>
                            PasswordValidator.validate(value ?? ''),
                      ),
                      CustomTextField(
                        label: R.string.confirmPasswordLabel,
                        inputController: confirmPasswordController,
                        validator: (value) => PasswordValidator.confirmPassword(
                            passwordController.text,
                            confirmPasswordController.text),
                        isSecret: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 32),
                  child: RichText(
                    text: TextSpan(
                      text: R.string.termsAndConditions,
                      style: const TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: R.string.termsAndConditionsButton,
                          style: const TextStyle(
                            color: AppColors.primaryGreenColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  label: R.string.registerTextButton,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      return;
                    }
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      R.string.messageLogin,
                      style: const TextStyle(
                        color: AppColors.secondaryGreyColor,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        R.string.loginTextButton,
                        style: const TextStyle(
                          color: AppColors.primaryGreenColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
