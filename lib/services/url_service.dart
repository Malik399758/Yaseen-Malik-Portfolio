
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch structural reference pointer: $urlString');
    }
  }
}