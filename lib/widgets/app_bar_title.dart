part of 'widgets.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    this.fontSize = 25,
  }) : super(key: key);
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            iconPath,
            height: 35,
          ),
        ),
        SimpleText(
          left: 10,
          text: appName,
          /* color: Colors.black, */
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
