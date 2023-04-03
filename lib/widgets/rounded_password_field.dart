import 'package:ankarauni/utils/constants.dart';
import 'package:ankarauni/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _showPassword = false;
  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_showPassword,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Password",
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: GestureDetector(
              onTap: _toggleShowPassword,
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
