import 'package:flutter/material.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

class TrackingContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String maxValue;
  final Color textColor;

  const TrackingContainer(
      {Key? key,
      required this.icon,
      required this.title,
      required this.value,
      required this.maxValue,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 180,
      decoration: BoxDecoration(
        color: BaseColors.greyBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '/ $maxValue',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
