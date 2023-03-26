part of 'widgets.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = UserPreferences.isDarkTheme;
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: SearchShopStoreDelegate());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkTheme ? Colors.black54 : Colors.white54,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleText(
                  text: 'Buscar...',
                  lightColor: Colors.black54,
                  darkColor: Colors.white54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Icon(
                  Icons.search,
                  color: !isDarkTheme ? Colors.black54 : Colors.white54,
                )
              ],
            ),
          ),
        ));
  }
}
