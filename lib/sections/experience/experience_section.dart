
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_constants.dart';
import '../../models/timeline_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text("04. ", style: TextStyle(color: AppColors.accent, fontSize: 20, fontFamily: 'Courier')),
              Text("The Engineering Journey", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Expanded(child: Divider(color: AppColors.cardBg, thickness: 2))
            ],
          ),
          const SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: academicTimeline.length,
              itemBuilder: (context, index) {
                final node = academicTimeline[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),

                  child: AnimatedTimelineItem(
                    fromLeft: index % 2 == 0,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // 🔵 Timeline Dot + Line
                        Column(
                          children: [
                            const Icon(
                              Icons.radio_button_checked,
                              color: AppColors.accent,
                              size: 20,
                            ),

                            if (index != academicTimeline.length - 1)
                              Container(
                                width: 2,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.cardBg,
                                      AppColors.accent.withOpacity(0.3),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(width: 20),

                        // 📄 Content Card (UPGRADED)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: const Color(0xff0F172A),
                              borderRadius: BorderRadius.circular(14),

                              border: Border.all(
                                color: AppColors.accent.withOpacity(0.15),
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.accent.withOpacity(0.08),
                                  blurRadius: 20,
                                  spreadRadius: 1,
                                )
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  node.period,
                                  style: const TextStyle(
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courier',
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  node.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),

                                Text(
                                  node.institution,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  node.description,
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    height: 1.6,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}

class AnimatedTimelineItem extends StatefulWidget {
  final Widget child;
  final bool fromLeft;

  const AnimatedTimelineItem({
    super.key,
    required this.child,
    this.fromLeft = true,
  });

  @override
  State<AnimatedTimelineItem> createState() => _AnimatedTimelineItemState();
}

class _AnimatedTimelineItemState extends State<AnimatedTimelineItem> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !visible) {
          setState(() => visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: visible ? 1 : 0,

        child: AnimatedSlide(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          offset: visible
              ? Offset.zero
              : Offset(widget.fromLeft ? -0.3 : 0.3, 0),

          child: widget.child,
        ),
      ),
    );
  }
}