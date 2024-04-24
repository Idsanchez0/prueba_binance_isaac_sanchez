import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class WhatsappService {
  whatsappRedirect({required String message}) async {
    Uri url = Uri.parse(Platform.isAndroid
        ? 'whatsapp://send?phone=593994935022&text=$message'
        : 'https://api.whatsapp.com/send?phone=593994935022&text=$message');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

WhatsappService whatsappServices = WhatsappService();
