import 'package:flutter/material.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({super.key});

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {
  @override
  void initState() {
    super.initState();
    print("AllPostScreen initialized");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: Center(child: Text("All Posts Content Here"))),
      ],
    );
  }
}
