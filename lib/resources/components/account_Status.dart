import 'package:flutter/cupertino.dart';

class AccountStatus extends StatefulWidget {
  const AccountStatus({super.key});

  @override
  State<AccountStatus> createState() => _AccountStatusState();
}

class _AccountStatusState extends State<AccountStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 20,
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Status",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13)),
        ],
      ),
    );
  }
}
