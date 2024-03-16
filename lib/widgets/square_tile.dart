import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Color color;
  final String title;
  final void Function() onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 50,
              fit: BoxFit.cover,
            ),
            const Gap(10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
