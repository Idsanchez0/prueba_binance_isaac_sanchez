class Validators {
  validatePassword({required}) {}

  onEditingEmails(
      {required String value,
      required String emailError,
      required bool errorEmail}) {
    final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0\d9]{1,3}\.[0\d9]{1,3}\.[0\d9]{1,3}\.[0\d9]{1,3}\])|(([a-zA-Z\-0\d9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!emailRegExp.hasMatch(value.trim())) {
      errorEmail = true;
      emailError = 'Por favor introduce un correo válido';
    } else {
      errorEmail = false;
      emailError = '';
    }
  }
}

Validators validators = Validators();
