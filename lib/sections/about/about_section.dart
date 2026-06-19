import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool isHoveringCard = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🌟 TITLE
          _heading()
              .animate()
              .fadeIn(duration: 500.ms)
              .slideX(begin: -0.3),

          const SizedBox(height: 60),

          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 900
                  ? _desktop()
                  : _mobile();
            },
          ),
        ],
      ),
    );
  }

  // 🏷 HEADING
  Widget _heading() {
    return Row(
      children: [
        const Text(
          "01.",
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          "About Me",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.15),
          ),
        ),
      ],
    );
  }

  // 🖥 DESKTOP
  Widget _desktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _bio()
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _educationCard(),
        ),
      ],
    );
  }

  // 📱 MOBILE
  Widget _mobile() {
    return Column(
      children: [
        _bio(),
        const SizedBox(height: 30),
        _educationCard(),
      ],
    );
  }

  // 📄 BIO
  Widget _bio() {
    return BioWidget();
  }

  // 🎓 EDUCATION CARD (HOVER + ANIMATION + TRANSITION)
  Widget _educationCard() {
    return MouseRegion(
      onEnter: (_) => setState(() => isHoveringCard = true),
      onExit: (_) => setState(() => isHoveringCard = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,

        transform: Matrix4.identity()
          ..translate(0.0, isHoveringCard ? -8 : 0)
          ..scale(isHoveringCard ? 1.02 : 1.0),

        padding: const EdgeInsets.all(26),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

          // 🌟 GLASS EFFECT
          color: const Color(0xff0F172A).withOpacity(0.85),

          border: Border.all(
            color: isHoveringCard
                ? const Color(0xFF00E5FF).withOpacity(0.5)
                : const Color(0xFF00E5FF).withOpacity(0.2),
          ),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF)
                  .withOpacity(isHoveringCard ? 0.25 : 0.12),
              blurRadius: isHoveringCard ? 40 : 25,
              spreadRadius: isHoveringCard ? 4 : 2,
            )
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Icon(
              Icons.school,
              color: Color(0xFF00E5FF),
              size: 34,
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .slideY(begin: 0.2),

            const SizedBox(height: 18),

            const Text(
              "Academic Journey",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "BS Software Engineering",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.85),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "CECOS University of IT & Emerging Sciences",
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideX(begin: 0.2);
  }
}

// bio class

class BioWidget extends StatefulWidget {
  const BioWidget({super.key});

  @override
  State<BioWidget> createState() => _BioWidgetState();
}

class _BioWidgetState extends State<BioWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("bio-section"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !isVisible) {
          setState(() => isVisible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: isVisible ? 1 : 0,

        child: AnimatedSlide(
          duration: const Duration(milliseconds: 700),
          offset: isVisible ? Offset.zero : const Offset(0, 0.2),
          curve: Curves.easeOutCubic,

          child: Text(
            "I am a passionate Flutter developer focused on building clean, scalable, and high-performance mobile applications.\n\n"
                "I enjoy transforming complex problems into simple, elegant and user-friendly experiences using modern UI/UX principles.\n\n"
                "Currently improving Flutter architecture, API integration, and production-level development.",
            style: TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.white.withOpacity(0.75),
            ),
          ),
        ),
      ),
    );
  }
}