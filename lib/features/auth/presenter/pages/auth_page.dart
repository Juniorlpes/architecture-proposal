import 'package:architecture_proposal/features/auth/auth_binds.dart';
import 'package:architecture_proposal/features/auth/presenter/controllers/auth_controller.dart';
import 'package:architecture_proposal/shared/domain/request_status.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = AuthController(AuthBinds().loginUsecase);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: controller.loginStatus == RequestStatus.Loading
                  ? null
                  : () => controller.login(
                      email: emailController.text,
                      password: passwordController.text),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            if (controller.loginStatus == RequestStatus.Loading)
              CircularProgressIndicator(),
            if (controller.loginStatus == RequestStatus.Fail)
              Text(
                controller.loginFailure?.message ?? '',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
