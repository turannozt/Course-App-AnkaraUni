// ignore_for_file: use_build_context_synchronously

import 'package:ankarauni/components/page_title_bar.dart';
import 'package:ankarauni/components/under_part.dart';
import 'package:ankarauni/components/upside.dart';
import 'package:ankarauni/resources/auth_methods.dart';
import 'package:ankarauni/screens/login/login_screen.dart';
import 'package:ankarauni/screens/login/verify_email_screen.dart';
import 'package:ankarauni/widgets/rounded_button.dart';
import 'package:ankarauni/widgets/rounded_input_field.dart';
import 'package:ankarauni/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
  }

  //Sign Up
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _nameController.text,
      bio: "Hedefin Nedir ?",
      token: '',
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const VerifyEmailPage(),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/register.png",
                ),
                const PageTitleBar(title: 'Yeni Hesap Oluştur'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: _emailController,
                              ),
                              RoundedInputField(
                                  controller: _nameController,
                                  hintText: "Name",
                                  icon: Icons.person),
                              RoundedPasswordField(
                                  controller: _passwordController),
                              RoundedButton(
                                text:
                                    !_isLoading ? 'KAYIT OL' : 'Bekleniyor...',
                                press: signUpUser,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Hesabınız Var mı ?",
                                navigatorText: "Giriş Yap",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
