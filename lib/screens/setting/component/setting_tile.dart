import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_adoption/constants/constants.dart';
import 'package:pet_adoption/theme/color.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const SettingTile({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColor.klightContentColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: AppColor.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColor.primary,
                fontSize: ksmallFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(
            CupertinoIcons.chevron_forward,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
