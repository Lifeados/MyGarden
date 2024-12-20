class NameValidator {
  static String? validate(String value) {
    int nameLength = 2;

    if (value.isEmpty) {
      return 'O campo de nome não pode estar vazio';
    }
    if (value.length < 2) {
      return 'Nome muito curto, mínimo $nameLength caracteres';
    }
    if (RegExp(r'\d').hasMatch(value)) {
      return 'O nome não pode conter números';
    }

    if (RegExp(r'[^a-zA-ZÀ-ÿ\s]').hasMatch(value)) {
      return 'O nome não pode conter caracteres especiais';
    }
    return null;
  }

  static String? lastNameValidate(String value) {
    int nameLength = 2;

    if (value.isEmpty) {
      return 'O campo de sobrenome não pode estar vazio';
    }
    if (value.length < 2) {
      return 'Sobrenome muito curto, mínimo $nameLength caracteres';
    }
    if (RegExp(r'\d').hasMatch(value)) {
      return 'O sobrenome não pode conter números';
    }

    if (RegExp(r'[^a-zA-ZÀ-ÿ\s]').hasMatch(value)) {
      return 'O sobrenome não pode conter caracteres especiais';
    }
    return null;
  }
}
