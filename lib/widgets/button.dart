import 'package:flutter/material.dart';

class SwButton extends StatelessWidget {
  const SwButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.bgColor,
      this.borderColor,
      this.disableColor,
      this.boxShadow,
      this.height,
      this.icon,
      this.titleColor,
      this.width,
      this.isDisable,
      this.margin,
      this.borderRadius})
      : super(key: key);

  final Color? bgColor;
  final IconData? icon;
  final String title;
  final Color? titleColor;
  final Color? borderColor;
  final Color? disableColor;
  final BoxShadow? boxShadow;
  final Function onTap;
  final double? width;
  final double? height;
  final bool? isDisable;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    bool disable = isDisable != null && isDisable!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.fastOutSlowIn,
      margin: margin,
      width: width,
      height: height ?? 46.0,
      decoration: BoxDecoration(
        color: borderColor == null
            ? disable
                ? disableColor ?? Colors.grey.shade400
                : bgColor ?? Theme.of(context).primaryColor
            : null,
        border: borderColor != null
            ? Border.all(
                width: 2.4,
                color: disable
                    ? disableColor ?? Colors.grey.shade400
                    : borderColor!)
            : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        boxShadow: boxShadow != null ? [boxShadow!] : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          onTap: disable
              ? null
              : () {
                  onTap();
                },
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Icon(
                          icon,
                          color: titleColor ?? borderColor ?? Colors.white,
                        ),
                      )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? borderColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
