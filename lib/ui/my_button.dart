import 'package:flutter/material.dart';
import 'package:movieapp/styles/my_textstyle.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final String buttonText;
  final TextStyle style;
  final Widget? trailingIcon;
  const MyButton({
    super.key,
    required this.onPressed,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 14),
    this.borderRadius = 100,
    required this.buttonText,
    this.style = MyTextStyles.buttonStyle,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(contentPadding),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Spacer(flex: 4),
          Text("Continue", style: style),
          const Spacer(flex: 3),
          trailingIcon ?? const SizedBox(),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
