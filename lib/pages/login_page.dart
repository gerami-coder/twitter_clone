import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/component/lmy_loading_circle.dart';
import 'package:twitter_clone/component/my_button.dart';
import 'package:twitter_clone/component/my_text_field.dart';
import 'package:twitter_clone/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  void login() async {
    showLoadingCircle(context);
    try {
      await _auth.loginEmailPassword(emailController.text, pwController.text);
      if (mounted) {
        hideLoadingCircle(context);
      }
    } catch (e) {
      if (mounted) {
        hideLoadingCircle(context);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  ///////////////////////////////////////////////////
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_open_rounded,
                  size: 72, color: Theme.of(context).colorScheme.primary),
              const SizedBox(
                height: 50,
              ),
              Text(
                'welcome back',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Enter Email...",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: pwController,
                  hintText: "Enter Password",
                  obscureText: true),
              ////////////////////
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              MyButton(text: "Login", onTap: login),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
