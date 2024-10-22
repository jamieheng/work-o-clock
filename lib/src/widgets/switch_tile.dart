import 'package:flutter/material.dart';
import 'package:work_o_clock/src/utils/base_colors.dart';

class SwitchTile extends StatefulWidget {
  final String title;

  const SwitchTile({Key? key, required this.title}) : super(key: key);

  @override
  SwitchTileState createState() => SwitchTileState();
}

class SwitchTileState extends State<SwitchTile> {
  bool _isAllDay = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: _isAllDay,
      onChanged: (value) {
        setState(() {
          _isAllDay = value;
        });
      },
      activeColor: BaseColors.primaryColor,
    );
  }
}
