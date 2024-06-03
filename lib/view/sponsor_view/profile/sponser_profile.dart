import 'package:flutter/material.dart';

class SponserProfile extends StatefulWidget {
  const SponserProfile({super.key});

  @override
  State<SponserProfile> createState() => _SponserProfileState();
}

class _SponserProfileState extends State<SponserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
    );
  }
}
