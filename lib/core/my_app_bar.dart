import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      this.actions,
      this.leading,
      this.elevation,
      this.bottom,
      this.title,
      this.centerTitle = true,
      this.color});
  final List<Widget>? actions;
  final Widget? leading;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final Widget? title;
  final bool? centerTitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: title,
      centerTitle: centerTitle,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: 100,
      leading: leading,
      actions: actions,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
