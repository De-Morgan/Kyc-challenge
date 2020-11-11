import 'package:flutter/material.dart';

class KycLayoutBuilderHelper extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  const KycLayoutBuilderHelper(
      {Key key,
      this.mobileView = const _DefaultScreen(),
      @required this.tabletView})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.smallest.width < 650) {
          return mobileView;
        } else {
          return tabletView;
        }
      },
    );
  }
}

class _DefaultScreen extends StatelessWidget {
  const _DefaultScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        child: Row(
          children: const [
            Spacer(),
            Expanded(
                flex: 5,
                child: Text(
                  "This screen size is not supported, use a bigger screen size phone",
                  textAlign: TextAlign.center,
                )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
