import 'package:flutter/material.dart';

class SponsorDepositView extends StatefulWidget {
  const SponsorDepositView({super.key});

  @override
  State<SponsorDepositView> createState() => _SponsorDepositViewState();
}

class _SponsorDepositViewState extends State<SponsorDepositView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposit"),

      ),
    );
  }
}
