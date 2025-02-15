import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliver extends StatelessWidget {
  const CustomSliver({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.itemPadding,
  });

  final String title;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double? itemPadding;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          expandedHeight: 0.05.sh,
          floating: false,
          pinned: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DecoratedSliver(
          decoration: const BoxDecoration(color: Colors.white),
          sliver: SliverList.builder(
            itemCount: itemCount,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.all(itemPadding ?? 10.0),
                  child: itemBuilder(context, index),
                ),
          ),
        ),
      ],
    );
  }
}
