import 'package:flutter/material.dart';
import '../../../View/Widget/CustomAppScaffold.dart';
import 'custom/contact_with_us.dart';
import 'custom/faq.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppScaffold(
        pageTitle: "Help Center",
        isBack: true,
        // isScroll: true,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Faq(), ContactWithUs()],
        ));
  }
}
