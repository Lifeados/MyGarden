import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isSecret;
  final TextEditingController? inputController;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.inputController,
    this.isSecret = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.isSecret;
  }

  String? errorMessage = '';

  String? handleValidator(String? value) {
    setState(() {
      errorMessage = widget.validator?.call(value ?? '');
      hasError = errorMessage != null;
    });
    return errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      validator: handleValidator,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        isDense: true,
        floatingLabelStyle: TextStyle(
            color:
                hasError ? AppColors.errorColor : AppColors.primaryGreenColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryGreenColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        suffixIcon: widget.isSecret
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        // errorText: errorMessage,
      ),
    );
  }
}
