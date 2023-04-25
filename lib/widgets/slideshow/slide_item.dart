part of '../widgets.dart';

class SlideItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  const SlideItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;
    return Column(
      children: [
        Image.asset(
          assetImage,
          height: 250,
          width: 250,
        ),
        SizedBox(height: 5),
        Text(title, style: titleStyle, textAlign: TextAlign.center),
        SizedBox(height: 5),
        Text(title, style: captionStyle, textAlign: TextAlign.center),
      ],
    );
  }
}
