import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/auth/bloc/auth_event.dart';
import 'package:mandalahearts/l10n/app_localizations.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/routes.dart';
import 'package:mandalahearts/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(firebaseAuth: FirebaseAuth.instance),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocProvider<AuthBloc>(
            create: (_) =>
                AuthBloc(authRepository: context.read<AuthRepository>())
                  ..add(const AuthEvent.started()),
            child: const MandalaHearts(),
          );
        },
      ),
    ),
  );
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
