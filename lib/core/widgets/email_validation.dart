 String? emailValidation(String? value, {bool required = true}) {
    if ((value == null || value.trim().isEmpty)) {
      return required ? 'Please enter an email address' : null;
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }


