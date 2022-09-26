// ignore_for_file: must_be_immutable

library simple_item_selector;

import 'package:flutter/material.dart';

enum Direction { vertical, horizontal }

typedef OnSelected = void Function(int? index);

class ItemSelector extends StatefulWidget {
  int? initIndex;
  final int itemsCount;
  final List<Widget?> items;
  final OnSelected onSelected;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? itemMargin;
  final Direction? direction;
  final BorderRadius? itemBorderRadius;
  final Border? itemBorder;
  //
  ItemSelector({
    Key? key,
    required this.itemsCount,
    required this.items,
    required this.onSelected,
    this.initIndex = 0,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.itemPadding,
    this.itemMargin,
    this.direction = Direction.horizontal,
    this.itemBorderRadius,
    this.itemBorder,
  }) : super(key: key);

  @override
  State<ItemSelector> createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  //
  int? _currentIndex;
  Color? activeBackgroundColor;
  Color? inactiveBackgroundColor;
  EdgeInsetsGeometry? itemPadding;
  EdgeInsetsGeometry? itemMargin;
  //
  @override
  void initState() {
    _currentIndex = widget.initIndex;
    super.initState();
  }

  void _handleOnTap(int index) async {
    setState(() => _currentIndex = index);
    widget.onSelected(index);
  }

  //
  @override
  Widget build(BuildContext context) {
    /// Assigns active background color to default primary theme color if it's null/not provided.
    activeBackgroundColor = widget.activeBackgroundColor ?? Theme.of(context).colorScheme.primary;

    /// Assigns inactive background color to default disabled theme color if it's null/not provided.
    inactiveBackgroundColor = widget.inactiveBackgroundColor ?? Theme.of(context).disabledColor;

    /// Assings padding if its default value is null!
    itemPadding = widget.itemPadding ?? const EdgeInsets.all(8.0);

    /// Assings margin if its default value is null!
    itemMargin = widget.itemMargin ?? const EdgeInsets.all(0.0);

    // ================================
    return widget.direction == Direction.horizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < widget.itemsCount; index++) singleItem(index),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < widget.itemsCount; index++) singleItem(index),
            ],
          );
  }

  GestureDetector singleItem(int index) {
    return GestureDetector(
      onTap: () => _handleOnTap(index),
      child: Container(
        margin: itemMargin,
        padding: itemPadding,
        decoration: BoxDecoration(
          borderRadius: widget.itemBorderRadius,
          border: widget.itemBorder,
          color: _currentIndex == index ? activeBackgroundColor : inactiveBackgroundColor,
        ),
        child: widget.items[index],
      ),
    );
  }
}
