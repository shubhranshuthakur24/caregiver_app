import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static launchURL(String website_url) async {
    if (await canLaunch(Uri.encodeFull("https://www." + website_url))) {
      await launch(Uri.encodeFull("https://www." + website_url));
    } else {
      throw 'Could not launch ';
    }
  }

  static phoneNumberLaunch(String phoneNumber) async {
    var url = "tel:" + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static emailLauncher(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
