import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentHistoryView extends StatefulWidget {
  const AgentHistoryView({super.key});

  @override
  State<AgentHistoryView> createState() => _AgentHistoryViewState();
}

class _AgentHistoryViewState extends State<AgentHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History View"),
      ),
    );
  }
}
