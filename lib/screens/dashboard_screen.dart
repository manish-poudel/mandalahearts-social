import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _signOut(BuildContext bc) async {
    print("sign out");
    try {
      print("signout");
      await context.read<AuthRepository>().signOut();
      final router = GoRouter.of(context);
      router.pushReplacement("/");
    } catch (e) {
      // Show error
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error signing out: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: _user == null
            ? const Text('No user logged in')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello, ${_user!.uid ?? _user!.uid}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _signOut(context),
                    child: const Text('Log Out'),
                  ),
                ],
              ),
      ),
    );
  }
}
