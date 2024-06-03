import 'package:flutter/material.dart';

class SponserHistory extends StatefulWidget {
  const SponserHistory({super.key});

  @override
  State<SponserHistory> createState() => _SponserHistoryState();
}

class _SponserHistoryState extends State<SponserHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),

      ),
    );
  }
}
