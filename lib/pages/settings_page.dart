part of 'pages.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              GenericListTile(
                icon: Icons.person_add_alt,
                title: 'Tema oscuro',
                initialValue: themeChanger.isDarkTheme,
                onChanged: (value) {
                  themeChanger.setDarkTheme = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
