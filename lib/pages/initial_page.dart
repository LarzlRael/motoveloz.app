part of 'pages.dart';

class InitialPage extends StatelessWidget {
  static const String routeName = 'initial_page';
  const InitialPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkIsFirstPage(context),
        builder: (_, snapshot) {
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<void> checkIsFirstPage(BuildContext context) async {
    final isFirstPage = await UserPreferences.isFirstTime;
    if (isFirstPage) {
      context.go('/welcome');
    } else {
      context.go('/list_shops');
    }
  }
}
