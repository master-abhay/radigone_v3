import 'package:flutter/cupertino.dart';

import '../colors.dart';

class UpperBackgroundDesign extends StatefulWidget {
  const UpperBackgroundDesign({super.key});

  @override
  State<UpperBackgroundDesign> createState() => _UpperBackgroundDesignState();
}

class _UpperBackgroundDesignState extends State<UpperBackgroundDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 4,
      decoration: const BoxDecoration(
          gradient: MyColorScheme.yellowLinearGradient,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
    );
  }
}

class LowerBackgroundDesign extends StatefulWidget {
  const LowerBackgroundDesign({super.key});

  @override
  State<LowerBackgroundDesign> createState() => _LowerBackgroundDesignState();
}

class _LowerBackgroundDesignState extends State<LowerBackgroundDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
    );
  }
}
