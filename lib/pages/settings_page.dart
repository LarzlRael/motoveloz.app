part of 'pages.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBarWithBackIcon(
        appBar: AppBar(
          title: AppBarTitle(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              GenericListTile(
                icon: Icons.color_lens,
                title: 'Tema oscuro',
                initialValue: themeChanger.isDarkTheme,
                onChanged: (value) {
                  themeChanger.setDarkTheme = value;
                },
              ),
              GenericListTile(
                icon: Icons.notifications,
                title: 'Notificaciones',
                initialValue: false,
                onChanged: (value) {
                  /* themeChanger.setDarkTheme = value; */
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
