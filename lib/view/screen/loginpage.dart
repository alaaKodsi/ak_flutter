import 'package:aktest/core/constant/colors.dart';
import 'package:aktest/view/screen/registerPage.dart';
import 'package:aktest/view/widget/auth/ElevatedAuthButton.dart';
import 'package:aktest/view/widget/auth/forgetPasswordWidget.dart';
import 'package:aktest/view/widget/auth/myTextFormField.dart';
import 'package:aktest/view/widget/auth/topAuthPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  TopAuthPage(
                    titleText: "Welecom Back",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Form(
                            child: Column(
                          children: [
                            MyTextFormField(
                              iconSuffix: Icons.email_outlined,
                              hintText: "Enter your Email",
                              labelText: "Email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextFormField(
                              iconSuffix: Icons.remove_red_eye_outlined,
                              hintText: "Enter your Password",
                              labelText: "Password",
                            ),
                            const ForgetPasswordWidget(),
                            ElevatedLoginButton(
                              textButton: "Login",
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: -20,
                left: -70,
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: primryColor),
                )),
            Positioned(
                bottom: 15,
                left: 10,
                child: Row(
                  children: [
                    const Text(
                      " I don't have an account yet !  ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
