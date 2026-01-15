import 'package:flutter/material.dart';

class TopPostScreen extends StatefulWidget {
  const TopPostScreen({super.key});

  @override
  State<TopPostScreen> createState() => _TopPostScreenState();
}

class _TopPostScreenState extends State<TopPostScreen> {
  @override
  void initState() {
    super.initState();
    print("TopPostScreen initialized");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: Center(child: Text("Top Posts Content Here"))),
      ],
    );
  }
}
