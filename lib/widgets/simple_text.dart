part of 'widgets.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? lineHeight;
  final EdgeInsetsGeometry? padding;
  final Color? lightColor;
  final Color? darkColor;
  const SimpleText({
    required this.text,
    Key? key,
    this.fontWeight,
    this.padding,
    this.fontSize,
    this.style,
    this.textAlign,
    this.lineHeight,
    this.lightColor,
    this.darkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = isDark ? darkColor : lightColor;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: style ??
            TextStyle(
              height: lineHeight,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
              color: color,
            ),
      ),
    );
  }
}
