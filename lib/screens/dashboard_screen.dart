import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/app_logo.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:mandalahearts/screens/all_post_screen.dart';

/// Dashboard Tabs
enum DashboardTab { topPosts, allPosts }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            context.read<AppUserRepository>().clearCache();
            context.read<PostRepository>().clearAllCache();
            context.read<AuthRepository>().signOut();
            context.pushReplacement(AppRoute.mandalaHeartApp.path);
          },
          child: AppLogo(fontSize: 21),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () {
              context.push(AppRoute.addPostScreen.path);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                context.push(AppRoute.profileViewScreen.path);
              },
              child: ValueListenableBuilder<AppUser?>(
                valueListenable: context.read<AppUserRepository>().userNotifier,
                builder: (context, user, _) {
                  final imageUrl = user?.basicDetails?.profilePictureUrl;

                  return Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.primary.withAlpha(40),
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                          ? NetworkImage(imageUrl)
                          : null,
                      child: (imageUrl == null || imageUrl.isEmpty)
                          ? Icon(Icons.person, size: 20)
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: AllPostScreen(),
    );
  }
}
