import 'package:flutter/material.dart';
import 'package:flutter_kyc/style/color.dart';

class HacathonWidget extends StatelessWidget {
  final HacathonMode hacathonMode;

  const HacathonWidget({Key key, this.hacathonMode = HacathonMode.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          width: 20,
          child: CustomPaint(
            painter: _HacathonPainter(hacathonMode),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "HacaThon".toUpperCase(),
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: hacathonMode == HacathonMode.Light
                  ? Colors.white
                  : Colors.black),
        )
      ],
    );
  }
}

class _HacathonPainter extends CustomPainter {
  final HacathonMode hacathonMode;

  _HacathonPainter(this.hacathonMode);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width * (1 - (2 / 5));
    final maxHeight = size.height * (1 - (2 / 5));
    final center = Size(maxWidth, maxHeight).center(Offset.zero);
    final midMargin = maxHeight / 10;
    final offset = Offset(0, size.height / 2);
    final off = offset - Offset(maxWidth / 2, maxHeight / 2);

    Paint brush = Paint()
      ..color = hacathonMode == HacathonMode.Light ? Colors.white : primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 30;

    canvas.drawCircle(offset, size.width, brush);

    final star = Path();
    star.moveTo(off.dx + maxWidth * (1 - 1 / 3), off.dy);
    star.lineTo(off.dx, off.dy + center.dy + midMargin);
    star.lineTo(off.dx + center.dx - midMargin, off.dy + center.dy + midMargin);
    star.lineTo(off.dx + center.dx - midMargin, off.dy + maxHeight);
    star.lineTo(off.dx + maxWidth, off.dy + center.dy - midMargin);
    star.lineTo(
        off.dx + maxWidth * (1 - 1 / 3), off.dy + center.dy - midMargin);

    canvas.drawPath(
        star,
        Paint()
          ..color =
              hacathonMode == HacathonMode.Light ? primaryColor : Colors.white);
  }
}

enum HacathonMode { Light, dark }
