
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../services/url_service.dart';
import '../../widgets/custom_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const Row(
            children: [
              Text("05. ", style: TextStyle(color: AppColors.accent, fontSize: 20, fontFamily: 'Courier')),
              Text("Get In Touch", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Expanded(child: Divider(color: AppColors.cardBg, thickness: 2))
            ],
          ),
          const SizedBox(height: 40),
          Container(
            // Use BoxConstraints to limit the width of the form on desktop
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildInputField(label: "Name", icon: Icons.person),
                const SizedBox(height: 20),
                _buildInputField(label: "Email", icon: Icons.email),
                const SizedBox(height: 20),
                _buildInputField(label: "Message", icon: Icons.message, maxLines: 5),
                const SizedBox(height: 30),
                CustomButton(text: "Send Transmission", onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: const Icon(Icons.code), onPressed: () => UrlService.launchURL(AppConstants.githubUrl)),
              const SizedBox(width: 20),
              IconButton(icon: const Icon(Icons.business_center), onPressed: () => UrlService.launchURL(AppConstants.linkedinUrl)),
              const SizedBox(width: 20),
              IconButton(icon: const Icon(Icons.video_library), onPressed: () => UrlService.launchURL(AppConstants.youtubeUrl)),
            ],
          ),
          const SizedBox(height: 20),
          Text("Designed & Programmed by ${AppConstants.name}", style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontFamily: 'Courier')),
        ],
      ),
    );
  }

  Widget _buildInputField({required String label, required IconData icon, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.accent, size: 20),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.cardBg), borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.accent), borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }
}