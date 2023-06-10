import 'package:flutter/material.dart';

class BottomNavBarButton extends StatefulWidget {
  const BottomNavBarButton({
    Key? key,
    required this.color,
    required this.shadowColor,
    required this.func,
    required this.icon,
    required this.visible,
  }) : super(key: key);

  final Color shadowColor;
  final VoidCallback func;
  final IconData icon;
  final Color color;
  final bool visible;

  @override
  State<BottomNavBarButton> createState() => _BottomNavBarButtonState();
}

class _BottomNavBarButtonState extends State<BottomNavBarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            blurRadius: 25,
            spreadRadius: 2,
          ),
        ],
      ),
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
            visible: widget.visible,
            child: Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
