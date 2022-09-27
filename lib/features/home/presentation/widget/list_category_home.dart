import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/category_model.dart';
import 'package:streamskit_mobile/features/home/presentation/widget/category_card.dart';

class ListCategoryHome extends StatefulWidget {
  const ListCategoryHome({Key? key}) : super(key: key);

  @override
  State<ListCategoryHome> createState() => _ListCategoryHomeState();
}

class _ListCategoryHomeState extends State<ListCategoryHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.sp,
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
    );
  }
}
