import 'package:flutter/material.dart';
import 'package:flutter_kyc/style/color.dart';
import 'package:flutter_kyc/ui/widget/loading_button.dart';

import 'widgets/profile_header.dart';
import 'widgets/verification_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VerificationCard(),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Spacer(),
                      KycRaisedButton(
                        label: "Begin Verification",
                        onPressed: () {},
                        color: greenColor,
                        width: 250,
                        textStyle: Theme.of(context).accentTextTheme.button,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
