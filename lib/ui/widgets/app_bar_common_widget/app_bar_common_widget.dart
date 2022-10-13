import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class AppBarCommonWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget> leadingWidgets;
  final List<Widget> centerWidgets;
  final List<Widget> trailingWidgets;
  final EdgeInsets _padding = const EdgeInsets.fromLTRB(16, 0, 16, 8);
  final double _leadingSpacing = 4.0;
  final double _centerSpacing = 4.0;
  final double _trailingSpacing = 4.0;
  static const double heightOfAppBar = 84.0;

  AppBarCommonWidget(
      {required this.leadingWidgets,
      required this.centerWidgets,
      required this.trailingWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightOfAppBar,
      decoration: BoxDecoration(color: AppColor.primaryColor),
      child: Padding(
        padding: _padding,
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildItemWidgets(
                    MainAxisAlignment.start, leadingWidgets, _leadingSpacing),
                Spacer(),
                _buildItemWidgets(
                    MainAxisAlignment.center, centerWidgets, _centerSpacing),
                Spacer(),
                _buildItemWidgets(
                    MainAxisAlignment.end, trailingWidgets, _trailingSpacing)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidgets(
      MainAxisAlignment align, List<Widget> mainWidgets, double itemSpacing) {
    List<Widget> widgets = [];
    if (mainWidgets.length <= 1) {
      widgets = mainWidgets;
    } else {
      int count = mainWidgets.length - 1;
      for (int i = 0; i < count; i++) {
        widgets.add(mainWidgets[i]);
        if (i % 2 == 0) {
          widgets.add(SizedBox(width: itemSpacing));
        }
      }
    }
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: align,
        children: widgets);
  }

  @override
  Size get preferredSize => Size.fromHeight(heightOfAppBar);
}
