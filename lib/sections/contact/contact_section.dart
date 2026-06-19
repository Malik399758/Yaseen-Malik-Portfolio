import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../services/url_service.dart';
import '../../widgets/custom_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void sendEmail() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final message = messageController.text.trim();

    // Validation
    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // CALL SERVICE (PROPER WAY)
    UrlService.launchEmail(
      email: AppConstants.email,
      subject: "Portfolio Contact from $name",
      body: """
Name: $name
Email: $email

Message:
$message
""",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [

          // 🔹 HEADER
          const Row(
            children: [
              Text(
                "05. ",
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 20,
                  fontFamily: 'Courier',
                ),
              ),
              Text(
                "Get In Touch",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  color: AppColors.cardBg,
                  thickness: 2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // 🔹 FORM
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.cardBg.withOpacity(0.5),
              ),
            ),
            child: Column(
              children: [

                _inputField(
                  controller: nameController,
                  label: "Name",
                  icon: Icons.person,
                ),

                const SizedBox(height: 20),

                _inputField(
                  controller: emailController,
                  label: "Email",
                  icon: Icons.email,
                ),

                const SizedBox(height: 20),

                _inputField(
                  controller: messageController,
                  label: "Message",
                  icon: Icons.message,
                  maxLines: 5,
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: "Send Message",
                  onPressed: sendEmail,
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          // 🔹 SOCIAL LINKS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: Icons.email,
                url: AppConstants.email,
              ),
              const SizedBox(width: 18),
              _SocialIcon(
                icon: Icons.code,
                url: AppConstants.githubUrl,
              ),
              const SizedBox(width: 18),
              _SocialIcon(
                icon: Icons.business_center,
                url: AppConstants.linkedinUrl,
              ),
              const SizedBox(width: 18),
              _SocialIcon(
                icon: Icons.video_library,
                url: AppConstants.youtubeUrl,
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            "Designed & Developed by ${AppConstants.name}",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontFamily: 'Courier',
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.accent),
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),

        filled: true,
        fillColor: AppColors.background,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.cardBg),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}


class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({
    required this.icon,
    required this.url,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.15 : 1.0),

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient: isHovered
              ? const LinearGradient(
            colors: [
              Color(0xFF00E5FF),
              Color(0xFF3B82F6),
            ],
          )
              : null,

          color: isHovered
              ? null
              : const Color(0xff0F172A),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF)
                  .withOpacity(isHovered ? 0.35 : 0.1),
              blurRadius: isHovered ? 25 : 10,
              spreadRadius: isHovered ? 3 : 1,
            ),
          ],
        ),

        child: IconButton(
          icon: Icon(
            widget.icon,
            color: isHovered
                ? Colors.white
                : Colors.white.withOpacity(0.7),
          ),
          onPressed: () => UrlService.launchURL(widget.url),
        ),
      ),
    );
  }
}