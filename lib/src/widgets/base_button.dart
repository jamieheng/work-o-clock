import 'package:flutter/material.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double height;
  final Icon? icon;

  const BaseButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = BaseColors.primaryColor,
    this.textColor = Colors.white,
    this.borderRadius = 15,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 16.0),
    this.width,
    this.height = 50,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 10),
              icon!,
              const SizedBox(width: 10),
            ],
          ],
        ),
      ),
    );
  }
}
