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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    R.string.signInPageTitle,
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
                  child: CustomButton(
                    label: R.string.loginButton,
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.primaryWhiteColor),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        print('Tudo certo, logar');
                      }
                    },
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
                        color: AppColors.secondaryGreyColor,
                        fontSize: 15,
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
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
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
