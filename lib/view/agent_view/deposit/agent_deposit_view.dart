import 'package:flutter/material.dart';

class AgentDepositView extends StatefulWidget {
  const AgentDepositView({super.key});

  @override
  State<AgentDepositView> createState() => _AgentDepositViewState();
}

class _AgentDepositViewState extends State<AgentDepositView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deposit View"),
      ),
    );
  }
}
