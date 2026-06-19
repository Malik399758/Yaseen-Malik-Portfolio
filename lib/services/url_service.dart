import 'package:url_launcher/url_launcher.dart';

class UrlService {

  // 🌐 Open any URL (GitHub, LinkedIn, YouTube)
  static Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception("Could not launch $urlString");
    }
  }

  // 📧 Send Email
  static Future<void> launchEmail({
    required String email,
    required String subject,
    required String body,
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
        'subject=$subject&body=$body',
      ),
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception("Could not launch email client");
    }
  }
}