import 'package:flutter/material.dart';
import 'package:pet_adoption/constants/constants.dart';
import 'package:pet_adoption/theme/color.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.support_agent,
            size: 50,
            color: AppColor.secondary,
          ),
          SizedBox(width: 10),
          Text(
            "Feel Free to Ask, We Ready to Help",
            style: TextStyle(
              fontSize: ksmallFontSize,
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
