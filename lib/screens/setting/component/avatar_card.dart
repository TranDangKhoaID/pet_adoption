import 'package:flutter/material.dart';
import 'package:pet_adoption/constants/constants.dart';
import 'package:pet_adoption/theme/color.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tran Dang Khoa",
              style: TextStyle(
                fontSize: kbigFontSize,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            Text(
              "bangbang89100@gmail.com",
              style: TextStyle(
                fontSize: ksmallFontSize,
                color: Colors.grey.shade600,
              ),
            )
          ],
        )
      ],
    );
  }
}
