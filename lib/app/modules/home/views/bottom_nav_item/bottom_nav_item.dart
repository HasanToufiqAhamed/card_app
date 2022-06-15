import 'package:flutter/material.dart';

import '../../../../data/config/app_color.dart';

class BottomNavItem extends StatelessWidget {
  IconData _icon;
  String _title;
  Color _color;

  BottomNavItem({
    required icon,
    required title,
    required color,
  })  : _icon = icon,
        _title = title,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _icon,
          color: _color,
        ),
        const SizedBox(height: 5),
        Text(
          _title,
          style: TextStyle(
            color: _color,
          ),
        )
      ],
    );
  }
}
