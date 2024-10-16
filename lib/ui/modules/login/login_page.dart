import 'package:flutter/material.dart';
import '../../../shared/utils/app_colors.dart';
import '../signup/components/input_garden.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: Image.asset(
                    'lib/ui/assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome Back 👋 \nto',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' PLANT',
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 30),
                  child: Text(
                    'Hello there, login to continue',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const InputGarden(
                  label: 'Email Address',
                  obscure: false,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: InputGarden(
                    label: 'Password',
                    obscure: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Alinha à direita
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AppColors.primaryGreenColor, // Cor do texto
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
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
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      ' Or continue with social account ',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade400,
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
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: null,
                          label: const Text(
                            'GOOGLE',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          icon: Image.asset(
                            'lib/ui/assets/icons/google.png',
                            height: 24,
                            width: 24,
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
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: null,
                          label: const Text(
                            'FACEBOOK',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          icon: Image.asset(
                            'lib/ui/assets/icons/facebook.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 54),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn’t have an account?',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' Register',
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
