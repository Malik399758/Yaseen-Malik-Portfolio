
import 'package:flutter/material.dart';
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.radio_button_checked, color: AppColors.accent, size: 20),
                        if (index != academicTimeline.length - 1)
                          Container(width: 2, height: 100, color: AppColors.cardBg),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(node.period, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontFamily: 'Courier')),
                          const SizedBox(height: 6),
                          Text(node.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          Text(node.institution, style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.7), fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Text(node.description, style: const TextStyle(color: AppColors.textSecondary, height: 1.5, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}