
import 'package:ankarauni/utils/constants.dart';
import 'package:flutter/material.dart';


class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical:30),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Image.asset(iconSrc),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16, //16
                  color: kTextLigntColor,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kTextLigntColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
