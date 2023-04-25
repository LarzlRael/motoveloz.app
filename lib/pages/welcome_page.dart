part of './pages.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = 'welcome_page';
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final themeProvider = context.watch<ThemeProviderNotifier>();
    return Scaffold(
      body: Container(
        /* padding: const EdgeInsets.symmetric(horizontal: 20), */
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 475,
                child: Slideshow(
                  primaryColor: colors.primary,
                  secondaryColor: Colors.grey,
                  primaryBullet: 15.0,
                  secondaryBullet: 10.0,
                  slides: [
                    SlideItem(
                        assetImage: 'assets/1.png',
                        title: "¿Bloqueado y con muchas prácticas?",
                        subtitle:
                            "En nivel de dificultad no es un problema en subastareas"),
                    SlideItem(
                        assetImage: 'assets/2.png',
                        title: "¿Sabes la respuesta?",
                        subtitle:
                            "Ayuda con la tarea propuesta y gana dinero por ello"),
                    SlideItem(
                        assetImage: 'assets/3.png',
                        title: "Tareas de todas las materias",
                        subtitle:
                            "Porque enseñar también es una manera de aprender"),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 0,
              child: TextButton(
                child: Text('Saltar'),
                onPressed: () {
                  goToNextPage(context);
                },
              ),
            ),
            /* Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: const OnlyImageAndTitle(),
            ), */

            themeProvider.isLastPageSlider
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 50),
                      child: FilledButton(
                        onPressed: () {
                          goToNextPage(context);
                        },
                        child: Text('Comenzar'),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    UserPreferences.isFirstTime = true;
    Navigator.pushReplacementNamed(context, 'list_shops');
  }
}
