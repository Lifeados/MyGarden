import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_garden/domain/validators/email_validator.dart';
import 'package:my_garden/domain/validators/password_validator.dart';
import 'package:my_garden/shared/components/custom_button.dart';
import '../../../shared/utils/app_colors.dart';
import '../../helpers/i18n/resources.dart';
import '../../../shared/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    height: 75,
                    width: 68,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: R.string.loginPageTitle,
                          style: const TextStyle(
                            color: AppColors.primaryDarkColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: R.string.loginPageTitleAppName,
                          style: const TextStyle(
                            color: AppColors.primaryGreenColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  R.string.loginPageSubTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16,
                    children: [
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
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Text(
                      R.string.forgotPassword,
                      style: const TextStyle(
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 20),
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.primaryGreenColor,
                        foregroundColor: AppColors.primaryWhiteColor,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          print('Tudo certo, logar');
                        }
                      },
                      child: Text(
                        R.string.loginButton,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.secondaryGreyColor,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      R.string.alternativeLoginMessage,
                      style: const TextStyle(
                        color: AppColors.secondaryGreyColor,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.secondaryGreyColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 52),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomButton(
                          icon: SvgPicture.asset(
                            'lib/ui/assets/icons/google.svg',
                            width: 26,
                          ),
                          label: 'Google',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryDarkColor,
                          ),
                          isOutlined: true,
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          icon: Image.asset(
                            'lib/ui/assets/icons/facebook.png',
                            width: 24,
                          ),
                          label: 'Facebook',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryDarkColor,
                          ),
                          isOutlined: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      R.string.messageRegister,
                      style: const TextStyle(
                        color: AppColors.primaryDarkColor,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        R.string.registerTextButton,
                        style: const TextStyle(
                          color: AppColors.primaryGreenColor,
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
