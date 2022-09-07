part of 'widgets.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? paddingPage;
  const PageContainer({
    super.key,
    required this.child,
    this.paddingPage,
    this.paddingHorizontal,
    this.paddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: paddingHorizontal == paddingVertical
            ? EdgeInsets.all(paddingPage ?? 20)
            : EdgeInsets.symmetric(
                horizontal: paddingHorizontal ?? 20,
                vertical: paddingVertical ?? 20),
        child: child,
      ),
    );
  }
}
