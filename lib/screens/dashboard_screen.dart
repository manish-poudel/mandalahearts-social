import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/app_logo.dart';
import 'package:mandalahearts/core/widgets/selectable_pill.dart';
import 'package:mandalahearts/enums/app_release_tag.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/screens/all_post_screen.dart';
import 'package:mandalahearts/screens/top_post_screen.dart';

/// Dashboard Tabs
enum DashboardTab { topPosts, allPosts }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardTab _currentTab = DashboardTab.topPosts;

  final String? profileImageUrl = null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: AppLogo(fontSize: 21, tag: AppReleaseTag.beta),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push(AppRoute.addPostScreen.path);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                context.read<AuthRepository>().signOut();
                context.go(AppRoute.mandalaHeartApp.path);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(profileImageUrl!)
                    : null,
                child: profileImageUrl == null
                    ? Icon(Icons.person, size: 20, color: Colors.grey.shade600)
                    : null,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          /// 🔹 Pills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 10,
              children: [
                SelectablePill(
                  label: 'Top Posts',
                  isSelected: _currentTab == DashboardTab.topPosts,
                  onTap: () {
                    setState(() {
                      _currentTab = DashboardTab.topPosts;
                    });
                  },
                ),
                SelectablePill(
                  label: 'All Posts',
                  isSelected: _currentTab == DashboardTab.allPosts,
                  onTap: () {
                    setState(() {
                      _currentTab = DashboardTab.allPosts;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Small Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _currentTab == DashboardTab.topPosts
                  ? 'Showing top posts'
                  : 'Showing all posts',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withAlpha(140),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1,
              child: IndexedStack(
                index: _currentTab == DashboardTab.topPosts ? 0 : 1,
                children: const [TopPostScreen(), AllPostScreen()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
