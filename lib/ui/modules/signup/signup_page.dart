import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/utils/app_colors.dart';
import 'components/input_garden.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool confirmPasswordError = false;

  void checkPasswordMatch() {
    setState(() {
      confirmPasswordError =
          passwordController.text != confirmPasswordController.text;
    });
  }

  void register() {
    checkPasswordMatch();

    if (!confirmPasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro realizado com sucesso')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    confirmPasswordController.addListener(checkPasswordMatch);
  }

  @override
  void dispose() {
    confirmPasswordController.removeListener(checkPasswordMatch);
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(
                    'lib/ui/assets/images/logo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Register Account \nto',
                        style: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' PLANT',
                        style: TextStyle(
                            color: AppColors.primaryGreenColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 30),
                  child: Text(
                    'Hello there, register to continue',
                    style: TextStyle(
                        fontSize: 14, color: AppColors.secondaryGreyColor),
                  ),
                ),
                InputGarden(
                  label: 'First Name',
                  inputController: firstNameController,
                ),
                InputGarden(
                  label: 'Last Name',
                  inputController: lastNameController,
                ),
                InputGarden(
                  label: 'Email Address',
                  inputController: emailController,
                ),
                InputGarden(
                  label: 'Password',
                  inputController: passwordController,
                  activeObscure: true,
                ),
                InputGarden(
                  label: 'Confirm Password',
                  inputController: confirmPasswordController,
                  hasExternalError: confirmPasswordError,
                  activeObscure: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 26,
                      child: Checkbox(
                        activeColor: AppColors.primaryGreenColor,
                        value: true,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the',
                              style:
                                  TextStyle(color: AppColors.primaryDarkColor),
                            ),
                            TextSpan(
                              text: ' Terms & Conditions & Privacy Policy',
                              style: TextStyle(
                                color: AppColors.primaryGreenColor,
                              ),
                            ),
                            TextSpan(
                              text: ' set out by this site.',
                              style:
                                  TextStyle(color: AppColors.primaryDarkColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryGreenColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: register,
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: AppColors.primaryWhiteColor, fontSize: 16),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.primaryGreyColor,
                      ),
                    ),
                    Text(
                      ' Or continue with social account ',
                      style: TextStyle(color: AppColors.secondaryGreyColor),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.primaryGreyColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.primaryWhiteColor,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.primaryGreyColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: null,
                          label: const Text(
                            'GOOGLE',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryDarkColor),
                          ),
                          icon: SvgPicture.asset(
                            height: 24,
                            width: 24,
                            'lib/ui/assets/icons/google.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.primaryWhiteColor,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: AppColors.primaryGreyColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: null,
                          label: const Text(
                            'FACEBOOK',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryDarkColor),
                          ),
                          icon: SvgPicture.asset(
                            height: 24,
                            width: 24,
                            'lib/ui/assets/icons/facebook.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: AppColors.primaryDarkColor),
                        ),
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: AppColors.primaryGreenColor,
                          ),
                        ),
                      ],
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
