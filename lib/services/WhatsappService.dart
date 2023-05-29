import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappService {
  Future<void> openWhatsAppChat(
      String country, String areaCode, String phoneNumber) async {
    final formattedPhoneNumber = areaCode + phoneNumber;
    // final url =
    //     // 'https://api.whatsapp.com/send?phone=$country$formattedPhoneNumber';
    //     'https://wa.me/$country$formattedPhoneNumber';
    final Uri url = Uri(
      scheme: 'https',
      // path: 'wa.me/$country$formattedPhoneNumber',
      path: 'wa.me/55$formattedPhoneNumber',
    );

    if (await canLaunchUrl(url)) {
      debugPrint(url.host);
      debugPrint(url.path);
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
