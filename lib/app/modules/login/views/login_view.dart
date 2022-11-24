import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 128,
                  width: 128,
                  child: Image.asset(
                    "assets/images/vc_logo.png",
                  ),
                ),
                 Text("Verma Classes",style: Theme.of(context).textTheme.headline5?.copyWith(color: const Color(0xff21547f),fontWeight: FontWeight.w800),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.usernameController,
                    keyboardType: TextInputType.number,
                    validator: controller.usernameValidator,
                    decoration: const InputDecoration(labelText: "Roll Number"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.passwordController,
                    validator: controller.passwordValidator,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: const Color(0xff21547f),
                    onPressed: controller.login,
                    icon: const Icon(Icons.login),
                    label: const Text("Login"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
