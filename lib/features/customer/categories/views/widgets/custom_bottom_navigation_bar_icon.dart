import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';

class CustomBottomNavigationBarIcon extends StatelessWidget {
  const CustomBottomNavigationBarIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: context.width * 0.08,
      color: Colors.white,
    );
  }
}
