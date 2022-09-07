part of 'widgets.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextStyle? style;
  final double? marginVertical;
  final double? marginHorizontal;
  final TextAlign? textAlign;
  final double? lineHeight;
  const SimpleText({
    required this.text,
    Key? key,
    this.fontWeight,
    this.marginVertical,
    this.marginHorizontal,
    this.fontSize,
    this.color,
    this.style,
    this.textAlign,
    this.lineHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 0, vertical: marginVertical ?? 0),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: style ??
            TextStyle(
              height: lineHeight,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
              color: color != null
                  ? isDarkMode
                      ? Colors.black
                      : Colors.white
                  : color,
            ),
      ),
    );
  }
}
