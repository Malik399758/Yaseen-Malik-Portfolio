
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../models/project_model.dart';
import '../../responsive/responsive_layout.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveLayout.isDesktop(context) ? 3 : (ResponsiveLayout.isTablet(context) ? 2 : 1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text("03. ", style: TextStyle(color: AppColors.accent, fontSize: 20, fontFamily: 'Courier')),
              Text("Production Implementations", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Expanded(child: Divider(color: AppColors.cardBg, thickness: 2))
            ],
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sampleProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 420,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: sampleProjects[index]);
            },
          ),
        ],
      ),
    );
  }
}