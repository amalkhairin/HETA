import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/constant/style.dart';

class HETACard extends StatelessWidget {
  Widget? child;
  Color? color;
  double? width;
  double? height;
  bool enableBorder;
  Color? borderColor;
  Function()? onTap;
  HETACard({
    @required this.child,
    this.color = Colors.white,
    this.width,
    this.height,
    this.enableBorder = false,
    this.borderColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width!,
        height: height!,
        decoration: BoxDecoration(
          color: color!,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(6),
          border: enableBorder? Border.all(color: borderColor!) : null,
        ),
        child: child
      ),
    );
  }
}