import 'package:flutter/material.dart';

import 'package:mandalahearts/core/widgets/app_logo.dart';
import 'package:mandalahearts/enums/app_release_tag.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppLogo(tag: AppReleaseTag.beta)),
    );
  }
}
