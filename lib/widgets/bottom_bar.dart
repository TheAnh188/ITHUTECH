// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CustomBottomBar extends StatelessWidget {
  /// {@macro bottom_bar}
  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    this.curve = Curves.easeOutQuint,
    this.duration = const Duration(milliseconds: 750),
    this.height,
    this.padding = const EdgeInsets.all(10),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.backgroundColor,
    this.showActiveBackgroundColor = true,
    this.border = const StadiumBorder(),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    required this.items,
    required this.onTap,
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  });

  /// Index of selected item
  final int selectedIndex;

  /// Curve of animation
  final Curve curve;

  /// Duration of the animation
  final Duration duration;

  /// Height of `CustomBottomBar`
  final num? height;

  /// Padding of `CustomBottomBar`
  final EdgeInsets padding;

  /// Describes how `CustomBottomBarItem`s are horizontally laid out
  final MainAxisAlignment mainAxisAlignment;

  /// Background color of `CustomBottomBar`
  final Color? backgroundColor;

  /// Shows the background color of a selected `CustomBottomBarItem` if set to true
  final bool showActiveBackgroundColor;

  /// [ShapeBorder] of the `CustomBottomBarItem's` background color
  final ShapeBorder border;

  /// Padding between the background color and the
  /// `Row` that contains the icon and title
  final EdgeInsets itemPadding;

  /// List of `CustomBottomBarItems` to display
  final List<CustomBottomBarItem> items;

  /// Fires this callback when `CustomBottomBarItem` is tapped
  ///
  /// Use this callback to update the `selectedIndex`
  final ValueChanged<int> onTap;

  /// `TextStyle` of title
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      height: height?.toDouble(),
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: List.generate(
            items.length,
            (int index) {
              final CustomBottomBarItem = items.elementAt(index);
              final backgroundColor = CustomBottomBarItem.activeColor
                  .withOpacity(
                      CustomBottomBarItem.backgroundColorOpacity.toDouble());

              final Color activeIconColor =
                  CustomBottomBarItem.activeIconColor ??
                      CustomBottomBarItem.activeColor;
              final Color activeTitleColor =
                  CustomBottomBarItem.activeTitleColor ??
                      CustomBottomBarItem.activeColor;

              final inactiveColor = items[index].inactiveColor ??
                  (brightness == Brightness.light
                      ? const Color.fromARGB(255, 80, 80, 80)
                      : const Color(0xF2FFFFFF));

              return _CustomBottomBarItemWidget(
                index: index,
                key: items.elementAt(index).key,
                isSelected: index == selectedIndex,
                activeBackgroundColor: backgroundColor,
                activeIconColor: activeIconColor,
                activeTitleColor: activeTitleColor,
                showActiveBackgroundColor: showActiveBackgroundColor,
                border: border,
                inactiveColor: inactiveColor,
                rightPadding: itemPadding.right,
                curve: curve,
                duration: duration,
                itemPadding: itemPadding,
                textStyle: textStyle,
                icon: items.elementAt(index).icon,
                inactiveIcon: items.elementAt(index).inactiveIcon,
                title: items.elementAt(index).title,
                onTap: () => onTap(index),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CustomBottomBarItemWidget extends StatelessWidget {
  const _CustomBottomBarItemWidget({
    super.key,
    required this.index,
    required this.isSelected,
    required this.activeBackgroundColor,
    required this.activeIconColor,
    required this.activeTitleColor,
    required this.showActiveBackgroundColor,
    required this.border,
    required this.inactiveColor,
    required this.rightPadding,
    required this.curve,
    required this.duration,
    required this.itemPadding,
    required this.textStyle,
    required this.icon,
    this.inactiveIcon,
    required this.title,
    required this.onTap,
  });

  final int index;
  final bool isSelected;
  final Color activeBackgroundColor;
  final Color? activeIconColor;
  final Color? activeTitleColor;
  final bool showActiveBackgroundColor;
  final ShapeBorder border;
  final Color inactiveColor;
  final double rightPadding;
  final Curve curve;
  final Duration duration;
  final EdgeInsets itemPadding;
  final TextStyle textStyle;
  final Widget icon;
  final Widget? inactiveIcon;
  final Widget? title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 0,
        end: isSelected ? 1 : 0,
      ),
      curve: curve,
      duration: duration,
      builder: (BuildContext context, double value, Widget? child) {
        return Material(
          color: showActiveBackgroundColor
              ? Color.lerp(
                  activeBackgroundColor.withOpacity(0),
                  activeBackgroundColor,
                  value,
                )
              : Colors.transparent,
          shape: border,
          child: InkWell(
            onTap: onTap,
            customBorder: border,
            focusColor: activeBackgroundColor,
            highlightColor: activeBackgroundColor,
            splashColor: activeBackgroundColor,
            hoverColor: activeBackgroundColor,
            child: Padding(
              padding: itemPadding -
                  (title == null
                      ? EdgeInsets.zero
                      : EdgeInsets.only(right: rightPadding * value)),
              child: Row(
                children: [
                  IconTheme(
                    data: IconThemeData(
                      color: Color.lerp(inactiveColor, activeIconColor, value),
                      size: 24,
                    ),
                    child: isSelected ? icon : (inactiveIcon ?? icon),
                  ),
                  if (title != null)
                    ClipRect(
                      child: SizedBox(
                        height: MySizes.size20SW,
                        child: Align(
                          alignment: const Alignment(-0.2, 0),
                          widthFactor: value,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: rightPadding / 2,
                              right: rightPadding,
                            ),
                            child: DefaultTextStyle(
                              style: textStyle.copyWith(
                                color: Color.lerp(
                                  Colors.transparent,
                                  activeTitleColor,
                                  value,
                                ),
                              ),
                              child: title!,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// {@template bottom_bar_item}
/// This contains information about the item that `CustomBottomBar` has to display
/// {@endtemplate}
class CustomBottomBarItem {
  ///{@macro bottom_bar_item}
  const CustomBottomBarItem({
    this.key,
    required this.icon,
    this.inactiveIcon,
    this.title,
    required this.activeColor,
    this.backgroundColorOpacity = 0.15,
    this.inactiveColor,
    this.activeIconColor,
    this.activeTitleColor,
  });

  /// Key of `CustomBottomBarItem`
  ///
  /// This will be the key of the specific `CustomBottomBarItem` shown in `CustomBottomBar`.
  final Key? key;

  /// Icon of `CustomBottomBarItem`
  ///
  /// This will be the icon shown in each `CustomBottomBarItem`.
  final Widget icon;

  /// Icon to display when the `CustomBottomBarItem` is not active
  ///
  /// This will be the icon shown in each `CustomBottomBarItem`.
  final Widget? inactiveIcon;

  /// Title of `CustomBottomBarItem` (Typically a Text widget)
  ///
  /// This will be the shown next to the icon whenever `CustomBottomBarItem` is
  /// selected.
  final Widget? title;

  /// Color of `CustomBottomBarItem` when it is selected.
  ///
  /// This will be the active color of the background
  ///
  /// This can also be the active color of the icon and title if
  /// [activeIconColor] and [activeTitleColor] are null
  final Color activeColor;

  /// Opacity of the `CustomBottomBarItem` active color
  final num backgroundColorOpacity;

  /// Color of `CustomBottomBarItem` while it is not selected.
  ///
  /// This will be the inactive color of icon, title, and background.
  final Color? inactiveColor;

  /// Color of a selected `CustomBottomBarItem` icon
  final Color? activeIconColor;

  /// Color of a selected `CustomBottomBarItem` title
  final Color? activeTitleColor;
}
