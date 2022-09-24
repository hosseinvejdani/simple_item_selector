// ignore_for_file: must_be_immutable

library simple_item_selector;

import 'package:flutter/material.dart';

enum Direction { vertical, horizental }

typedef OnSelected = void Function(int? index);

class ItemSelector extends StatefulWidget {
  int? initIndex;
  final int itemsCount;
  final List<Widget?> items;
  final OnSelected onSelected;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Direction? direction;
  //
  ItemSelector({
    Key? key,
    this.initIndex = 0,
    required this.itemsCount,
    required this.items,
    required this.onSelected,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.direction = Direction.horizental,
  }) : super(key: key);

  @override
  State<ItemSelector> createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  //
  int? _currentIndex;
  //
  Color? activeBackgroundColor;
  Color? inactiveBackgroundColor;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? borderRadius;
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
    padding = widget.padding ?? const EdgeInsets.all(8.0);

    /// Assings margin if its default value is null!
    margin = widget.margin ?? const EdgeInsets.all(0.0);

    /// Assings borderRadius if its default value is null!
    borderRadius = widget.borderRadius ?? 5.0;
    // ================================
    return widget.direction == Direction.horizental
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
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          color: _currentIndex == index ? activeBackgroundColor : inactiveBackgroundColor,
        ),
        child: widget.items[index],
      ),
    );
  }
}
