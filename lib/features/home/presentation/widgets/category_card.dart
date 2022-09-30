import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/home/data/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function() onTap;
  final bool isCheck;
  const CategoryCard({
    Key? key,
    required this.categoryModel,
    required this.onTap,
    required this.isCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10.sp),
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 4.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: isCheck ? colorPink : fCD,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 2.sp),
              child: Image.asset(
                categoryModel.image,
                height: 12.sp,
                width: 12.sp,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 3.sp),
            Text(
              categoryModel.title,
              style: TextStyle(
                color: mCL,
                fontSize: 10.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
