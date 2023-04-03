import 'package:ankarauni/models/level_details.dart';
import 'package:ankarauni/screens/levels/uzman/c1.dart';
import 'package:ankarauni/screens/levels/uzman/c2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelDetailsCardC1 extends StatelessWidget {
  final LevelDetailsC1 levelDetailsC1;

  const LevelDetailsCardC1({
    Key? key,
    required this.levelDetailsC1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (levelDetailsC1.id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const C1Screen(),
            ),
          );
        } else if (levelDetailsC1.id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const C2Screen(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: levelDetailsC1.color,
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
                      levelDetailsC1.title,
                      style: const TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5), // 5
                    Text(
                      levelDetailsC1.description,
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
                levelDetailsC1.imageSrc,
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
