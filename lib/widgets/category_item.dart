import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption/model/category_model.dart';
import 'package:pet_adoption/theme/color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.data,
    this.selected = false,
    this.onTap,
  });

  final CategoryModel data;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: EdgeInsets.only(right: 10),
        width: 90,
        decoration: BoxDecoration(
          color: selected ? AppColor.secondary : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            data.icon!.isNotEmpty
                ? Image.network(
                    data.icon.toString(),
                    width: 35,
                    height: 35,
                  )
                : SvgPicture.asset(
                    "assets/icons/pet-border.svg",
                    width: 35,
                    height: 35,
                    color: selected ? Colors.white : Colors.black,
                  ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                data.name ?? 'No Name',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  //color: selected ? Colors.white : AppColor.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
