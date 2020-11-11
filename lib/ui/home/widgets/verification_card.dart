import 'package:flutter/material.dart';
import 'package:flutter_kyc/style/color.dart';
import 'package:flutter_kyc/ui/mixin/alert_dialog_mixin.dart';

import 'verification_dialog_child.dart';

class VerificationCard extends StatefulWidget {
  @override
  _VerificationCardState createState() => _VerificationCardState();
}

class _VerificationCardState extends State<VerificationCard>
    with AlertDialogMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verification",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 6),
            const Text("Complete step below to ge verified"),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: _VerificationStageCard(
                    level: 1,
                    title: "Bvn verification",
                    onPressed: () {
                      showKycDialog(
                        "Bvn Verification",
                        child: VerificationDialogChild(),
                        onPressed: () {},
                      );
                    },
                  )),
                  const SizedBox(width: 16),
                  const Expanded(
                      child: _VerificationStageCard(
                    level: 2,
                    title: "Passport verification",
                  )),
                  const SizedBox(width: 16),
                  const Expanded(
                      child: _VerificationStageCard(
                    level: 3,
                    title: "Link Bank verification",
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _VerificationStageCard extends StatelessWidget {
  final int level;
  final String title;
  final VoidCallback onPressed;

  const _VerificationStageCard(
      {Key key, this.level = 1, this.title = "", this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: backgroundGreyColor,
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: Placeholder(),
            ),
            const SizedBox(height: 16),
            Text("Level $level"),
            const SizedBox(height: 6),
            Text(title)
          ],
        ),
      ),
    );
  }
}
