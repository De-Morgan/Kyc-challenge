import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kyc/style/color.dart';
import 'package:flutter_kyc/ui/animation/three_bounce.dart';

class KycRaisedButton extends StatelessWidget {
  final Stream<bool> loadingStream;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final TextStyle textStyle;

  const KycRaisedButton(
      {Key key,
      this.label = "",
      this.color = primaryColor,
      this.onPressed,
      this.textStyle,
      this.width = double.maxFinite,
      this.loadingStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: disabledButtonColor,
      width: width,
      child: StreamBuilder<bool>(
          initialData: false,
          stream: loadingStream,
          builder: (context, snapshot) {
            if (snapshot.data) {
              return const SpinKitThreeBounce(
                color: whiteColor,
              );
            }
            return RaisedButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                label,
                style: textStyle,
              ),
            );
          }),
    );
  }
}
