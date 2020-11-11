mixin InputValidator {
  bool isEmailValid(String email) {
    const pattern =
        r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isNameValid(String name) => name.length > 1;

  bool isPasswordValid(String password) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}
