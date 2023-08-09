import 'package:flutter/material.dart';
import '../../../../Core/Functions/url_lunch.dart';
import 'faq_list_tile.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text('Contact us :', style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 20),
        FaqListTile(
          title: "Chat with us",
          subTitle: 'You can chat with us here',
          isLeading: true,
          isTrailing: false,
          icon: Icons.chat,
          onPress: () {
            launchURL("0966769532", 'sms');
          },
        ),
        FaqListTile(
          title: "Send email",
          subTitle: 'you can send your proplem here',
          isLeading: true,
          isTrailing: false,
          icon: Icons.email_outlined,
          onPress: () {
            launchURL("mhamad.ibrahem532@gmail.com", 'mailto');
          },
        ),
        FaqListTile(
          title: "Customer services",
          subTitle: 'Call us of you need more support',
          isLeading: true,
          isTrailing: false,
          icon: Icons.phone,
          onPress: () {
            launchURL("0966769532", 'tel');
          },
        ),
      ],
    );
  }
}
