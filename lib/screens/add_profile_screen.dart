import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Add profile screen"),
          TextButton(
            onPressed: () {
              context.go("/dashboard");
            },
            child: Text("Go to dashboard"),
          ),
        ],
      ),
    );
  }
}
