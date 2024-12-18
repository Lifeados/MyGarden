class EmailValidator {
  static String? validate(String value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value.isEmpty) {
      return 'O campo de email não pode estar vazio';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }
    return null;
  }
}
