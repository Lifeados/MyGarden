import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
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

  final _remoteLoadAuthentication = RemoteLoadAuthentication();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSignIn() async {
    try {
      await _remoteLoadAuthentication.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  void handleGoogleSignIn() async {
    try {
      final user = await _remoteLoadAuthentication.signInWithGoogle();

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao autenticar com o Google')),
      );
    }
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
                    spacing: 12,
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
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: CustomButton(
                    label: R.string.loginTextButton,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        handleSignIn();
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
                  padding: const EdgeInsets.only(top: 32, bottom: 32),
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
                    onPressed: () {
                      handleGoogleSignIn();
                    },
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
