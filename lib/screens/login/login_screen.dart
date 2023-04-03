// ignore_for_file: use_build_context_synchronously

import 'package:ankarauni/components/page_title_bar.dart';
import 'package:ankarauni/components/under_part.dart';
import 'package:ankarauni/components/upside.dart';
import 'package:ankarauni/resources/auth_methods.dart';
import 'package:ankarauni/screens/login/signup_screen.dart';
import 'package:ankarauni/screens/login/verify_email_screen.dart';
import 'package:ankarauni/utils/constants.dart';
import 'package:ankarauni/widgets/rounded_button.dart';
import 'package:ankarauni/widgets/rounded_input_field.dart';
import 'package:ankarauni/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

//Login User
  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text,
        password: _passwordController.text,
        token: '');
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const VerifyEmailPage(),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
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
                  imgUrl: "assets/images/login.png",
                ),
                const PageTitleBar(title: 'Hesabınıza Giriş Yapın'),
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
                                controller: _emailController,
                                hintText: "Email",
                                icon: Icons.email,
                              ),
                              RoundedPasswordField(
                                controller: _passwordController,
                              ),
                              RoundedButton(
                                text: !_isLoading ? 'GİRİŞ' : 'Bekleniyor...',
                                press: loginUser,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Hesabınız yok mu?",
                                navigatorText: "Kayıt Ol",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Şifreni mi Unuttun?',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
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
