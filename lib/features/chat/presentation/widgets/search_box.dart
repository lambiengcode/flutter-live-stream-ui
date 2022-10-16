// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/app/constants.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class SearchBox extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final Function(String)? onChanged;
  final Function()? handleClear;
  const SearchBox({
    Key? key,
    this.margin,
    this.onChanged,
    this.handleClear,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController searchKey = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();

    searchKey.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.sp,
      width: 100.w,
      margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 16.sp),
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).dividerColor, width: .5.sp),
          borderRadius: BorderRadius.circular(8.sp),
          color: colorGreyWhite),
      child: TextFormField(
        controller: searchKey,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? colorCaptionSearch
              : mC,
          fontSize: 12.sp,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 0.sp,
            right: 10.sp,
          ),
          hintText: 'Tìm kiếm',
          hintStyle: TextStyle(
            color: colorCaptionSearch,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.all(10.sp),
            child: Icon(
              Icons.search,
              size: 16.sp,
              color: const Color(0xFFA4A4A4),
            ),
          ),
          suffixIcon: searchKey.text.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    if (widget.handleClear == null) {
                    } else {
                      widget.handleClear!();
                    }
                    searchKey.text = '';
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFFA4A4A4),
                  ),
                ),
        ),
        onChanged: widget.onChanged ??
            (val) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce =
                  Timer(const Duration(milliseconds: delayHalfSecond), () {});

              setState(() {});
            },
      ),
    );
  }
}
