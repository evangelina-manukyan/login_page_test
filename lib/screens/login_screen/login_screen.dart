import 'package:first_project/screens/home_screen/home_screen.dart';
import 'package:first_project/screens/login_screen/widgets/login_form.dart';
import 'package:first_project/widgets/main_button.dart';
import 'package:first_project/widgets/main_dialog.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String validLogin = 'qwerty';
  final String validPass = '123456ab';
  late final TextEditingController loginController;
  late final TextEditingController passController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            LoginForm(
              loginController: loginController,
              passController: passController,
              formKey: formKey,
            ),
            Positioned(
              bottom: 25.0,
              left: 0,
              right: 0,
              child: MainButton(
                title: 'Вход',
                onPressed: mainButtonHandler,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mainButtonHandler() {
    if (formKey.currentState!.validate()) {
      if (isAuthorized(
        loginController.text,
        passController.text,
      )) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const HomeScreen(title: 'Мое первое приложение'),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return MainDialog(
              title: 'Попробуйте снова',
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      }
    }
  }

  bool isAuthorized(String login, String pass) {
    if (login == validLogin) {
      if (pass == validPass) {
        return true;
      }
    }
    return false;
  }
}


