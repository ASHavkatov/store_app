import 'package:flutter/material.dart';

class StoreButtonClickable extends StatefulWidget {
  const StoreButtonClickable({
    super.key,
    required this.text,
    required this.arrow,
    required this.callback,
    this.width = double.infinity,
    this.height = 54,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
  });

  final String text;
  final bool arrow;
  final VoidCallback callback;
  final double width, height;

  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  @override
  State<StoreButtonClickable> createState() => _StoreButtonClickableState();
}

class _StoreButtonClickableState extends State<StoreButtonClickable> {
  bool _isActive = false;

  void _toggleColor() {
    setState(() {
      _isActive = !_isActive;
    });
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: widget.height,
        decoration: BoxDecoration(
          color: _isActive ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(10),
          border:Border.all(color:_isActive ? Colors.black: Colors.black.withValues(alpha: 0.3))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: _isActive ? widget.activeTextColor : widget.inactiveTextColor,
                fontSize: 16,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}