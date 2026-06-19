
import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered ? (Matrix4.identity()..translate(0, -2)) : Matrix4.identity(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isSecondary ? Colors.transparent : AppColors.accent,
            foregroundColor: widget.isSecondary ? AppColors.accent : AppColors.background,
            side: BorderSide(color: AppColors.accent, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: _isHovered && !widget.isSecondary ? 8 : 0,
            shadowColor: AppColors.accent.withOpacity(0.4),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}