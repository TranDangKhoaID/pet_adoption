import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_adoption/constants/constants.dart';
import 'package:pet_adoption/theme/color.dart';

class AvatarCard extends StatelessWidget {
  final String name;
  final String email;
  const AvatarCard({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/avatar.png",
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: kbigFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: ksmallFontSize,
                  color: Colors.grey.shade600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
