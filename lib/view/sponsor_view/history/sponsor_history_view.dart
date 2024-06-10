import 'package:flutter/material.dart';

class SponsorHistoryView extends StatefulWidget {
  const SponsorHistoryView({super.key});

  @override
  State<SponsorHistoryView> createState() => _SponsorHistoryViewState();
}

class _SponsorHistoryViewState extends State<SponsorHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),

      ),
    );
  }
}
