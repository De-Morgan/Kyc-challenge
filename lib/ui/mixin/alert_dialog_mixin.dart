import 'package:flutter/material.dart';
import 'package:flutter_kyc/ui/widget/loading_button.dart';

mixin AlertDialogMixin<T extends StatefulWidget> on State<T> {
  void showKycDialog(
    String title, {
    String buttonLabel = "Confirm",
    @required Widget child,
    @required VoidCallback onPressed,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            children: <Widget>[
              Text(
                "$title",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              Expanded(child: child),
              const SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  KycRaisedButton(
                    label: buttonLabel,
                    onPressed: onPressed,
                    width: 120,
                  )
                ],
              )
            ],
          );
        });
  }
}
