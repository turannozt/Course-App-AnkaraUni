import 'package:ankarauni/screens/quiz/const/colors.dart';
import 'package:ankarauni/screens/quiz/const/text_style.dart';
import 'package:ankarauni/screens/quiz/quiz_screen.dart';
import 'package:ankarauni/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor,
              kTextColor,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: lightgrey, width: 2),
                ),
                child: IconButton(
                  onPressed: () =>Navigator.pop(context),
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/balloon2.png',
              ),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey, size: 18, text: "Sınava Hoş Geldiniz "),
              headingText(
                  color: Colors.white, size: 32, text: "Ankara Üniversitesi"),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey,
                  size: 16,
                  text:
                      "Sınavda Başarılı Olabilmeniz İçin 70 Puan ve Üzeri Almanız Gerekir."),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(
                      color: kTextColor,
                      size: 18,
                      text: "Başla",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
