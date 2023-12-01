import 'package:digiapi/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BodyTemplate extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isMainPage;

  const BodyTemplate(
      {Key? key,
      required this.body,
      required this.title,
      this.isMainPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: title,
          isLogo: isMainPage,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ));
  }
}
