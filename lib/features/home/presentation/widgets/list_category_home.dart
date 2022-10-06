import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/home/data/model/category_model.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/category_card.dart';

class ListCategoryHome extends StatefulWidget {
  const ListCategoryHome({Key? key}) : super(key: key);

  @override
  State<ListCategoryHome> createState() => _ListCategoryHomeState();
}

class _ListCategoryHomeState extends State<ListCategoryHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: colorPink,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.sp),
        SizedBox(
          height: 32.5.sp,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            itemCount: listCategoryFake.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return CategoryCard(
                categoryModel: listCategoryFake[index],
                isCheck: _currentIndex == index,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
