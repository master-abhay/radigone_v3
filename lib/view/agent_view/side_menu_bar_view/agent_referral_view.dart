import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/components/custom_agent_referal_tile.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_agent_earning_tile.dart';
import '../../../resources/components/custom_header.dart';

class AgentReferralView extends StatefulWidget {
  const AgentReferralView({super.key});

  @override
  State<AgentReferralView> createState() => _AgentReferralViewState();
}

class _AgentReferralViewState extends State<AgentReferralView> {
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
          title: "Referrals",
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
                        return CustomAgentReferralTile(name: "Abhay", email: "Master.ahay", date: "31-93-3222", onTap: (){});
                      })
                ],
              ),
            ))
      ],
    );
  }
}
