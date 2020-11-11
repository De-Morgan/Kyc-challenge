import 'package:flutter/material.dart';
import 'package:flutter_kyc/ui/widget/hackathon_widget.dart';

import 'profile_page.dart';
import 'widgets/profile_header.dart';
import 'widgets/selection_nav.dart';

class KycHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 20),
            HacathonWidget(
              hacathonMode: HacathonMode.Light,
            )
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SelectionNavSide(),
          ),
          Expanded(
            flex: 4,
            child: ProfilePage(),
          ),
        ],
      ),
    );
  }
}
