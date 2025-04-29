import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.tital, required this.icon, this.onPressed});
  final String tital;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tital, style: const TextStyle(fontSize: 28)),
        Spacer(),
        CustomSearchIcon(icon: icon,
        onPressed: onPressed,
        ),
      ],
    );
  }
}
