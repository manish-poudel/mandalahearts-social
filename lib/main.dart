import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/app/env/env.dart';
import 'package:mandalahearts/core/services/firestore/firestore_spiritual_master_service.dart';
import 'package:mandalahearts/core/services/firestore/firestore_user_post_service.dart';
import 'package:mandalahearts/core/services/firestore/firestore_user_service.dart';
import 'package:mandalahearts/core/services/supabase/supabase_file_storage.dart';
import 'package:mandalahearts/features/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/features/auth/bloc/auth_event.dart';
import 'package:mandalahearts/l10n/app_localizations.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/app/routes.dart';
import 'package:mandalahearts/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:mandalahearts/repository/spiritual_master_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(firebaseAuth: FirebaseAuth.instance),
        ),
        RepositoryProvider<AppUserRepository>(
          create: (_) => AppUserRepository(
            userDB: FirestoreUserService(),
            storage: SupabaseFileStorage(Supabase.instance.client),
          ),
        ),
        RepositoryProvider<PostRepository>(
          create: (_) => PostRepository(
            postDb: FirestoreUserPostService(),
            storage: SupabaseFileStorage(Supabase.instance.client),
            userService: FirestoreUserService(),
          ),
        ),
        RepositoryProvider<SpiritualMasterRepository>(
          create: (_) =>
              SpiritualMasterRepository(db: FirestoreSpiritualMasterService()),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: context.read<AuthRepository>(),
          appUserRepository: context.read<AppUserRepository>(),
          postRepository: context.read<PostRepository>(),
        )..add(AuthEvent.started()),
        child: const MandalaHearts(),
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
      routerConfig: GoRouter(
        initialLocation: AppRoute.mandalaHeartApp.path,
        routes: appRoutes,
      ),
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
