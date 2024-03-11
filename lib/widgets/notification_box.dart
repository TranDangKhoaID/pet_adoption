import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption/theme/color.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    this.onTap,
    this.notifiedNumber = 0,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: AppColor.actionColor,
                  padding: EdgeInsets.all(3),
                ),
                position: badges.BadgePosition.topEnd(top: -3, end: -3),
                badgeContent: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 25,
                  height: 25,
                ),
              )
            : SvgPicture.asset("assets/icons/bell.svg"),
      ),
    );
  }
}
