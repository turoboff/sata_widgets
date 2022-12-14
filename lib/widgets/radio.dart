import 'package:flutter/material.dart';

class SwRadio extends StatelessWidget {
  const SwRadio(
      {Key? key,
      required this.isActive,
      required this.onChanged,
      this.size,
      this.activeColor,
      this.unSelectedColor})
      : super(key: key);
  final bool isActive;
  final ValueSetter<bool> onChanged;
  final double? size;
  final Color? activeColor;
  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        size ?? 18.0,
      ),
      onTap: () {
        onChanged.call(!isActive);
      },
      child: AnimatedContainer(
        width: size ?? 18.0,
        height: size ?? 18.0,
        duration: const Duration(milliseconds: 180),
        padding: isActive
            ? const EdgeInsets.all(2.0)
            : EdgeInsets.all(size != null ? (size! / 2) : 9.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: isActive ? 1.4 : 2.0,
            color: isActive
                ? activeColor ?? Theme.of(context).primaryColor
                : unSelectedColor ?? Colors.grey.shade400,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeColor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
