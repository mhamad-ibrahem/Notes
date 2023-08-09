import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url, String method) async {
  //use sms method for sms
  //use tel method for telephone calling
  //use mailto for email contact
  //use https for websites
  final Uri uri = Uri(scheme: method, path: url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    AppToasts.errorToast("cant lunch url");
    throw "cant lunch url";
  }
}
