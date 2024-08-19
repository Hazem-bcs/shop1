import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? obscureText;

  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      required this.myController,
      this.validator,
      this.keyboardType,
      this.onTap,
      this.obscureText,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText == null ? false : obscureText!,
        keyboardType: keyboardType,
        validator: validator,
        controller: myController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onTap,child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
