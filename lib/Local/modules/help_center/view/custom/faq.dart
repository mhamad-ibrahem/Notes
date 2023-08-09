import 'package:flutter/material.dart';

import '../../../../Core/Functions/url_lunch.dart';
import 'faq_list_tile.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'FAQ :',
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 20),
        FaqListTile(
          title: "About Driver app",
          subTitle: '',
          isLeading: false,
          isTrailing: true,
          onPress: () {
            launchURL("www.spotify.com", "https");
          },
        ),
        FaqListTile(
          title: "How to accept order",
          subTitle: '',
          isLeading: false,
          isTrailing: true,
          onPress: () {
            launchURL("www.spotify.com", "https");
          },
        ),
        FaqListTile(
          title: "How to restore my account",
          subTitle: '',
          isLeading: false,
          isTrailing: true,
          onPress: () {
            launchURL("www.spotify.com", "https");
          },
        ),
        FaqListTile(
          title: "How made this app",
          subTitle: '',
          isLeading: false,
          isTrailing: true,
          onPress: () {
            launchURL("www.spotify.com", "https");
          },
        ),
      ],
    );
  }
}
