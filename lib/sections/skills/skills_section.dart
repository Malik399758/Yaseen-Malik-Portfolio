import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_constants.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    "Flutter",
    "Dart",
    "Firebase",
    "REST API",
    "Hive",
    "SQLite",
    "Git & GitHub",
    "UI/UX Design"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🌟 TITLE
          _heading()
              .animate()
              .fadeIn(duration: 500.ms)
              .slideX(begin: -0.2),

          const SizedBox(height: 50),

          // 🎯 SKILLS GRID
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              skills.length,
                  (index) => _SkillChip(
                label: skills[index],
                delay: index * 80,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🏷 MODERN HEADING
  Widget _heading() {
    return Row(
      children: [
        const Text(
          "02.",
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: 10),

        const Text(
          "Technical Skills",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.12),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final int delay;

  const _SkillChip({
    required this.label,
    required this.delay,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,

        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),

        transform: Matrix4.identity()
          ..translate(0.0, isHovered ? -4 : 0)
          ..scale(isHovered ? 1.05 : 1.0),

        decoration: BoxDecoration(
          color: const Color(0xff0F172A),
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: isHovered
                ? const Color(0xFF00E5FF).withOpacity(0.6)
                : Colors.white.withOpacity(0.1),
          ),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF)
                  .withOpacity(isHovered ? 0.25 : 0.08),
              blurRadius: isHovered ? 25 : 10,
              spreadRadius: 1,
            )
          ],
        ),

        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isHovered
                ? const Color(0xFF00E5FF)
                : Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
      duration: 500.ms,
      delay: Duration(milliseconds: widget.delay),
    )
        .slideY(
      begin: 0.2,
      curve: Curves.easeOut,
      delay: Duration(milliseconds: widget.delay),
    );
  }
}