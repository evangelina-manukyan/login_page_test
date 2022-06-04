import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController? loginController;
  final TextEditingController? passController;
  final GlobalKey<FormState>? formKey;

  const LoginForm(
      {Key? key, this.loginController, this.passController, this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Введите логин и пароль'),
          TextFormField(
            maxLength: 8,
            validator: validateLogin,
            controller: loginController,
            decoration: const InputDecoration(hintText: 'Логин'),
          ),
          TextFormField(
            maxLength: 16,
            validator: validatePass,
            controller: passController,
            decoration: const InputDecoration(hintText: 'Пароль'),
          ),
        ],
      ),
    );
  }

  String? validateLogin(String? login) {
    if (login == null || login.isEmpty) {
      return 'Логин не может быть пустой';
    }
    if (login.length < 3 || login.length > 8) {
      return 'Логин должен быть от 3 до 8 символов';
    }
  }

  String? validatePass(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'Пароль не может быть пустой';
    }
    if (pass.length < 8 || pass.length > 16) {
      return 'Пароль должен быть от 8 до 16 символов';
    }
  }
}