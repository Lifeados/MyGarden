import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class InputGarden extends StatefulWidget {
  final TextEditingController? inputController;
  final String label;

  final bool activeObscure;

  final bool hasExternalError;
  final Function()? validateInput;

  const InputGarden({
    super.key,
    required this.label,
    required this.inputController,
    this.validateInput,
    this.hasExternalError = false,
    this.activeObscure = false,
  });

  @override
  State<InputGarden> createState() => InputGardenState();
}

class InputGardenState extends State<InputGarden> {
  String? errorText;
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.activeObscure;
  }

  bool isValidEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  void validateInput() {
    String input = widget.inputController?.text ?? '';
    setState(
      () {
        if (widget.label == 'Email Address') {
          if (!isValidEmail(input)) {
            errorText = 'Por favor, insira um email válido';
            if (widget.validateInput != null) {
              widget.validateInput!();
            }
          } else {
            errorText = null;
          }
        } else if (widget.label == 'Password') {
          if (!isValidPassword(input)) {
            errorText = 'A senha deve ter pelo menos 6 caracteres';
            if (widget.validateInput != null) {
              widget.validateInput!();
            }
          } else {
            errorText = null;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool showError = errorText != null || widget.hasExternalError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, bottom: 6, right: 10),
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(
              color: showError
                  ? AppColors.errorColor
                  : AppColors.primaryGreenColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: widget.label == 'Email Address'
                ? TextInputType.emailAddress
                : TextInputType.text,
            controller: widget.inputController,
            obscureText: isObscure,
            decoration: InputDecoration(
              suffixIcon: widget.activeObscure
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          isObscure
                              ? 'lib/ui/assets/icons/closed_eye.svg'
                              : 'lib/ui/assets/icons/open_eye.svg',
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryDarkColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    )
                  : null,
              border: InputBorder.none,
              labelText: widget.label,
              labelStyle: TextStyle(
                fontSize: 14,
                color: showError
                    ? AppColors.errorColor
                    : AppColors.primaryGreenColor,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onChanged: (_) => validateInput(),
          ),
        ),
        showError
            ? Padding(
                padding: const EdgeInsets.only(top: 1.5, bottom: 1.5, left: 20),
                child: Text(
                  textAlign: TextAlign.end,
                  errorText ?? '',
                  style: const TextStyle(
                    color: AppColors.errorColor,
                    fontSize: 12,
                  ),
                ),
              )
            : const SizedBox(
                height: 20,
              ),
      ],
    );
  }
}
