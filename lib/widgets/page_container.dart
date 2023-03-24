part of 'widgets.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? paddingPage;

  const PageContainer({
    super.key,
    required this.child,
    this.paddingPage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: paddingPage,
        child: child,
      ),
    );
  }
}
