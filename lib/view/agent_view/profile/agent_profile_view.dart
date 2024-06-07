import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentProfileView extends StatefulWidget {
  const AgentProfileView({super.key});

  @override
  State<AgentProfileView> createState() => _AgentProfileViewState();
}

class _AgentProfileViewState extends State<AgentProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History View"),
      ),
    );
  }
}