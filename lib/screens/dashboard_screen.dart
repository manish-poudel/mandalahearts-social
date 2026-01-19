import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/app_logo.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/screens/all_post_screen.dart';

/// Dashboard Tabs
enum DashboardTab { topPosts, allPosts }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String? profileImageUrl = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(fontSize: 21),
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
      body: AllPostScreen(),
    );
  }
}
