import 'package:flutter/material.dart';

class SwIconButton extends StatelessWidget {
  const SwIconButton(this.icon,
      {Key? key,
      required this.onTap,
      this.iconSize,
      this.color,
      this.highlightColor,
      this.splashColor})
      : super(key: key);
  final IconData icon;
  final Function onTap;
  final double? iconSize;
  final Color? color;
  final Color? highlightColor;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap.call(),
          highlightColor: highlightColor,
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(iconSize ?? 22.0),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
