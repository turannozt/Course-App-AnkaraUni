import 'package:ankarauni/models/RecipeBundel.dart';
import 'package:ankarauni/screens/levels/orta/orta_screen.dart';
import 'package:ankarauni/screens/levels/temel/temel_screen.dart';
import 'package:ankarauni/screens/levels/uzman/uzman_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle recipeBundle;

 
  const RecipeBundelCard({
    Key? key,
    required this.recipeBundle,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (recipeBundle.id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TemelSeviye(),
            ),
          );
        } else if (recipeBundle.id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrtaSeviye(),
            ),
          );
        } else if (recipeBundle.id == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UzmanSeviye(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
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
                      recipeBundle.title,
                      style: const TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5), // 5
                    Text(
                      recipeBundle.description,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                   
                    const SizedBox(height: 5), //5
                    buildInfoRow(
                      10,
                      iconSrc: "assets/icons/chef.svg",
                      text: "${recipeBundle.chefs} Seviye",
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
                recipeBundle.imageSrc,
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
