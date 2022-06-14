import 'package:flutter/material.dart';

class UnfocusView extends StatelessWidget {
  const UnfocusView({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Container(
        padding: padding,
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
