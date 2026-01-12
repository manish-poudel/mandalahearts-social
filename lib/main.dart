import 'package:mandalahearts/l10n/app_localizations.dart';
import 'package:mandalahearts/routes.dart';
import 'package:mandalahearts/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MandalaHearts());
}

class MandalaHearts extends StatefulWidget {
  const MandalaHearts({super.key});

  @override
  State<MandalaHearts> createState() => _MandalaHeartsState();
}

class _MandalaHeartsState extends State<MandalaHearts> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MandalaHearts',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      routerConfig: routes,
      locale: Locale('en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
