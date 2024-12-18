class PasswordValidator {
  static String? validate(String value) {
    int passwordLength = 6;

    if (value.isEmpty) {
      return 'O campo de senha não pode estar vazio';
    }
    if (value.length < passwordLength) {
      return 'Senha muito curta, mínimo $passwordLength caracteres';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'A senha deve conter pelo menos uma letra maiúscula';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'A senha deve conter pelo menos uma letra minúscula';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'A senha deve conter pelo menos um número';
    }
    return null;
  }
}
