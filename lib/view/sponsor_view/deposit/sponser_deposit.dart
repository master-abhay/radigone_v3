import 'package:flutter/material.dart';

class SponserDeposit extends StatefulWidget {
  const SponserDeposit({super.key});

  @override
  State<SponserDeposit> createState() => _SponserDepositState();
}

class _SponserDepositState extends State<SponserDeposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposit"),

      ),
    );
  }
}
