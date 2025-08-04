import 'package:flutter/cupertino.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      this.text,

      {super.key,
        required this.gradient,
        this.style,
        this.alignment
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,textAlign: alignment, style: style),
    );
  }
}