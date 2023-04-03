import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/quiz/quiz_expert/quiz_expert.dart';
import 'package:ankarauni/screens/quiz/quiz_middle/quiz_middle.dart';
import 'package:ankarauni/screens/quiz/quiz_temel/quiz_temel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizCard extends StatelessWidget {
  final QuizDetails quizDetails;

  const QuizCard({
    Key? key,
    required this.quizDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (quizDetails.id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizAppTemel(),
            ),
          );
        } else if (quizDetails.id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizAppMiddle(),
            ),
          );
        } else if (quizDetails.id == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizAppExpert(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: quizDetails.color,
          borderRadius: BorderRadius.circular(18), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      quizDetails.title,
                      style: const TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5), // 5
                    Text(
                      quizDetails.description,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5), //5
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                quizDetails.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {required String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
