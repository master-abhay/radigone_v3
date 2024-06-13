import 'package:flutter/material.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_agent_earning_tile.dart';
import '../../../resources/components/custom_header.dart';

class AgentEarningView extends StatefulWidget {
  const AgentEarningView({super.key});

  @override
  State<AgentEarningView> createState() => _AgentEarningViewState();
}

class _AgentEarningViewState extends State<AgentEarningView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        const CustomHeaderWithBackButton(
          title: "Earning",
        ),
        Container(
            // height: double.infinity,
            // width: double.infinity,
            margin: const EdgeInsets.only(top: 120, bottom: 0),
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return CustomAgentEarningTile(
                            name: "Abhay",
                            email: "master.abhay71052@gmail.com",
                            date: "31-July-2002",
                            amount: '+1000',
                            status: 'Success',
                            onTap: () {});
                      })
                ],
              ),
            ))
      ],
    );
  }
}
