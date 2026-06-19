import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_constants.dart';
import '../../responsive/responsive_layout.dart';
import '../../widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onHireMePressed;

  const HeroSection({super.key, required this.onHireMePressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🌟 BACKGROUND GLOWS (SOFT + PREMIUM)
        Positioned(
          top: 80,
          left: -120,
          child: _glow(),
        ),
        Positioned(
          bottom: 60,
          right: -120,
          child: _glow(),
        ),

        ResponsiveLayout(
          desktop: _desktop(context),
          mobile: _mobile(context),
        ),
      ],
    );
  }

  // 🌟 SOFT GLOW (MORE PREMIUM THAN HARSH NEON)
  Widget _glow() {
    return Container(
      height: 260,
      width: 260,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0xFF00E5FF).withOpacity(0.12),
            Colors.transparent,
          ],
        ),
      ),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scale(
      duration: 4000.ms,
      begin: const Offset(1, 1),
      end: const Offset(1.15, 1.15),
      curve: Curves.easeInOut,
    );
  }

  // 🖥 DESKTOP LAYOUT (PRO BALANCE)
  Widget _desktop(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height - 70,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _text(isCenter: false)),
          const SizedBox(width: 60),
          const Expanded(child: UltraProfile()),
        ],
      ),
    );
  }

  // 📱 MOBILE LAYOUT
  Widget _mobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          const UltraProfile(),
          const SizedBox(height: 40),
          _text(isCenter: true),
        ],
      ),
    );
  }

  // 🧠 TEXT SECTION (IMPROVED TYPOGRAPHY HIERARCHY)
  Widget _text({required bool isCenter}) {
    return Column(
      crossAxisAlignment:
      isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [

        // 👋 SMALL INTRO
        const Text(
          "Hi, my name is",
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontSize: 14,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(duration: 400.ms),

        const SizedBox(height: 14),

        // 👤 NAME (MAIN FOCUS)
        Text(
          AppConstants.name,
          style: const TextStyle(
            fontSize: 54,
            fontWeight: FontWeight.bold,
            height: 1.05,
            color: Colors.white,
          ),
        ).animate().fadeIn(delay: 150.ms),

        const SizedBox(height: 10),

        // 💼 ROLE
        Text(
          AppConstants.role,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.75),
          ),
        ).animate().fadeIn(delay: 300.ms),

        const SizedBox(height: 18),

        // 📄 TAGLINE
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            AppConstants.tagline,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: 15.5,
              height: 1.7,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ).animate().fadeIn(delay: 450.ms),

        const SizedBox(height: 35),

        // 🎯 CTA BUTTONS (MODERN WRAP)
        Wrap(
          spacing: 14,
          runSpacing: 12,
          alignment:
          isCenter ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: "Hire Me",
              onPressed: onHireMePressed,
            ),
            CustomButton(
              text: "Download CV",
              isSecondary: true,
              onPressed: () {},
            ),
          ],
        ).animate().fadeIn(delay: 600.ms),
      ],
    );
  }
}

class UltraProfile extends StatefulWidget {
  const UltraProfile({super.key});

  @override
  State<UltraProfile> createState() => _UltraProfileState();
}

class _UltraProfileState extends State<UltraProfile> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    final size = w < 600 ? 180 : w < 1000 ? 240 : 300;

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),

      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: hover ? 1.05 : 1.0,

        child: Stack(
          alignment: Alignment.center,
          children: [

            // 🌟 SOFT GLOW (LESS HARSH, MORE PREMIUM)
            Container(
              height: size + 50,
              width: size + 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00E5FF).withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 🔄 BORDER RING
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: hover ? 1 : 0),
              duration: const Duration(milliseconds: 500),
              builder: (context, v, _) {
                return Transform.rotate(
                  angle: v * 0.15,
                  child: Container(
                    height: size + 20,
                    width: size + 20,
                    padding: const EdgeInsets.all(4),

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Color(0xFF00E5FF),
                          Color(0xFF3B82F6),
                          Color(0xFF8B5CF6),
                          Color(0xFF00E5FF),
                        ],
                      ),
                    ),

                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0F172A),
                      ),
                    ),
                  ),
                );
              },
            ),

            // 🧊 IMAGE CORE
            Container(
              height: (size + 20).toDouble(),
              width: (size + 20).toDouble(),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff0F172A),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00E5FF)
                        .withOpacity(hover ? 0.3 : 0.18),
                    blurRadius: hover ? 40 : 25,
                    spreadRadius: hover ? 5 : 2,
                  ),
                ],
              ),

              child: ClipOval(
                child: Image.asset(
                  "assets/images/myself.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.15, curve: Curves.easeOut);
  }
}