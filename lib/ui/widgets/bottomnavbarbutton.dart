import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class BottomNavBarButton extends StatefulWidget {
  const BottomNavBarButton({
    Key? key,
    required this.color,
    required this.shadowColor,
    required this.func,
    required this.icon,
    required this.visible,
    required this.name,
  }) : super(key: key);

  final Color shadowColor;
  final VoidCallback func;
  final IconData icon;
  final Color color;
  final bool visible;
  final String name;

  @override
  State<BottomNavBarButton> createState() => _BottomNavBarButtonState();
}

class _BottomNavBarButtonState extends State<BottomNavBarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: widget.func,
            child: Icon(
              widget.icon,
              color: widget.color,
              size: 30,
            ),
          ),
          Visibility(
              visible: true,
              child: Text(
                widget.name,
                style: CustomTextStyle.subtitleText.copyWith(
                  color: widget.color,
                ),
              )),
        ],
      ),
    );
  }
}
