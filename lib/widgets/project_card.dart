
import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../models/project_model.dart';
import '../services/url_service.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration:  Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered ? (Matrix4.identity()..translate(0, -8)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withOpacity(0.8) : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.4 : 0.2),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Structural Placeholder image block representing standard design mockups
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.code, size: 40, color: AppColors.accent),
            ),
            const SizedBox(height: 20),
            Text(
              widget.project.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.project.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.textSecondary, height: 1.4, fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.project.techStack.map((tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(tech, style: TextStyle(color: AppColors.accent, fontSize: 11, fontWeight: FontWeight.w600 ,
                fontStyle: FontStyle.italic)),
              )).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                if (widget.project.githubLink != null)
                  IconButton(
                    icon: const Icon(Icons.launch, size: 20),
                    tooltip: "Source Code",
                    onPressed: () => UrlService.launchURL(widget.project.githubLink!),
                  ),
                const Spacer(),
                const Text("View Project", style: TextStyle(color: AppColors.accent, fontSize: 13, fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ),
      ),
    );
  }
}