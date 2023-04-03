import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/levels/orta/b1.dart';
import 'package:ankarauni/screens/levels/orta/b2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelDetailsCardB1 extends StatelessWidget {
  final LevelDetailsB1 levelDetailsB1;

  const LevelDetailsCardB1({
    Key? key,
    required this.levelDetailsB1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (levelDetailsB1.id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const B1Screen(),
            ),
          );
        } else if (levelDetailsB1.id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const B2Screen(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: levelDetailsB1.color,
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
                      levelDetailsB1.title,
                      style: const TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5), // 5
                    Text(
                      levelDetailsB1.description,
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
                levelDetailsB1.imageSrc,
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
