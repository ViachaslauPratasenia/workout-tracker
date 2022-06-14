import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/utils/colors.dart';
import 'package:workout_tracker/utils/ui_kit/custom_text.dart';

class Tabs extends StatefulWidget {
  final int selectedIndex;
  final List<String> children;

  final void Function(int?)? onChanged;

  const Tabs({
    required this.selectedIndex,
    this.onChanged,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<Tabs> createState() => _DiscoverAppBarState();
}

class _DiscoverAppBarState extends State<Tabs> {
  int? _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void Function() _onTap(int index) => () {
        int? newSelectedIndex = index != _selectedIndex ? index : null;

        if (newSelectedIndex != null) {
          setState(() => _selectedIndex = newSelectedIndex);
        }

        if (widget.onChanged != null) {
          widget.onChanged!(newSelectedIndex);
        }
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: <Widget>[
          ...widget.children
              .asMap()
              .keys
              .map(
                (key) => Container(
                  margin: EdgeInsets.all(8.h),
                  height: 45.h,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(24.r),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onTap(key),
                      child: Container(
                        padding: EdgeInsets.all(3.r),
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              widget.children[key],
                              size: TextSize.m,
                              type: TextType.semiBold,
                              color: _selectedIndex == key ? kPeppermint : kPeppermint.withOpacity(0.5),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              width: 16.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.r)),
                                color: _selectedIndex == key
                                    ? kAquaIsland
                                    : Colors.transparent,
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
