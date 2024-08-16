import 'package:flutter/material.dart';
import 'package:twitter_clone/component/lmy_loading_circle.dart';
import 'package:twitter_clone/component/my_button.dart';
import 'package:twitter_clone/component/my_text_field.dart';
import 'package:twitter_clone/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //get auth service
  final _auth = AuthService();
  //text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void register() async {
    if (pwController.text == confirmPwController.text) {
      showLoadingCircle(context);

      try {
        await _auth.registerEmailPassword(
            emailController.text, pwController.text);
        if (mounted) {
          hideLoadingCircle(context);
        }
      } catch (e) {
        if (mounted) {
          hideLoadingCircle(context);
        }
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password doesn't match"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_open_rounded,
                    size: 72, color: Theme.of(context).colorScheme.primary),
                const SizedBox(
                  height: 50,
                ),

                /// create an account

                Text(
                  "Let's Create an account for you",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: nameController,
                    hintText: "Name",
                    obscureText: false),
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
                MyTextField(
                    controller: confirmPwController,
                    hintText: "Confirm Password",
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 25,
                ),
                MyButton(text: "Register", onTap: register),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login here",
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
        ),
      )),
    );
  }
}
