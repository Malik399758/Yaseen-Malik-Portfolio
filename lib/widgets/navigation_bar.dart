import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants/app_constants.dart';
import '../responsive/responsive_layout.dart';

class NavigationBarWeb extends StatefulWidget
    implements PreferredSizeWidget {
  final Function(int) onNavItemSelect;
  final int activeIndex;

  const NavigationBarWeb({
    super.key,
    required this.onNavItemSelect,
    required this.activeIndex,
  });

  @override
  State<NavigationBarWeb> createState() => _NavigationBarWebState();

  @override
  Size get preferredSize => const Size.fromHeight(75);
}

class _NavigationBarWebState extends State<NavigationBarWeb> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),

          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

            title: _buildLogo()
                .animate()
                .fadeIn(duration: 500.ms)
                .slideX(begin: -0.2),

            actions: isMobile
                ? null
                : _buildNavItems()
                .animate()
                .fadeIn(duration: 600.ms)
                .slideX(begin: 0.2),
          ),
        ),
      ),
    );
  }

  // 🌟 LOGO
  Widget _buildLogo() {
    return RichText(
      text: const TextSpan(
        text: 'YM',
        style: TextStyle(
          color: Color(0xFF00E5FF),
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        children: [
          TextSpan(
            text: '.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // 🚀 NAV ITEMS
  List<Widget> _buildNavItems() {
    return [
      const SizedBox(width: 20),

      ...List.generate(AppConstants.navItems.length, (index) {
        final isActive = widget.activeIndex == index;
        final isHovered = hoveredIndex == index;

        return MouseRegion(
          onEnter: (_) => setState(() => hoveredIndex = index),
          onExit: (_) => setState(() => hoveredIndex = -1),

          child: GestureDetector(
            onTap: () => widget.onNavItemSelect(index),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,

              margin: const EdgeInsets.symmetric(horizontal: 12),

              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

                color: isActive
                    ? const Color(0xFF00E5FF).withOpacity(0.08)
                    : isHovered
                    ? Colors.white.withOpacity(0.05)
                    : Colors.transparent,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppConstants.navItems[index],
                    style: TextStyle(
                      color: isActive
                          ? const Color(0xFF00E5FF)
                          : Colors.white70,
                      fontSize: 15,
                      fontWeight: isActive
                          ? FontWeight.w600
                          : FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 🎯 Animated underline
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 2,
                    width: isActive ? 20 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E5FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),

      const SizedBox(width: 30),
    ];
  }
}